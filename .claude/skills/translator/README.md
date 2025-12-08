# Translator Skill

Professional Chinese ↔ English translator for GitHub project documentation.

## Setup

### 1. Set ZenMux API Key

Add your ZenMux API key to your environment:

```bash
# Add to ~/.bashrc, ~/.zshrc, or ~/.bash_profile
export ZENMUX_API_KEY="your-zenmux-api-key-here"
```

Or create a `.env` file in your project root:

```bash
ZENMUX_API_KEY=your-zenmux-api-key-here
```

### 2. Install Dependencies

The skill requires the `openai` package:

```bash
pnpm add openai
```

## Usage

Just ask Claude to translate your documents:

```
Translate README_cn.md to English
```

```
Translate docs/guide.md from English to Chinese
```

Claude will automatically:
- Detect the translation direction
- Generate appropriate output filenames
- Preserve all markdown formatting
- Apply INTJ-style precision and clarity

## Features

- **Bidirectional**: Chinese ↔ English
- **Markdown-aware**: Preserves all formatting
- **INTJ-style**: Direct, precise, efficient
- **Auto-naming**: Smart output filename generation
- **Technical**: Understands GitHub/software terminology

## Examples

### Example 1: Basic translation (auto-naming)

```
Translate README_cn.md to English
```

Output: `README.md`

### Example 2: Custom output filename

```
Translate docs/guide.md to Chinese as docs/guide_zh.md
```

Output: `docs/guide_zh.md`

## Translation Quality

The translator follows these principles:

1. **Accuracy**: Technical terms preserved
2. **Native fluency**: Sounds natural, not robotic
3. **Conciseness**: No unnecessary verbosity
4. **Consistency**: Same terms translated the same way
5. **Context-aware**: Understands software/GitHub domain
