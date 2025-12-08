<div align="center">
  <h1>🚀 Vibe Working Template</h1>
  <p><strong>生产就绪的 Next.js 16 全栈模板，内置 AI 集成</strong></p>

[English](./README.md) | 简体中文

<!-- Badges -->
[![Next.js](https://img.shields.io/badge/Next.js-16-black?logo=next.js)](https://nextjs.org/)
[![React](https://img.shields.io/badge/React-19-61dafb?logo=react)](https://reactjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5-blue?logo=typescript)](https://www.typescriptlang.org/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-4-38bdf8?logo=tailwind-css)](https://tailwindcss.com/)
[![Python](https://img.shields.io/badge/Python-3.13+-3776ab?logo=python)](https://www.python.org/)
[![License](https://img.shields.io/badge/license-Apache_2.0-green)](./LICENSE)

**一个全面的、生产就绪的全栈脚手架，集成了 Next.js 16、shadcn/ui、Vercel AI SDK 和 Python——让开发者从第一天起就能构建现代化的 AI 驱动应用程序。**

</div>

---

## 📖 什么是 Vibe Working Template？

**Vibe Working Template** 是一个现代化的、开箱即用的样板项目，结合了 Web 开发和 AI 开发的最佳实践：

- 🎨 **现代 UI 技术栈**：Next.js 16（App Router）+ React 19 + Tailwind CSS 4 + shadcn/ui
- 🤖 **AI 优先**：预配置 Vercel AI SDK，支持多个 AI 提供商（OpenAI、Anthropic、Google）
- 🐍 **混合架构**：通过 `uv` 实现 Node.js + Python 的无缝集成，用于机器学习/数据任务
- ⚡ **零配置**：预初始化最佳实践——直接开始构建
- 🛠️ **开发者友好**：全面的工具支持、MCP 服务器集成和引用管理

---

## ✨ 核心特性

### 🎯 预配置技术栈

[![Framework](https://img.shields.io/badge/Next.js-16_App_Router-black)](#)
[![UI](https://img.shields.io/badge/shadcn/ui-Radix_+_Tailwind-purple)](#)
[![AI](https://img.shields.io/badge/Vercel_AI_SDK-Multi--Provider-orange)](#)
[![Python](https://img.shields.io/badge/uv-Fast_Python_PM-blue)](#)

- **Next.js 16**：最新的 App Router、Server Actions、React 19、Tailwind CSS 4
- **shadcn/ui**：基于 Radix UI 构建的美观、可访问的 UI 组件
- **Vercel AI SDK**：从 OpenAI、Anthropic、Google Gemini 流式传输 AI 响应
- **Python/uv**：用于数据科学和机器学习工作流的超快 Python 包管理

### 🚀 开发者体验

- **📦 零配置**：所有依赖项均已预安装和配置
- **🔧 引用管理**：内置脚本管理外部仓库以进行上下文索引
- **🤖 AI Agent 就绪**：预配置支持 Claude Code、Codex CLI 与 ZenMux API
- **📝 类型安全**：完全的 TypeScript 支持，启用严格模式
- **🎨 可定制**：易于扩展您喜欢的工具和库

---

## 📣 最近更新

> [!TIP]
> **2025.12.08**：Vibe Working Template 首次发布
> - ✅ Next.js 16 + React 19 + Tailwind CSS 4 预配置
> - ✅ shadcn/ui 组件系统已初始化
> - ✅ Vercel AI SDK 集成 OpenAI
> - ✅ Python/uv 混合开发环境
> - ✅ AI 上下文引用管理工具
> - ✅ Claude Code 和 Codex CLI 配置模板

---

## ⚡ 快速开始

### 1️⃣ 前置要求

在使用此模板之前，请确保已安装以下工具：

<details>
<summary><strong>Node.js 和 pnpm 安装</strong></summary>

我们推荐使用 `nvm` 管理 Node.js 版本：

```bash
# 1. 安装 nvm（如果未安装）
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"

# 2. 安装 Node.js v25（或兼容的 LTS 版本）
nvm install 25
node -v # 应该打印 "v25.x.x"

# 3. 通过 Corepack 启用 pnpm
npm install -g corepack
corepack enable pnpm
pnpm -v
```

</details>

<details>
<summary><strong>Python 和 uv 安装</strong></summary>

如果您计划使用 Python 功能，则需要安装：

```bash
# macOS/Linux
curl -LsSf https://astral.sh/uv/install.sh | sh

# Windows (PowerShell)
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

</details>

### 2️⃣ ZenMux API 配置（推荐）

> [!TIP]
> **ZenMux** 是一个统一的 API 网关，通过单个 API 密钥提供对多个 AI 模型（OpenAI、Anthropic、Google 等）的访问。此模板包含预配置的 ZenMux 集成，用于无缝的多模型 AI 开发。

<details>
<summary><strong>为什么使用 ZenMux？</strong></summary>

- **🔑 单个 API 密钥**：使用一个密钥访问来自不同提供商的 50+ AI 模型
- **💰 成本效益**：具有竞争力的价格和灵活的付费选项
- **🚀 无速率限制**：相比直接调用提供商 API 有更高的吞吐量
- **🔄 轻松切换**：无需更改代码即可切换模型
- **📊 使用仪表板**：实时跟踪消费和成本

</details>

#### 获取 ZenMux API 密钥

1. **登录 ZenMux**：访问 [zenmux.ai/login](https://zenmux.ai/login) 并使用以下方式登录：
   - 邮箱
   - GitHub 账号
   - Google 账号

2. **生成 API 密钥**：登录后，前往 [用户控制台 > API 密钥](https://zenmux.ai/settings/keys) 创建新的 API 密钥。

3. **设置环境变量**：

   ```bash
   # 添加到 ~/.zshrc 或 ~/.bashrc
   export ZENMUX_API_KEY="sk-ai-v1-your-key-here"

   # 重新加载 shell 配置
   source ~/.zshrc  # 或 source ~/.bashrc
   ```

#### 快速测试

通过简单的 API 调用验证您的设置：

::: code-group

```bash [cURL]
curl https://zenmux.ai/api/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ZENMUX_API_KEY" \
  -d '{
    "model": "openai/gpt-4o-mini",
    "messages": [{"role": "user", "content": "你好！"}]
  }'
```

```python [Python]
from openai import OpenAI

client = OpenAI(
    base_url="https://zenmux.ai/api/v1",
    api_key="<your ZENMUX_API_KEY>",
)

response = client.chat.completions.create(
    model="openai/gpt-4o-mini",
    messages=[{"role": "user", "content": "你好！"}]
)

print(response.choices[0].message.content)
```

```typescript [TypeScript]
import OpenAI from "openai";

const client = new OpenAI({
  baseURL: "https://zenmux.ai/api/v1",
  apiKey: "<your ZENMUX_API_KEY>",
});

const response = await client.chat.completions.create({
  model: "openai/gpt-4o-mini",
  messages: [{ role: "user", content: "你好！" }],
});

console.log(response.choices[0].message.content);
```

:::

> **📚 了解更多**：查看 [ZenMux 文档](https://docs.zenmux.ai/guide/quickstart.html)了解高级用法、模型选择和 API 详情。

---

### 3️⃣ 安装

```bash
# 克隆仓库
git clone https://github.com/yourusername/vibe-working-template.git
cd vibe-working-template

# 安装 Node.js 依赖
pnpm install

# 安装 Python 依赖（可选）
uv sync
```

### 4️⃣ 开发

```bash
# 启动开发服务器
pnpm dev
```

在浏览器中打开 [http://localhost:3000](http://localhost:3000)。准备开始构建吧！🎉

---

## 🛠️ 常见开发任务

### 添加 UI 组件

本项目使用 **shadcn/ui** 提供美观、可访问的组件：

```bash
# 添加单个组件
pnpm dlx shadcn@latest add button card dialog

# 一次添加多个组件
pnpm dlx shadcn@latest add button card dialog input textarea
```

在 [ui.shadcn.com](https://ui.shadcn.com/) 浏览可用组件。

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
<summary><strong>Supabase（数据库和身份验证）</strong></summary>

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

## 📦 包含内容

此模板**预配置**了以下内容：

| 技术 | 版本 | 用途 |
|-----|------|-----|
| **Next.js** | 16 | App Router、TypeScript、Server Actions |
| **React** | 19 | 最新的 React 及新特性和 hooks |
| **Tailwind CSS** | 4 | 实用优先的 CSS 框架 |
| **shadcn/ui** | 最新 | 可访问的 UI 组件库 |
| **Vercel AI SDK** | 最新 | 从多个提供商流式传输 AI 响应 |
| **Python** | 3.13+ | 数据科学和机器学习工作流 |
| **uv** | 最新 | 超快的 Python 包管理器 |

---

## 🧩 高级功能

### 📚 引用管理

在不污染源代码的情况下管理外部仓库以进行 AI 上下文：

1. **添加仓库**到 `.context/references/references-list.txt`：

   ```text
   https://github.com/vercel/ai.git
   https://github.com/shadcn-ui/ui.git
   ```

2. **运行更新脚本**：

   ```bash
   ./scripts/update-references.sh
   ```

仓库将被克隆/更新到 `.context/references/` 并自动添加到 `.gitignore`。

### 🤖 AI 编码代理设置

> [!NOTE]
> 以下配置使用 **ZenMux API** 访问多个 AI 模型。请确保您已完成 [ZenMux API 配置](#2️⃣-zenmux-api-配置推荐)。

<details>
<summary><strong>Claude Code 配置</strong></summary>

**安装**：

```bash
pnpm install -g @anthropic-ai/claude-code
```

**配置** (`~/.claude/settings.json`)：

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

**关键要点**：
- 将 `sk-ai-v1-your-zenmux-api-key` 替换为您实际的 ZenMux API 密钥
- `ANTHROPIC_BASE_URL` 指向 ZenMux 的 Anthropic 兼容端点
- 您可以在配置中混合使用来自不同提供商（OpenAI、Anthropic、Google）的模型

</details>

<details>
<summary><strong>Codex CLI 配置</strong></summary>

**安装**：

```bash
pnpm install -g @openai/codex
```

**配置** (`~/.codex/config.toml`)：

```toml
model_provider = "zenmux"
model = "openai/gpt-5.1-codex"

[model_providers.zenmux]
name = "ZenMux"
base_url = "https://zenmux.ai/api/v1"
env_key = "ZENMUX_API_KEY"
```

**环境设置**：

```bash
# 添加到 ~/.zshrc 或 ~/.bashrc（如果在步骤 2️⃣ 中尚未完成）
export ZENMUX_API_KEY="sk-ai-v1-your-zenmux-api-key"

# 重新加载 shell 配置
source ~/.zshrc  # 或 source ~/.bashrc
```

**关键要点**：
- 使用您在步骤 2️⃣ 中获得的同一个 `ZENMUX_API_KEY`
- `base_url` 指向 ZenMux 的 OpenAI 兼容端点
- 您可以通过更改 `model` 值来切换模型（例如 `anthropic/claude-sonnet-4.5`）

</details>

---

## 📚 文档和资源

### 项目结构

```
vibe-working-template/
├── src/
│   ├── app/              # Next.js App Router 页面
│   ├── components/       # React 组件
│   └── lib/              # 工具函数
├── .context/             # AI 上下文和引用
├── scripts/              # 开发脚本
├── pyproject.toml        # Python 依赖
├── package.json          # Node.js 依赖
└── README.md             # 本文件
```

### 常用命令

| 命令 | 描述 |
|-----|------|
| `pnpm dev` | 启动开发服务器 |
| `pnpm build` | 构建生产版本 |
| `pnpm start` | 启动生产服务器 |
| `pnpm lint` | 运行 ESLint |
| `uv sync` | 同步 Python 依赖 |
| `uv add <package>` | 添加 Python 包 |

---

## 🚢 部署

### 部署到 Vercel（推荐）

部署 Next.js 应用最简单的方式：

1. 将代码推送到 GitHub/GitLab/Bitbucket
2. 在 [Vercel](https://vercel.com/new) 上导入您的仓库
3. Vercel 将自动检测 Next.js 并部署

[Next.js 部署文档](https://nextjs.org/docs/app/building-your-application/deploying)

### 其他平台

- **Netlify**：[在 Netlify 上部署 Next.js](https://docs.netlify.com/frameworks/next-js/)
- **AWS Amplify**：[将 Next.js 部署到 AWS](https://aws.amazon.com/amplify/)
- **Docker**：参见 `Dockerfile`（如需要可创建）

---

## 🤝 贡献

欢迎贡献！请随时提交 Pull Request。

1. Fork 本仓库
2. 创建您的功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开一个 Pull Request

---

## 📄 许可证

本项目采用 **Apache 2.0 许可证** - 详见 [LICENSE](./LICENSE) 文件。

---

## 🙏 致谢

本模板基于以下优秀项目构建：

- [Next.js](https://nextjs.org/) - React 框架
- [shadcn/ui](https://ui.shadcn.com/) - 美观的 UI 组件
- [Vercel AI SDK](https://sdk.vercel.ai/) - TypeScript AI 工具包
- [uv](https://github.com/astral-sh/uv) - 快速的 Python 包管理器
- [Tailwind CSS](https://tailwindcss.com/) - 实用优先的 CSS

---

## 📚 参考：从零构建

> **注意**：这些命令**仅供参考**。它们记录了此模板的创建方式。**使用此模板时无需运行这些命令**。

<details>
<summary><strong>显示构建步骤</strong></summary>

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

### 4. 初始化 Python (uv)

```bash
uv init
uv sync
```

</details>

---

<div align="center">
  <p>由开发者用 ❤️ 为开发者打造</p>
  <p>
    <a href="#-快速开始">开始使用</a> •
    <a href="./CONTRIBUTING.md">贡献</a> •
    <a href="./LICENSE">许可证</a>
  </p>
</div>
