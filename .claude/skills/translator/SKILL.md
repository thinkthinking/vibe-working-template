---
name: translator
description: Translate markdown documentation between Chinese and English for GitHub projects. Use when translating README files, documentation, or any markdown content. Supports zh-to-en and en-to-zh directions with INTJ-style precision and clarity.
allowed-tools: Read, Write, Bash
---

# Translator Skill

Translate markdown documentation between Chinese and English with accuracy, native fluency, and concise INTJ-style expression.

## Features

- **Bidirectional translation**: Chinese ↔ English
- **Markdown-aware**: Preserves formatting, code blocks, and links
- **INTJ-style**: Direct, precise, efficient translations
- **GitHub-optimized**: Perfect for README files and project documentation

## Usage

### Translate from Chinese to English

```
Translate README_cn.md from Chinese to English
```

or

```
Translate this Chinese document to English: docs/guide_cn.md
```

### Translate from English to Chinese

```
Translate README.md from English to Chinese
```

or

```
Translate this English document to Chinese: docs/guide.md
```

## Instructions

When the user requests a translation:

1. **Identify the files and direction**:
   - Source file (input)
   - Target file (output, optional - will auto-generate if not specified)
   - Direction: `zh-to-en` or `en-to-zh`

2. **Read the source file** using the Read tool

3. **Run the translation script**:
   ```bash
   npx tsx .claude/skills/translator/scripts/translate.ts \
     --input <source-file> \
     --output <target-file> \
     --direction <zh-to-en|en-to-zh>
   ```

4. **Verify the output** and inform the user

## Translation Guidelines

The script follows these principles:

- **Accuracy**: Preserve technical terms and meaning
- **Native fluency**: Sound natural in the target language
- **Conciseness**: INTJ-style directness, no fluff
- **Markdown preservation**: Keep all formatting intact
- **Technical context**: Understand software/GitHub terminology

## Auto-generated filenames

If the user doesn't specify an output file:

- Chinese to English: `filename_cn.md` → `filename.md`
- English to Chinese: `filename.md` → `filename_cn.md`

## Examples

**Example 1**: Basic translation
```
User: Translate README_cn.md to English
You: I'll translate README_cn.md from Chinese to English
- Input: README_cn.md
- Output: README.md (auto-generated)
- Direction: zh-to-en
```

**Example 2**: Custom output
```
User: Translate docs/guide.md to Chinese as docs/guide_zh.md
You: I'll translate docs/guide.md from English to Chinese
- Input: docs/guide.md
- Output: docs/guide_zh.md
- Direction: en-to-zh
```

## Requirements

- Node.js environment with `tsx` (TypeScript executor)
- `openai` package (for ZenMux API)
- `ZENMUX_API_KEY` environment variable must be set
