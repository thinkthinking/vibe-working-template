---
description:
globs:
alwaysApply: true
---

# Repository Guidelines

## Role & Responsibilities
- Act as a modern full-stack expert balancing product, design, and engineering concerns for enterprise-grade web apps.
- Before coding, analyze the existing project structure alongside any provided wireframes or prompts to capture every requirement, workflow, and data need.

## Project Structure
- **Root**: Hybrid workspace with `package.json` (Next.js) and `pyproject.toml` (Python via `uv`).
- **Frontend (`src/`)**:
  - `src/app/`: Next.js 16 App Router pages, layouts, and global styles (Tailwind CSS v4).
  - `src/components/`: React components; `src/components/ui/` houses shadcn/ui-generated primitives (do not hand-edit these files; add components via `pnpm dlx shadcn@latest add <name> --overwrite`).
  - `src/lib/`: Shared utilities (e.g., `utils.ts`).
- **Backend/Scripts**: Python scripts such as `main.py`, executed with `uv` tooling.
- **Assets**: Static files belong in `public/`.

## Build & Tooling Commands
- `pnpm install` – install Node dependencies (always use `pnpm`, never `npm` or other managers).
- `pnpm dev` – run the Next.js dev server (Turbopack) on http://localhost:3000.
- `pnpm build` – create a production build; ensure it passes before releasing.
- `pnpm lint` – execute ESLint.
- `pnpm dlx shadcn@latest add <component> --overwrite` – add shadcn/ui components.
- `uv sync` – install Python deps.
- `uv run main.py` – run the Python entry point.
- `uv add <package>` – add Python deps.

## Technical Stack Expectations
- **Frontend Core**: TypeScript + Next.js App Router, Turbopack, Tailwind CSS v4, shadcn/ui, Radix UI, Lucide icons, SWR, Zustand, React Hook Form (+ `@hookform/resolvers`), `clsx`, `class-variance-authority`, `sonner`, `framer-motion`, `embla-carousel-react`.
- **Content & Editing**: MDX support via `@next/mdx`, `@mdx-js/loader`, `@mdx-js/react`; Markdown editing with `@uiw/react-md-editor` and `markdown-it`.
- **Backend/Data**: TypeScript services, SQLite via `better-sqlite3`, Prisma (`prisma`, `@prisma/client`), validation with `zod`.
- **Cross-Cutting**: Vercel AI SDK (`ai`, `@ai-sdk/*`), analytics via `openpanel`, `@openpanel/nextjs`.

## Coding Style & Architecture
- Embrace React 19 patterns (Server Components, Server Actions, `use` hook) and favor React Server Components with minimal client bundles.
- Maintain end-to-end type safety and follow Tailwind CSS v4 conventions in `globals.css` or inline classes.
- Components should be functional with named or default exports as context demands; PascalCase for React components, camelCase for logic utilities, kebab-case optional for standalone utilities.
- Use established libraries/SDKs for common functionality rather than bespoke solutions.
- Comments must be in English.
- Always prioritize performance (e.g., leverage bundle analyzers) and adhere to latest best practices.

## State Management Responsibilities
- **React Hook Form**: sole owner of form state, validation, dependencies, submission state; do not mix with `useState` or store form data in Zustand unless cross-component sharing is mandatory.
- **SWR**: handles all remote data fetching, caching, revalidation, optimistic updates, and dependent queries. Do not use it for purely client state or form state.
- **Zustand**: manages necessary global UI state, derived user preferences, workflow coordination, and persisted settings. Do not initiate API calls or store full API payloads here.
- **Data Flow Best Practices**:
  1. Remote data lives in SWR; components consume it directly, deriving minimal state into Zustand when needed (e.g., permission flags).
  2. Forms live entirely in React Hook Form; submissions call APIs (optionally via `mutate`) and update SWR caches optimistically.
  3. Global UI/prefs live in Zustand with optional persistence middleware.
- **Golden Rules**:
  1. Form state -> React Hook Form.
  2. Remote data -> SWR.
  3. Cross-component/global state -> Zustand only when truly shared.
  4. Maintain single responsibility—no duplicated state across layers.

## UX & Design Requirements
- **Responsive Design**: Desktop-first with mobile compatibility, using Tailwind responsive classes and conditional rendering per device context.
- **Experience Enhancements**: Provide loading states, transitions/animations, toast notifications, optimized form validation feedback, and ensure A11Y compliance.
- **Content & Security**: Prioritize accessible/readable content, build full authentication & authorization flows, enforce robust validation and privacy protections.

## Testing Guidelines
- No default frontend test runner is configured; when adding tests, favor Vitest or Jest for frontend and pytest for Python scripts.
- Manually verify critical features when automated coverage is absent.

## Commit & PR Guidelines
- Write descriptive commit messages (e.g., `feat: add user profile page`).
- PRs must summarize changes and ensure `pnpm build` and `pnpm lint` pass before submission.
- Update Node dependencies with `pnpm` and Python dependencies with `uv` only.

## Configuration & Environment
- Store secrets in `.env.local`; never commit sensitive data.
- Always use `pnpm` for Node packages and `uv` for Python environment management.
- `uv` maintains the Python virtual environment automatically.

