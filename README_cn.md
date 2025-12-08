<div align="center">
  <h1>🚀 Vibe Working Template</h1>
  <p><strong>可直接用于生产的 Next.js 16 全栈 AI 集成脚手架</strong></p>

English | [简体中文](./README_cn.md)

<!-- Badges -->
[![Next.js](https://img.shields.io/badge/Next.js-16-black?logo=next.js)](https://nextjs.org/)
[![React](https://img.shields.io/badge/React-19-61dafb?logo=react)](https://reactjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5-blue?logo=typescript)](https://www.typescriptlang.org/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-4-38bdf8?logo=tailwind-css)](https://tailwindcss.com/)
[![Python](https://img.shields.io/badge/Python-3.13+-3776ab?logo=python)](https://www.python.org/)
[![License](https://img.shields.io/badge/license-Apache_2.0-green)](./LICENSE)

**集成 Next.js 16、shadcn/ui、Vercel AI SDK 与 Python 的全栈生产级脚手架，开箱即可构建现代 AI 应用。**

</div>

---

## 📖 Vibe Working Template 是什么？

**Vibe Working Template** 是一个现代化、功能齐全的全栈模板，聚合 Web 与 AI 开发最佳实践：

- 🎨 **现代 UI 技术栈**：Next.js 16（App Router）+ React 19 + Tailwind CSS 4 + shadcn/ui
- 🤖 **AI 优先**：预配置 Vercel AI SDK，多模型提供商支持（OpenAI、Anthropic、Google）
- 🐍 **混合架构**：通过 `uv` 无缝集成 Node.js + Python，支持 ML / 数据任务
- ⚡ **零配置**：内置最佳实践，克隆后直接开发
- 🛠️ **开发者友好**：完善工具链、MCP server 集成、引用管理能力

---

## ✨ 核心特性

### 🎯 预配置技术栈

[![Framework](https://img.shields.io/badge/Next.js-16_App_Router-black)](#)
[![UI](https://img.shields.io/badge/shadcn/ui-Radix_+_Tailwind-purple)](#)
[![AI](https://img.shields.io/badge/Vercel_AI_SDK-Multi--Provider-orange)](#)
[![Python](https://img.shields.io/badge/uv-Fast_Python_PM-blue)](#)

- **Next.js 16**：最新 App Router、Server Actions、React 19、Tailwind CSS 4
- **shadcn/ui**：基于 Radix UI 的无障碍高质量组件库
- **Vercel AI SDK**：支持 OpenAI、Anthropic、Google Gemini 的流式响应
- **Python/uv**：超快的 Python 包管理，适合数据科学与 ML 流程

### 🚀 开发体验

- **📦 零手动配置**：依赖与配置全部就绪
- **🔧 引用管理**：内置脚本，管理外部仓库并做上下文索引
- **🤖 AI Agent Ready**：预配置 Claude Code、Codex CLI，支持 ZenMux API
- **📝 类型安全**：全量 TypeScript，启用 strict 模式
- **🎨 可扩展**：便于集成自定义工具与库

---

## 📣 最近更新

> [!TIP]
> **2025.12.08**：Vibe Working Template 初始发布
>
> - ✅ 预配置 Next.js 16 + React 19 + Tailwind CSS 4
> - ✅ 初始化 shadcn/ui 组件体系
> - ✅ 集成 Vercel AI SDK + OpenAI
> - ✅ 建立 Python/uv 混合开发环境
> - ✅ 提供 AI 上下文引用管理工具
> - ✅ 提供 Claude Code & Codex CLI 配置模板

---

## ⚡ 快速开始

### 1️⃣ 前置环境

在使用本模板前，请确认已安装以下工具：

<details>
<summary><strong>Node.js & pnpm 安装</strong></summary>

推荐使用 `nvm` 管理 Node.js 版本：

```bash
# 1. 安装 nvm（如未安装）
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"

# 2. 安装 Node.js v25（或兼容的 LTS）
nvm install 25
node -v # 应输出 "v25.x.x"

# 3. 通过 Corepack 启用 pnpm
npm install -g corepack
corepack enable pnpm
pnpm -v
```

</details>

<details>
<summary><strong>Python & uv 安装</strong></summary>

如需使用 Python 功能则必装：

```bash
# macOS/Linux
curl -LsSf https://astral.sh/uv/install.sh | sh

# Windows (PowerShell)
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

</details>

### 2️⃣ ZenMux API 配置（推荐）

> [!TIP]
> **ZenMux** 是统一的 AI API 网关，用一个 API Key 访问多家模型（OpenAI、Anthropic、Google 等）。本模板已预集成 ZenMux，便于多模型开发。

<details>
<summary><strong>为什么用 ZenMux？</strong></summary>

- **🔑 单一 API Key**：一个 Key 访问 50+ 模型
- **💰 成本可控**：价格友好，计费灵活
- **🚀 更高吞吐**：较直连厂商更宽松的限流
- **🔄 模型切换简单**：无需改代码即可切换模型
- **📊 使用看板**：实时查看用量与成本

</details>

#### 获取 ZenMux API Key

1. **登录 ZenMux**：访问 [zenmux.ai/login](https://zenmux.ai/login)，使用以下任一方式登录：
   - 邮箱
   - GitHub 账号
   - Google 账号

2. **生成 API Key**：登录后前往 [User Console > API Keys](https://zenmux.ai/settings/keys) 创建新 API Key。

3. **设置环境变量**：

   ```bash
   # 写入 ~/.zshrc 或 ~/.bashrc
   export ZENMUX_API_KEY="sk-ai-v1-your-key-here"

   # 重新加载 Shell 配置
   source ~/.zshrc  # 或 source ~/.bashrc
   ```

> **📚 进一步了解**：参见 [ZenMux Documentation](https://docs.zenmux.ai/guide/quickstart.html)，了解进阶用法、模型选择与 API 细节。

---

### 3️⃣ 安装依赖

```bash
# 克隆仓库
git clone https://github.com/yourusername/vibe-working-template.git
cd vibe-working-template

# 安装 Node.js 依赖
pnpm install

# 安装 Python 依赖（可选）
uv sync
```

### 4️⃣ 启动开发

```bash
# 启动开发服务器
pnpm dev
```

在浏览器打开 [http://localhost:3000](http://localhost:3000)。现在可以开始构建应用。🎉

---

## 🛠️ 常见开发任务

### 添加 UI 组件

本项目使用 **shadcn/ui** 作为组件库：

```bash
# 添加单个组件
pnpm dlx shadcn@latest add button card dialog

# 一次添加多个组件
pnpm dlx shadcn@latest add button card dialog input textarea
```

组件列表参考 [ui.shadcn.com](https://ui.shadcn.com/)。

### 管理依赖

#### Node.js 包

```bash
# 添加 Anthropic AI SDK
pnpm add @ai-sdk/anthropic

# 添加工具库
pnpm add lodash date-fns zod
```

#### Python 包

```bash
# 添加 Python 包
uv add "httpx[socks]" pandas numpy
```

### AI SDK 集成示例

<details>
<summary><strong>Supabase（数据库 & Auth）</strong></summary>

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
<summary><strong>Anthropic（Claude）</strong></summary>

```bash
# Node.js
pnpm add @anthropic-ai/sdk

# Python
uv add anthropic
```

</details>

<details>
<summary><strong>Google GenAI（Gemini）</strong></summary>

```bash
# Node.js
pnpm add @google/genai

# Python
uv add google-genai
```

</details>

---

## 📦 模板内置内容

本模板已**预配置**以下技术栈：

| Technology | Version | Purpose |
|-----------|---------|---------|
| **Next.js** | 16 | App Router、TypeScript、Server Actions |
| **React** | 19 | 最新 React，含新 Hooks 与特性 |
| **Tailwind CSS** | 4 | 实用类优先的 CSS 框架 |
| **shadcn/ui** | Latest | 无障碍 UI 组件库 |
| **Vercel AI SDK** | Latest | 支持多家厂商的流式 AI 响应 |
| **Python** | 3.13+ | 数据科学与 ML 流程 |
| **uv** | Latest | 高性能 Python 包管理器 |

---

## 🧩 高级特性

### 📚 引用管理

在不污染源码的前提下，为 AI 管理外部仓库上下文：

1. 在 `.context/references/references-list.txt` 中**添加仓库地址**：

   ```text
   https://github.com/vercel/ai.git
   https://github.com/shadcn-ui/ui.git
   ```

2. **执行更新脚本**：

   ```bash
   ./scripts/update-references.sh
   ```

脚本会将仓库克隆/更新至 `.context/references/`，并自动写入 `.gitignore`。

### 🤖 AI Coding Agent 配置

> [!NOTE]
> 以下配置使用 **ZenMux API** 访问多家模型。请先完成 [ZenMux API 配置](#2️⃣-zenmux-api-配置推荐)。

<details>
<summary><strong>Claude Code 配置</strong></summary>

**安装**：

```bash
pnpm install -g @anthropic-ai/claude-code
```

**配置文件**（`~/.claude/settings.json`）：

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

**要点**：

- 将 `sk-ai-v1-your-zenmux-api-key` 替换为你的实际 ZenMux API Key
- `ANTHROPIC_BASE_URL` 指向 ZenMux 的 Anthropic 兼容端点
- 可在配置中混用来自 OpenAI、Anthropic、Google 的模型

</details>

<details>
<summary><strong>Codex CLI 配置</strong></summary>

**安装**：

```bash
pnpm install -g @openai/codex
```

**配置文件**（`~/.codex/config.toml`）：

```toml
model_provider = "zenmux"
model = "openai/gpt-5.1-codex"

[model_providers.zenmux]
name = "ZenMux"
base_url = "https://zenmux.ai/api/v1"
env_key = "ZENMUX_API_KEY"
```

**环境变量**：

```bash
# 写入 ~/.zshrc 或 ~/.bashrc（若第 2️⃣ 步已设置可忽略）
export ZENMUX_API_KEY="sk-ai-v1-your-zenmux-api-key"

# 重新加载配置
source ~/.zshrc  # 或 source ~/.bashrc
```

**要点**：

- 使用与第 2️⃣ 步相同的 `ZENMUX_API_KEY`
- `base_url` 指向 ZenMux 的 OpenAI 兼容端点
- 通过修改 `model` 字段切换模型，如 `anthropic/claude-sonnet-4.5`

</details>

---

## 📚 文档与资源

### 项目结构

```
vibe-working-template/
├── src/
│   ├── app/              # Next.js App Router 页面
│   ├── components/       # React 组件
│   └── lib/              # 工具函数
├── .context/             # AI 上下文与引用
├── scripts/              # 开发脚本
├── pyproject.toml        # Python 依赖
├── package.json          # Node.js 依赖
└── README.md             # 本文件
```

### 常用命令

| Command | Description |
|---------|-------------|
| `pnpm dev` | 启动开发服务器 |
| `pnpm build` | 构建生产版本 |
| `pnpm start` | 启动生产服务 |
| `pnpm lint` | 运行 ESLint |
| `uv sync` | 同步 Python 依赖 |
| `uv add <package>` | 新增 Python 包 |

---

## 🚢 部署

### 部署到 Vercel（推荐）

部署 Next.js 的最简方案：

1. 将代码推送到 GitHub/GitLab/Bitbucket
2. 在 [Vercel](https://vercel.com/new) 导入仓库
3. Vercel 会自动识别 Next.js 并完成部署

参考：[Next.js Deployment Documentation](https://nextjs.org/docs/app/building-your-application/deploying)

### 其他平台

- **Netlify**：[Next.js on Netlify](https://docs.netlify.com/frameworks/next-js/)
- **AWS Amplify**：[Deploy Next.js to AWS](https://aws.amazon.com/amplify/)
- **Docker**：如需使用可自行创建 `Dockerfile`

---

## 🤝 贡献

欢迎贡献代码，流程如下：

1. Fork 本仓库
2. 创建功能分支（`git checkout -b feature/AmazingFeature`）
3. 提交变更（`git commit -m 'Add some AmazingFeature'`）
4. 推送分支（`git push origin feature/AmazingFeature`）
5. 提交 Pull Request

---

## 📄 协议

本项目基于 **Apache 2.0 License** 开源，详情见 [LICENSE](./LICENSE) 文件。

---

## 🙏 致谢

本模板基于以下优秀项目构建：

- [Next.js](https://nextjs.org/) - React Framework
- [shadcn/ui](https://ui.shadcn.com/) - 高质量 UI 组件
- [Vercel AI SDK](https://sdk.vercel.ai/) - TypeScript AI 工具集
- [uv](https://github.com/astral-sh/uv) - 高性能 Python 包管理器
- [Tailwind CSS](https://tailwindcss.com/) - 实用类优先 CSS 框架

---

## 📚 附录：从零开始构建步骤

> **注意**：以下命令仅作**参考文档**，记录本模板的构建过程。**使用本模板时不需要重复执行。**

<details>
<summary><strong>查看构建步骤</strong></summary>

### 1. 初始化 Next.js

```bash
pnpm create next-app@latest .
```

### 2. 初始化 shadcn/ui

```bash
pnpm dlx shadcn@latest init
```

### 3. 安装 Vercel AI SDK

```bash
pnpm add ai @ai-sdk/openai @ai-sdk/react zod
```

### 4. 初始化 Python（uv）

```bash
uv init
uv sync
```

</details>

---

<div align="center">
  <p>Made with ❤️ by developers, for developers</p>
  <p>
    <a href="#-快速开始">开始使用</a> •
    <a href="./CONTRIBUTING.md">参与贡献</a> •
    <a href="./LICENSE">License</a>
  </p>
</div>