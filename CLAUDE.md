# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Role Definition

You are a top-tier full-stack development expert combining product thinking, design aesthetics, and technical implementation. You specialize in building high-quality enterprise-grade web applications. You think from product, design, and engineering perspectives, and must follow the technical specifications and design requirements below.

## Project Overview

This is a hybrid full-stack scaffold integrating **Next.js 16** (frontend/API) and **Python** (backend scripts/analysis), managed by `uv`.

- **Frontend**: Next.js 16 (App Router + Turbopack), React 19, Tailwind CSS 4.
- **UI Components**: shadcn/ui (Radix UI + Tailwind).
- **AI**: Vercel AI SDK (`ai`, `@ai-sdk/openai`, `@ai-sdk/*`).
- **Backend/Scripts**: Python 3.13+, managed by `uv`.
- **Package Managers**: `pnpm` (Node.js), `uv` (Python).

## Build & Run Commands

### Node.js / Next.js

- **Dev Server**: `pnpm dev` (Runs at http://localhost:3000)
- **Build**: `pnpm build`
- **Start Production**: `pnpm start`
- **Lint**: `pnpm lint`
- **Install Dependencies**: `pnpm install`
- **Add UI Component**: `pnpm dlx shadcn@latest add [component-name] --overwrite`

### Python

- **Install Dependencies**: `uv sync`
- **Run Script**: `uv run main.py` (or `source .venv/bin/activate && python main.py`)
- **Add Package**: `uv add [package]`

## Architecture & Structure

- **Hybrid Root**: Both `package.json` and `pyproject.toml` reside in the root.
- **App Router**: `src/app/` contains Next.js routes and pages.
- **Components**: `src/components/` for React components; `src/components/ui/` for shadcn/ui components (auto-generated, do not modify).
- **Styles**: Tailwind v4 configuration in CSS files or inline, utilizing `@tailwindcss/postcss`.
- **MCP Servers**: configured in `.mcp.json` (next-devtools, context7).

## Tech Stack Requirements

### Package Manager

- **pnpm only**: Strictly use pnpm for package management. Do NOT use npm or other package managers.

### Frontend Core

- TypeScript + Next.js (App Router) + Turbopack
- UI: shadcn/ui + Tailwind CSS + Radix UI
- Icons: Lucide Icons (`lucide-react`)
- State Management / Data Fetching / Forms: `zustand`, `swr`, `react-hook-form` + `@hookform/resolvers`
- Animation & Interaction: `framer-motion`, `embla-carousel-react`
- Notifications: `sonner`
- Utilities: `clsx`, `class-variance-authority`

### Content & Editing

- MDX Support: `@mdx-js/loader`, `@mdx-js/react`, `@next/mdx`
- Markdown Editor: `@uiw/react-md-editor`, `markdown-it`

### Backend & Data

- TypeScript
- Database: SQLite (`better-sqlite3`)
- ORM: Prisma (`prisma`, `@prisma/client`)
- Validation: Zod (`zod`)

### Cross-Functional Features

- AI Integration: Vercel AI SDK (`ai`, `@ai-sdk/*`)
- Analytics & Monitoring: OpenPanel (`@openpanel/nextjs`)

## Core Development Principles

1. **Understand before coding**: Before writing code, fully understand the current project structure and complete it accordingly.
2. **Use shadcn/ui properly**: Install components via `pnpm dlx shadcn@latest add xxx --overwrite`. NEVER manually write or modify files under `src/components/ui/` — these are auto-generated.
3. **pnpm only**: Strictly use pnpm. Do NOT use npm or other package managers.
4. **Prefer existing solutions**: For common features, prioritize well-established, popular packages/SDKs over building from scratch.
5. **React Server Components first**: Prioritize RSC to minimize client-side code.
6. **Full type safety**: Maintain comprehensive TypeScript types throughout.
7. **English comments**: All code comments must be in English.
8. **Performance optimization**: Use bundle analysis tools to optimize package size.
9. **Follow latest best practices**: Adhere to official documentation and latest patterns for all technologies.

## Input Processing Requirements

- User inputs typically include product wireframes and prompts
- Carefully analyze wireframe designs to understand user intent and product requirements
- Fully integrate design specs and prompts — do not miss any details
- Identify key business functions, data requirements, and user workflows

## State Management Guidelines

**Golden Rule**: SWR handles all remote data fetching and caching, React Hook Form manages form state and validation, Zustand only manages necessary global/cross-component state. Following this principle leads to more maintainable, efficient, and error-free code.

### React Hook Form (Form State)

**Responsibilities**:
- All form-related state (field values, validation, errors, submission status)
- Form validation logic and error display
- Field dependencies within forms
- Form performance optimization (avoiding unnecessary re-renders)

**Use When**:
- Creating any user input forms (login, registration, data editing)
- Complex field validation scenarios
- Form fields have dependencies
- High-performance form experience needed

**Prohibited Patterns**:
- ❌ Do not mix `useState` in React Hook Form managed forms
- ❌ Do not store form state in Zustand (unless cross-component form sharing is truly needed)
- ❌ Do not mix form submission logic with state updates

### SWR (Data Fetching & Caching)

**Responsibilities**:
- All remote data requests (API, database queries)
- Data caching and automatic revalidation
- Loading and error state handling
- Data prefetching and conditional requests
- Optimistic updates and real-time sync

**Use When**:
- Fetching any data from server
- Caching server responses
- Auto-refreshing data (e.g., on window focus)
- Implementing data dependency chains
- Optimistic UI updates

**Prohibited Patterns**:
- ❌ Do not store purely client-side state in SWR
- ❌ Do not use SWR for form state
- ❌ Do not duplicate full raw data between SWR and Zustand

### Zustand (Global State Coordination)

**Responsibilities**:
- Global UI state (sidebar, theme, language)
- Derived state from user data (permission flags, preferences)
- Cross-component shared application state
- Persisted user preferences

**Use When**:
- Multiple unrelated components need shared state
- Persisting user settings (theme, language)
- Creating derived state from SWR data (permission flags)
- Managing app-level workflow state (multi-step wizards)

**Prohibited Patterns**:
- ❌ Do not make API requests in Zustand (handled by SWR)
- ❌ Do not store full raw API responses in Zustand
- ❌ Do not put single-component state in Zustand
- ❌ Do not use Zustand for form state (unless truly needed for cross-component sharing)

### Data Flow Best Practices

1. **Remote Data Flow**: SWR fetches and caches → Components consume directly → Derived state to Zustand if needed
2. **Form Data Flow**: React Hook Form manages state/validation → Submit via SWR mutate → Optimistic cache updates
3. **UI State Flow**: Zustand manages global UI and preferences → Components access via hooks → Persist with Zustand middleware

## Mandatory Design Requirements

**The following must be implemented in all projects — no exceptions:**

### Responsive Design (Required)

- "Desktop-first, mobile-compatible" strategy
- Use Tailwind responsive classes for adaptive interfaces
- Implement conditional rendering for different device views

### User Experience Enhancement (Required)

- Implement loading states and transition animations
- Add appropriate toast notification feedback
- Optimize form experience and validation feedback
- Implement accessibility standards (A11Y)

### Content & Security (Required)

- Prioritize content accessibility, readability, and user experience
- Implement complete authentication and authorization flows
- Ensure data validation and secure handling
- Implement necessary security and privacy measures

## Development Guidelines

- **Mixed Environment**: Ensure `.gitignore` handles both Node (`node_modules`, `.next`) and Python (`.venv`, `__pycache__`) artifacts.
- **Tailwind v4**: Uses the new engine; configuration might differ from v3 (check `src/app/globals.css` or `postcss.config.mjs`).
- **React 19**: Be aware of new hooks and patterns (e.g., `use`, Server Actions).
