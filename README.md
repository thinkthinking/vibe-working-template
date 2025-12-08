<div align="center">
  <h1>🚀 Vibe Working Template</h1>
  <p><strong>Production-Ready Next.js 16 Full-Stack Boilerplate with AI Integration</strong></p>

English | [简体中文](./README_cn.md)

<!-- Badges -->
[![Next.js](https://img.shields.io/badge/Next.js-16-black?logo=next.js)](https://nextjs.org/)
[![React](https://img.shields.io/badge/React-19-61dafb?logo=react)](https://reactjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5-blue?logo=typescript)](https://www.typescriptlang.org/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-4-38bdf8?logo=tailwind-css)](https://tailwindcss.com/)
[![Python](https://img.shields.io/badge/Python-3.13+-3776ab?logo=python)](https://www.python.org/)
[![License](https://img.shields.io/badge/license-Apache_2.0-green)](./LICENSE)

**A comprehensive, production-ready full-stack scaffold integrating Next.js 16, shadcn/ui, Vercel AI SDK, and Python—empowering developers to build modern AI-powered applications from day one.**

</div>

---

## 📖 What is Vibe Working Template?

**Vibe Working Template** is a modern, batteries-included boilerplate that combines the best of web and AI development:

- 🎨 **Modern UI Stack**: Next.js 16 (App Router) + React 19 + Tailwind CSS 4 + shadcn/ui
- 🤖 **AI-First**: Pre-configured Vercel AI SDK with multi-provider support (OpenAI, Anthropic, Google)
- 🐍 **Hybrid Architecture**: Seamless Node.js + Python integration via `uv` for ML/data tasks
- ⚡ **Zero Config**: Pre-initialized with best practices—jump straight into building
- 🛠️ **Developer-Friendly**: Comprehensive tooling, MCP server integration, and reference management

---

## ✨ Core Features

### 🎯 Pre-Configured Tech Stack

[![Framework](https://img.shields.io/badge/Next.js-16_App_Router-black)](#)
[![UI](https://img.shields.io/badge/shadcn/ui-Radix_+_Tailwind-purple)](#)
[![AI](https://img.shields.io/badge/Vercel_AI_SDK-Multi--Provider-orange)](#)
[![Python](https://img.shields.io/badge/uv-Fast_Python_PM-blue)](#)

- **Next.js 16**: Latest App Router, Server Actions, React 19, Tailwind CSS 4
- **shadcn/ui**: Beautiful, accessible UI components built on Radix UI
- **Vercel AI SDK**: Stream AI responses from OpenAI, Anthropic, Google Gemini
- **Python/uv**: Ultra-fast Python package management for data science & ML workflows

### 🚀 Developer Experience

- **📦 Zero Setup**: All dependencies pre-installed and configured
- **🔧 Reference Management**: Built-in script to manage external repos for context indexing
- **🤖 AI Agent Ready**: Pre-configured for Claude Code, Codex CLI with ZenMux API support
- **📝 Type Safety**: Full TypeScript support with strict mode enabled
- **🎨 Customizable**: Easy to extend with your favorite tools and libraries

---

## 📣 Recent Updates

> [!TIP]
> **2025.12.08**: Initial release of Vibe Working Template
>
> - ✅ Next.js 16 + React 19 + Tailwind CSS 4 pre-configured
> - ✅ shadcn/ui component system initialized
> - ✅ Vercel AI SDK with OpenAI integration
> - ✅ Python/uv hybrid development environment
> - ✅ Reference management utility for AI context
> - ✅ Claude Code & Codex CLI configuration templates

---

## ⚡ Quick Start

### 1️⃣ Prerequisites

Before using this template, ensure you have the following installed:

<details>
<summary><strong>Node.js & pnpm Installation</strong></summary>

We recommend using `nvm` to manage Node.js versions:

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

</details>

<details>
<summary><strong>Python & uv Installation</strong></summary>

Required if you plan to use Python features:

```bash
# macOS/Linux
curl -LsSf https://astral.sh/uv/install.sh | sh

# Windows (PowerShell)
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

</details>

### 2️⃣ ZenMux API Configuration (Recommended)

> [!TIP]
> **ZenMux** is a unified API gateway that provides access to multiple AI models (OpenAI, Anthropic, Google, etc.) through a single API key. This template includes pre-configured ZenMux integration for seamless multi-model AI development.

<details>
<summary><strong>Why Use ZenMux?</strong></summary>

- **🔑 Single API Key**: Access 50+ AI models from different providers with one key
- **💰 Cost Effective**: Competitive pricing and flexible payment options
- **🚀 No Rate Limits**: Higher throughput compared to direct provider APIs
- **🔄 Easy Switching**: Switch between models without code changes
- **📊 Usage Dashboard**: Track consumption and costs in real-time

</details>

#### Get Your ZenMux API Key

1. **Sign in to ZenMux**: Visit [zenmux.ai/login](https://zenmux.ai/login) and sign in using:
   - Email
   - GitHub account
   - Google account

2. **Generate API Key**: After login, go to [User Console > API Keys](https://zenmux.ai/settings/keys) and create a new API key.

3. **Set Environment Variable**:

   ```bash
   # Add to ~/.zshrc or ~/.bashrc
   export ZENMUX_API_KEY="sk-ai-v1-your-key-here"

   # Reload your shell configuration
   source ~/.zshrc  # or source ~/.bashrc
   ```

> **📚 Learn More**: Check out the [ZenMux Documentation](https://docs.zenmux.ai/guide/quickstart.html) for advanced usage, model selection, and API details.

---

### 3️⃣ Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/vibe-working-template.git
cd vibe-working-template

# Install Node.js dependencies
pnpm install

# Install Python dependencies (optional)
uv sync
```

### 4️⃣ Development

```bash
# Start the development server
pnpm dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser. You're ready to build! 🎉

---

## 🛠️ Common Development Tasks

### Adding UI Components

This project uses **shadcn/ui** for beautiful, accessible components:

```bash
# Add individual components
pnpm dlx shadcn@latest add button card dialog

# Add multiple components at once
pnpm dlx shadcn@latest add button card dialog input textarea
```

Browse available components at [ui.shadcn.com](https://ui.shadcn.com/).

### Managing Dependencies

#### Node.js Packages

```bash
# Add Anthropic AI SDK
pnpm add @ai-sdk/anthropic

# Add utilities
pnpm add lodash date-fns zod
```

#### Python Packages

```bash
# Add Python packages
uv add "httpx[socks]" pandas numpy
```

### AI SDK Integration Examples

<details>
<summary><strong>Supabase (Database & Auth)</strong></summary>

```bash
# Node.js
pnpm add @supabase/supabase-js

# Python
uv add supabase
```

</details>

<details>
<summary><strong>OpenAI</strong></summary>

```bash
# Node.js
pnpm add openai

# Python
uv add openai
```

</details>

<details>
<summary><strong>Anthropic (Claude)</strong></summary>

```bash
# Node.js
pnpm add @anthropic-ai/sdk

# Python
uv add anthropic
```

</details>

<details>
<summary><strong>Google GenAI (Gemini)</strong></summary>

```bash
# Node.js
pnpm add @google/genai

# Python
uv add google-genai
```

</details>

---

## 📦 What's Included

This template comes **pre-configured** with:

| Technology | Version | Purpose |
|-----------|---------|---------|
| **Next.js** | 16 | App Router, TypeScript, Server Actions |
| **React** | 19 | Latest React with new hooks and features |
| **Tailwind CSS** | 4 | Utility-first CSS framework |
| **shadcn/ui** | Latest | Accessible UI component library |
| **Vercel AI SDK** | Latest | Stream AI responses from multiple providers |
| **Python** | 3.13+ | Data science & ML workflows |
| **uv** | Latest | Ultra-fast Python package manager |

---

## 🧩 Advanced Features

### 📚 Reference Management

Manage external repositories for AI context without polluting your source:

1. **Add repositories** to `.context/references/references-list.txt`:

   ```text
   https://github.com/vercel/ai.git
   https://github.com/shadcn-ui/ui.git
   ```

2. **Run the update script**:

   ```bash
   ./scripts/update-references.sh
   ```

Repositories will be cloned/updated in `.context/references/` and auto-added to `.gitignore`.

### 🤖 AI Coding Agent Setup

> [!NOTE]
> The following configurations use **ZenMux API** to access multiple AI models. Make sure you've completed the [ZenMux API Configuration](#2️⃣-zenmux-api-configuration-recommended) first.

<details>
<summary><strong>Claude Code Configuration</strong></summary>

**Installation**:

```bash
pnpm install -g @anthropic-ai/claude-code
```

**Configuration** (`~/.claude/settings.json`):

```json
{
  "env": {
    "ANTHROPIC_AUTH_TOKEN": "sk-ai-v1-your-zenmux-api-key",
    "ANTHROPIC_BASE_URL": "https://zenmux.ai/api/anthropic",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "openai/gpt-5.1-codex-mini",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "anthropic/claude-sonnet-4.5",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "google/gemini-3-pro-preview"
  },
  "alwaysThinkingEnabled": true
}
```

**Key Points**:

- Replace `sk-ai-v1-your-zenmux-api-key` with your actual ZenMux API key
- The `ANTHROPIC_BASE_URL` points to ZenMux's Anthropic-compatible endpoint
- You can mix models from different providers (OpenAI, Anthropic, Google) in the configuration

</details>

<details>
<summary><strong>Codex CLI Configuration</strong></summary>

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

**Environment Setup**:

```bash
# Add to ~/.zshrc or ~/.bashrc (if not already done in step 2️⃣)
export ZENMUX_API_KEY="sk-ai-v1-your-zenmux-api-key"

# Reload shell configuration
source ~/.zshrc  # or source ~/.bashrc
```

**Key Points**:

- Use the same `ZENMUX_API_KEY` you obtained in step 2️⃣
- The `base_url` points to ZenMux's OpenAI-compatible endpoint
- You can switch models by changing the `model` value (e.g., `anthropic/claude-sonnet-4.5`)

</details>

---

## 📚 Documentation & Resources

### Project Structure

```
vibe-working-template/
├── src/
│   ├── app/              # Next.js App Router pages
│   ├── components/       # React components
│   └── lib/              # Utility functions
├── .context/             # AI context & references
├── scripts/              # Development scripts
├── pyproject.toml        # Python dependencies
├── package.json          # Node.js dependencies
└── README.md             # This file
```

### Useful Commands

| Command | Description |
|---------|-------------|
| `pnpm dev` | Start development server |
| `pnpm build` | Build for production |
| `pnpm start` | Start production server |
| `pnpm lint` | Run ESLint |
| `uv sync` | Sync Python dependencies |
| `uv add <package>` | Add Python package |

---

## 🚢 Deployment

### Deploy to Vercel (Recommended)

The easiest way to deploy your Next.js app:

1. Push your code to GitHub/GitLab/Bitbucket
2. Import your repository on [Vercel](https://vercel.com/new)
3. Vercel will auto-detect Next.js and deploy

[Next.js Deployment Documentation](https://nextjs.org/docs/app/building-your-application/deploying)

### Other Platforms

- **Netlify**: [Next.js on Netlify](https://docs.netlify.com/frameworks/next-js/)
- **AWS Amplify**: [Deploy Next.js to AWS](https://aws.amazon.com/amplify/)
- **Docker**: See `Dockerfile` (create if needed)

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the **Apache 2.0 License** - see the [LICENSE](./LICENSE) file for details.

---

## 🙏 Acknowledgments

This template builds upon the excellent work of:

- [Next.js](https://nextjs.org/) - The React Framework
- [shadcn/ui](https://ui.shadcn.com/) - Beautiful UI components
- [Vercel AI SDK](https://sdk.vercel.ai/) - AI toolkit for TypeScript
- [uv](https://github.com/astral-sh/uv) - Fast Python package manager
- [Tailwind CSS](https://tailwindcss.com/) - Utility-first CSS

---

## 📚 Reference: Build From Scratch

> **Note**: These commands are **FOR REFERENCE ONLY**. They document how this template was created. **You do not need to run these** when using this template.

<details>
<summary><strong>Show build steps</strong></summary>

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

</details>

---

<div align="center">
  <p>Made with ❤️ by developers, for developers</p>
  <p>
    <a href="#-quick-start">Get Started</a> •
    <a href="./CONTRIBUTING.md">Contribute</a> •
    <a href="./LICENSE">License</a>
  </p>
</div>
