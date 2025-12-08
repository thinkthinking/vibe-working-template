---
name: meta-skills
description: Create Claude Code agent skills. Use when the user requests to create, scaffold, or build a new skill for Claude Code.
allowed-tools: Read, Write, Bash, Glob
---

# Meta-Skills: Skill Builder

Creates structured Claude Code agent skills following best practices.

## Core Requirements

1. **Name**: lowercase, hyphens only, max 64 chars
2. **Description**: what it does + when to use it, max 1024 chars
3. **Structure**: SKILL.md with YAML frontmatter + Markdown content

## Workflow

### 1. Gather Requirements
- Skill purpose
- Target use cases
- Required dependencies
- Tool restrictions (if any)

### 2. Create Skill

```bash
mkdir -p .claude/skills/[skill-name]
```

### 3. Write SKILL.md

```yaml
---
name: skill-name
description: What it does. Use when [trigger conditions].
allowed-tools: Read, Write, Bash  # Optional: restrict tools
---

# Skill Name

## Instructions
1. Step-by-step guidance
2. Clear, actionable steps
3. No fluff

## Examples
Concrete usage examples
```

### 4. Add Supporting Files (if needed)

```
skill-name/
├── SKILL.md
├── reference.md      # Optional: detailed docs
├── examples.md       # Optional: more examples
└── scripts/          # Optional: utilities
    └── helper.py
```

## Best Practices

**Description triggers**: Include specific keywords users would mention
- Good: "Generate git commit messages from diffs. Use when writing commits or staging changes."
- Bad: "Helps with git"

**Focus**: One capability per skill
- Good: "PDF form filling"
- Bad: "Document processing" (too broad)

**Instructions**: Direct, actionable, no unnecessary text

**YAML**: No tabs, proper indentation, quotes for special chars

## Reference

Available in `.claude/skills/meta-skills/docs/claude-code-agent-skills.md` for detailed guidance.

## Common Patterns

**Read-only skill**:
```yaml
allowed-tools: Read, Grep, Glob
```

**Script-based skill**:
```yaml
description: [...]. Requires [package-name] package.
```

**Multi-file skill**: Reference additional files via `[file.md](file.md)`
