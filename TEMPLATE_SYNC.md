# 🔄 Template Synchronization Guide

Complete guide for syncing your project with Vibe Working Template updates.

## 📋 Table of Contents

- [Quick Start](#quick-start)
- [Complete Workflow](#complete-workflow)
- [Handling Conflicts](#handling-conflicts)
- [Common Scenarios](#common-scenarios)
- [Troubleshooting](#troubleshooting)

---

## ⚡ Quick Start

**Simple Way** (Direct merge - Default):

```bash
# Directly merge to your current branch
./scripts/sync-template.sh

# Test your application
pnpm install
pnpm dev

# Push if everything works
git push
```

**Advanced Way** (With review):

```bash
# Create a new branch for safe merging
./scripts/sync-template.sh --branch

# Review and test
git log --oneline -10
pnpm dev

# Merge back to main
git checkout main
git merge chore/sync-template-YYYYMMDD-HHMMSS

# Clean up
git branch -d chore/sync-template-YYYYMMDD-HHMMSS
```

---

## 🔄 Complete Workflow

The template sync script supports two modes:

### Mode 1: Direct Merge (Default - Simple & Fast)

**Best for:** Quick updates, personal projects, when you trust the template changes

From your project root:

```bash
./scripts/sync-template.sh
```

**What happens:**
1. Script detects your current branch (e.g., `main`)
2. Fetches latest template updates
3. Shows you what will change
4. Asks for confirmation
5. Merges directly to your current branch
6. Guides you through testing

**After sync:**
```bash
# Install new dependencies
pnpm install
uv sync

# Test your application
pnpm dev
pnpm build

# Push to remote
git push
```

**If something went wrong:**
```bash
# Undo the merge (CAREFUL!)
git reset --hard HEAD~1

# Or find and restore previous state
git reflog
```

---

### Mode 2: Branch Mode (Advanced - Safe & Reviewable)

**Best for:** Team projects, major template updates, when you want careful review

From your project root:

```bash
./scripts/sync-template.sh --branch
```

**What happens:**
1. Script detects your current branch (e.g., `main`)
2. Creates a new branch: `chore/sync-template-20251209-143000`
3. Switches to the new branch
4. Fetches and merges template updates
5. Lets you review and test in isolation

**Step-by-step workflow:**

#### Step 1: Review the Changes

```bash
# View commit history
git log --oneline -10

# View file changes
git diff main

# View specific files
git diff main -- package.json
git diff main -- src/app/

# View changed files list
git diff --name-status main
```

#### Step 2: Test Your Application

```bash
# Install dependencies
pnpm install
uv sync

# Run development server
pnpm dev

# Run tests
pnpm test

# Check build
pnpm build
```

**Test checklist:**
- [ ] Application starts without errors
- [ ] Core features still work
- [ ] No console errors
- [ ] Tests pass
- [ ] Build succeeds

#### Step 3: Merge Back to Main

If everything looks good:

```bash
# Switch back to main
git checkout main

# Merge the sync branch
git merge chore/sync-template-20251209-143000
```

#### Step 4: Clean Up

```bash
# Delete the sync branch
git branch -d chore/sync-template-20251209-143000

# Push to remote
git push origin main
```

---

## ⚠️ Handling Conflicts

### If Conflicts Occur During Sync

The script will stop and show:

```
✗ Merge conflicts detected

Please resolve conflicts manually:
  1. Fix conflicts in the listed files
  2. Run: git add <resolved-files>
  3. Run: git commit
  4. Continue with the next steps shown above
```

**How to resolve:**

1. **Check which files have conflicts:**
   ```bash
   git status
   ```

2. **Open conflicted files in your editor.** Look for conflict markers:
   ```
   <<<<<<< HEAD
   Your code
   =======
   Template code
   >>>>>>> template/master
   ```

3. **Resolve each conflict:**
   - Keep your changes
   - Keep template changes
   - Or merge both (most common)

4. **Mark as resolved:**
   ```bash
   git add <resolved-file>
   ```

5. **Complete the merge:**
   ```bash
   git commit
   ```

6. **Continue with testing (Step 3)**

---

### If Conflicts Occur During Merge to Main

```bash
git checkout main
git merge chore/sync-template-20251209-143000
# CONFLICT! Auto-merging failed
```

**Resolution is the same:**

1. Check conflicts: `git status`
2. Fix conflicts in files
3. Stage resolved files: `git add <file>`
4. Complete merge: `git commit`

---

## 🎯 Common Scenarios

### Scenario 1: "I want a quick and simple update"

Use the default mode (direct merge):

```bash
./scripts/sync-template.sh
```

This is the simplest way - merges directly to your current branch.

---

### Scenario 2: "I want to create a Pull Request for review"

Perfect for team workflows - use branch mode:

```bash
# 1. Run sync script with --branch flag
./scripts/sync-template.sh --branch

# 2. Review and test
pnpm dev

# 3. Push sync branch to remote
git push -u origin chore/sync-template-20251209-143000

# 4. Go to GitHub/GitLab and create a Pull Request
# 5. Request team review
# 6. Merge PR when approved
```

---

### Scenario 3: "I don't like these changes, abort!"

**If using default mode (already merged to main):**

```bash
# Undo the merge (if not pushed yet)
git reset --hard HEAD~1

# If already pushed, create a revert commit
git revert -m 1 HEAD
```

⚠️ **Warning:** Be careful with `reset --hard` - it permanently deletes commits.

**If using branch mode (still on sync branch):**

```bash
# Switch back to main
git checkout main

# Delete the sync branch
git branch -D chore/sync-template-20251209-143000
```

Much safer with branch mode!

---

### Scenario 4: "I want to sync only specific files"

After running the sync script:

```bash
# On the sync branch, cherry-pick specific changes
git checkout main
git checkout chore/sync-template-20251209-143000 -- path/to/file.ts

# Or use interactive staging
git add -p
```

---

## 🔧 Troubleshooting

### Problem: "fatal: refusing to merge unrelated histories"

**Solution:** The script uses `--allow-unrelated-histories`. If you're doing manual sync:

```bash
git merge template/master --allow-unrelated-histories
```

---

### Problem: "error: Your local changes would be overwritten"

**Solution:** Stash or commit your changes first:

```bash
# Stash changes
git stash
./scripts/sync-template.sh
git stash pop

# Or commit changes
git add .
git commit -m "WIP: before template sync"
./scripts/sync-template.sh
```

---

### Problem: "I accidentally deleted files during conflict resolution"

**Solution:** Restore from the sync branch:

```bash
git checkout chore/sync-template-20251209-143000 -- path/to/file
```

---

### Problem: "The sync branch has too many conflicts"

**Solution:** Manual selective merge:

```bash
# Start fresh
git checkout main

# Manually merge specific commits
git cherry-pick <commit-hash>

# Or manually copy files
git show template/master:path/to/file > path/to/file
```

---

## 📚 Visual Workflow Diagram

```
Your Project (main)
    │
    ├─── ./scripts/sync-template.sh
    │
    ├─── Creates: chore/sync-template-20251209-143000
    │              │
    │              ├─── Template updates merged here
    │              ├─── Review changes
    │              ├─── Test application
    │              └─── All good? ✓
    │                       │
    │                       ├─── git checkout main
    │                       ├─── git merge chore/sync-template-...
    │                       └─── git branch -d chore/sync-template-...
    │
    └─── main (updated with template changes) ✓
```

---

## 🎓 Best Practices

1. **Always test before merging to main**
   - Run dev server
   - Check all features
   - Run tests and linter

2. **Use PR workflow for team projects**
   - Create PR from sync branch
   - Request code review
   - Merge after approval

3. **Sync regularly**
   - Monthly or quarterly
   - After major template releases
   - Before starting new features

4. **Document custom changes**
   - Add comments explaining customizations
   - Keep a CHANGELOG of your changes
   - Makes future syncs easier

5. **Backup before major syncs**
   - Create a backup branch: `git branch backup-before-sync`
   - Or tag the current state: `git tag before-template-sync-2024-12-09`

---

## 🆘 Need Help?

- **Script issues:** Check [GitHub Issues](https://github.com/thinkthinking/vibe-working-template/issues)
- **Git help:** [Git Documentation](https://git-scm.com/doc)
- **Conflict resolution:** [Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/using-branches/merge-conflicts)

---

<div align="center">
  <p>Made with ❤️ for developers who build upon templates</p>
</div>
