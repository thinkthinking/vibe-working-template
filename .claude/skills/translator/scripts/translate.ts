#!/usr/bin/env tsx

import OpenAI from "openai";
import { readFileSync, writeFileSync } from "fs";
import { resolve } from "path";

// Parse command line arguments
const args = process.argv.slice(2);
const getArg = (flag: string): string | undefined => {
  const index = args.indexOf(flag);
  return index !== -1 ? args[index + 1] : undefined;
};

const inputFile = getArg("--input");
const outputFile = getArg("--output");
const direction = getArg("--direction") as "zh-to-en" | "en-to-zh" | undefined;

if (!inputFile || !direction) {
  console.error("Usage: tsx translate.ts --input <file> --output <file> --direction <zh-to-en|en-to-zh>");
  process.exit(1);
}

if (direction !== "zh-to-en" && direction !== "en-to-zh") {
  console.error("Direction must be either 'zh-to-en' or 'en-to-zh'");
  process.exit(1);
}

// Auto-generate output filename if not specified
let finalOutputFile = outputFile;
if (!finalOutputFile) {
  if (direction === "zh-to-en") {
    finalOutputFile = inputFile.replace(/_cn\.md$/, ".md");
  } else {
    finalOutputFile = inputFile.replace(/\.md$/, "_cn.md");
  }
}

// Initialize OpenAI client with ZenMux endpoint
const openai = new OpenAI({
  baseURL: "https://zenmux.ai/api/v1",
  apiKey: process.env.ZENMUX_API_KEY,
});

// Translation system prompts
const systemPrompts = {
  "zh-to-en": `You are a professional technical translator specializing in software documentation.

Translate the following Chinese markdown document to English with these requirements:

1. **INTJ Style**: Be direct, precise, and efficient. No flowery language or unnecessary elaboration.
2. **Technical Accuracy**: Preserve all technical terms, code snippets, and links exactly.
3. **Native Fluency**: Sound like a native English technical writer, not a translation.
4. **Markdown Preservation**: Keep all formatting, including headers, lists, code blocks, and links.
5. **Conciseness**: Prefer shorter, clearer expressions over verbose ones.
6. **GitHub Context**: Understand common GitHub/software terminology.

Output ONLY the translated markdown. Do not add explanations or comments.`,

  "en-to-zh": `You are a professional technical translator specializing in software documentation.

Translate the following English markdown document to Chinese with these requirements:

1. **INTJ Style**: Be direct, precise, and efficient. No flowery language or unnecessary elaboration (直接、精准、高效，不要冗余表达).
2. **Technical Accuracy**: Preserve all technical terms, code snippets, and links exactly.
3. **Native Fluency**: Sound like a native Chinese technical writer, not a translation.
4. **Markdown Preservation**: Keep all formatting, including headers, lists, code blocks, and links.
5. **Conciseness**: Prefer shorter, clearer expressions over verbose ones (简洁利索).
6. **GitHub Context**: Understand common GitHub/software terminology.
7. **Technical Terms**: Keep common technical terms in English when appropriate (e.g., "API", "TypeScript", "React").

Output ONLY the translated markdown. Do not add explanations or comments.`,
};

async function translate() {
  try {
    console.log(`Reading input file: ${inputFile}`);
    const content = readFileSync(resolve(inputFile), "utf-8");

    console.log(`Translating (${direction})...`);
    const completion = await openai.chat.completions.create({
      model: "openai/gpt-5.1",
      messages: [
        {
          role: "system",
          content: systemPrompts[direction],
        },
        {
          role: "user",
          content: content,
        },
      ],
      temperature: 0.3, // Lower temperature for more consistent, precise translations
    });

    const translatedContent = completion.choices[0].message.content;

    if (!translatedContent) {
      throw new Error("Translation failed: empty response");
    }

    console.log(`Writing output file: ${finalOutputFile}`);
    writeFileSync(resolve(finalOutputFile), translatedContent, "utf-8");

    console.log("✓ Translation completed successfully");
    console.log(`  Input:  ${inputFile}`);
    console.log(`  Output: ${finalOutputFile}`);
    console.log(`  Direction: ${direction}`);
  } catch (error) {
    console.error("Translation failed:", error);
    process.exit(1);
  }
}

translate();
