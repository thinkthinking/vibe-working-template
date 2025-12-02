# vibe-working

A comprehensive Next.js 16 boilerplate/scaffold integrating **Next.js**, **shadcn/ui**, **Vercel AI SDK**, and **Python** (managed by `uv`).

This project comes **pre-initialized** with these technologies. You can jump straight into development without running complex initialization commands.

## 🛠 Prerequisites (Environment Setup)

Before using this scaffold, please ensure your local environment has the following foundational tools installed.

### 1. Node.js & pnpm

We recommend using `nvm` to manage Node.js versions.

```bash
# 1. Install nvm (if not present)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"

# 2. Install Node.js v25 (or compatible LTS)
nvm install 25
node -v # Should print "v25.x.x"

# 3. Enable pnpm via Corepack
npm install -g corepack
corepack enable pnpm
pnpm -v
```

### 2. uv (Python Package Manager)

Required if you plan to use the Python environment features.

```bash
# macOS/Linux
curl -LsSf https://astral.sh/uv/install.sh | sh
```

---

## 🚀 Getting Started (How to use this project)

### 1. Install Project Dependencies

```bash
# Install Node.js dependencies (Next.js, React, shadcn/ui, AI SDK, etc.)
pnpm install

# Install Python dependencies (creates .venv based on pyproject.toml)
uv sync
```

### 2. Run Development Server

```bash
pnpm dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.
You can start editing the page by modifying `src/app/page.tsx`. The page auto-updates as you edit the file.

---

## 🛠️ Common Development Tasks

Here are the common commands you'll use while developing your application.

### Adding UI Components (shadcn/ui)

This project is pre-configured with shadcn/ui. To add **new** components to your project:

```bash
# Syntax: pnpm dlx shadcn@latest add [component-name]

# Example: Add a Button and Card component
pnpm dlx shadcn@latest add button card

# Example: Add a Dialog component
pnpm dlx shadcn@latest add dialog
```

### Managing Dependencies

#### Node.js / AI SDK Packages

To install additional packages (like new AI providers or utilities):

```bash
# Example: Install Anthropic provider for Vercel AI SDK
pnpm add @ai-sdk/anthropic

# Example: Install general utilities
pnpm add lodash date-fns
```

#### Python Packages

To add new Python libraries to your virtual environment:

```bash
uv add "httpx[socks]"
```

### Common SDK & Service Integrations

Here are installation commands for commonly used SDKs and services:

#### Supabase (Database & Auth)

```bash
# Node.js
pnpm add @supabase/supabase-js

# Python
uv add supabase
```

#### OpenAI

```bash
# Node.js
pnpm install openai

# Python
uv add openai
```

#### Anthropic (Claude)

```bash
# Node.js
pnpm install @anthropic-ai/sdk

# Python
uv add anthropic
```

#### Google GenAI (Gemini)

```bash
# Node.js
pnpm install @google/genai

# Python
uv add google-genai
```

---

## 📦 Included Features (Pre-configured)

The following are already installed and configured in this project:

- **Next.js 16**: App Router, TypeScript, Tailwind CSS.
- **shadcn/ui**: UI component system initialized.
- **Vercel AI SDK**: Core packages (`ai`, `@ai-sdk/openai`, `@ai-sdk/react`, `zod`) installed.
- **Python/uv**: Hybrid support with `pyproject.toml` and `uv.lock`.

---

## 📚 Reference Management

This project includes a utility to manage external reference repositories (for context/indexing) without polluting your project source or git history.

### Usage

1. **Add Repositories**: Add GitHub URLs to `.context/references/references-list.txt` (one per line).

   ```text
   https://github.com/vercel/ai.git
   ```

2. **Run Update Script**:

   ```bash
   ./scripts/update-references.sh
   ```

The script will clone/update repositories into `.context/references/` and automatically ensure they are added to `.gitignore`.

---

## 🤖 AI Coding Agents Setup

Best practices for configuring command-line AI agents (Claude Code & Codex) with this project, specifically for ZenMux/API compatibility.

### Claude Code

**Installation**:

```bash
pnpm install -g @anthropic-ai/claude-code
```

**Configuration** (`~/.claude/settings.json`):

```json
{
  "env": {
    "ANTHROPIC_AUTH_TOKEN": "sk-ai-v1-a6fcf27541bedbb3fe858153f6af51fdf79046ed22059e04d0d1bb1e0b48fbd9",
    "ANTHROPIC_BASE_URL": "https://zenmux.ai/api/anthropic",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "openai/gpt-5.1-codex-mini",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "anthropic/claude-sonnet-4.5",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "google/gemini-3-pro-preview"
  },
  "alwaysThinkingEnabled": true
}
```

### Codex CLI

**Installation**:

```bash
pnpm install -g @openai/codex
```

**Configuration** (`~/.codex/config.toml`):

```toml
model_provider = "zenmux"
model = "openai/gpt-5.1-codex"

[model_providers.zenmux]
name = "ZenMux"
base_url = "https://zenmux.ai/api/v1"
env_key = "ZENMUX_API_KEY"
```

**Environment**:
Add `export ZENMUX_API_KEY="sk-ai-v1-your-key"` to your shell profile (`~/.zshrc` or `~/.bashrc`).

---

## 📚 Reference: "Zero to One" Guide

> **Note**: These commands are **FOR REFERENCE ONLY**. They document how this scaffold was originally created. **You do not need to run these** unless you are building a brand new project from scratch without this scaffold.

### 1. Initialize Next.js

```bash
pnpm create next-app@latest .
```

### 2. Initialize shadcn/ui

```bash
pnpm dlx shadcn@latest init
```

### 3. Install Vercel AI SDK

```bash
pnpm add ai @ai-sdk/openai @ai-sdk/react zod
```

### 4. Initialize Python (uv)

```bash
uv init
uv sync
```

---

## ☁️ Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out the [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.
