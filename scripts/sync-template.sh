#!/bin/bash

# Vibe Working Template - Sync Script
# Synchronize your project with the latest template updates
# Usage: ./scripts/sync-template.sh [--branch]

set -e

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Template repository configuration
TEMPLATE_REPO="https://github.com/thinkthinking/vibe-working-template.git"
TEMPLATE_REMOTE="template"
TEMPLATE_BRANCH="master"
SYNC_BRANCH="chore/sync-template-$(date +%Y%m%d-%H%M%S)"

# Parse command line arguments
# Default: direct merge to current branch (simple)
# --branch: create new branch for safe merging (advanced)
USE_BRANCH=false
if [[ "$1" == "--branch" ]]; then
    USE_BRANCH=true
fi

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Vibe Working Template - Sync Script                       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree &> /dev/null; then
    echo -e "${RED}✗ Error: Not a git repository${NC}"
    echo "  Please run this script from your project root directory."
    exit 1
fi

# Get current branch name
CURRENT_BRANCH=$(git branch --show-current)
echo -e "${BLUE}→ Current branch: ${GREEN}${CURRENT_BRANCH}${NC}"

# Check for uncommitted changes
if [[ -n $(git status --porcelain) ]]; then
    echo -e "${YELLOW}⚠ Warning: You have uncommitted changes${NC}"
    echo ""
    git status --short
    echo ""
    read -p "Do you want to stash your changes? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git stash push -m "Auto-stash before template sync"
        echo -e "${GREEN}✓ Changes stashed${NC}"
        STASHED=true
    else
        echo -e "${RED}✗ Aborted: Please commit or stash your changes first${NC}"
        exit 1
    fi
fi

# Check if template remote exists
if ! git remote | grep -q "^${TEMPLATE_REMOTE}$"; then
    echo -e "${YELLOW}→ Template remote not found. Adding...${NC}"
    git remote add "$TEMPLATE_REMOTE" "$TEMPLATE_REPO"
    echo -e "${GREEN}✓ Added template remote: ${TEMPLATE_REPO}${NC}"
else
    echo -e "${GREEN}✓ Template remote already exists${NC}"
fi

# Fetch latest template updates
echo -e "${BLUE}→ Fetching latest template updates...${NC}"
if git fetch "$TEMPLATE_REMOTE" "$TEMPLATE_BRANCH"; then
    echo -e "${GREEN}✓ Fetched latest updates from template${NC}"
else
    echo -e "${RED}✗ Error: Failed to fetch template updates${NC}"
    exit 1
fi

# Show what will be merged
echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${YELLOW}Template Updates Available:${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"

# Get the common ancestor
MERGE_BASE=$(git merge-base HEAD "${TEMPLATE_REMOTE}/${TEMPLATE_BRANCH}" 2>/dev/null || echo "")

if [[ -z "$MERGE_BASE" ]]; then
    echo -e "${YELLOW}⚠ No common history found (first-time sync)${NC}"
    echo "  This might result in merge conflicts. Please review carefully."
else
    # Show commit log
    echo ""
    git log --oneline --graph --decorate HEAD.."${TEMPLATE_REMOTE}/${TEMPLATE_BRANCH}" || echo "No new commits"

    # Show file changes summary
    echo ""
    echo -e "${YELLOW}Files that will be affected:${NC}"
    git diff --name-status HEAD "${TEMPLATE_REMOTE}/${TEMPLATE_BRANCH}" | head -20

    TOTAL_CHANGES=$(git diff --name-only HEAD "${TEMPLATE_REMOTE}/${TEMPLATE_BRANCH}" | wc -l)
    if [[ $TOTAL_CHANGES -gt 20 ]]; then
        echo -e "${YELLOW}... and $((TOTAL_CHANGES - 20)) more files${NC}"
    fi
fi

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

# Merge strategy
if [[ "$USE_BRANCH" == true ]]; then
    # Advanced mode: Create new branch for safe merging
    echo -e "${BLUE}→ Advanced mode: Creating sync branch for safe merging${NC}"
    echo -e "${GREEN}→ Creating sync branch: ${SYNC_BRANCH}${NC}"
    git checkout -b "$SYNC_BRANCH"

    echo -e "${BLUE}→ Merging template updates...${NC}"
    if git merge "${TEMPLATE_REMOTE}/${TEMPLATE_BRANCH}" --no-ff -m "chore: sync with template updates" --allow-unrelated-histories; then
        echo -e "${GREEN}✓ Template updates merged successfully${NC}"
        echo ""
        echo -e "${GREEN}═══════════════════════════════════════════════════════════${NC}"
        echo -e "${GREEN}Success! Next steps:${NC}"
        echo -e "${GREEN}═══════════════════════════════════════════════════════════${NC}"
        echo ""
        echo -e "${YELLOW}STEP 1: Review the changes${NC}"
        echo -e "   ${BLUE}git log --oneline -10${NC}          # View commit history"
        echo -e "   ${BLUE}git diff ${CURRENT_BRANCH}${NC}              # View all changes"
        echo ""
        echo -e "${YELLOW}STEP 2: Test your application${NC}"
        echo -e "   ${BLUE}pnpm install${NC}                   # Install any new dependencies"
        echo -e "   ${BLUE}pnpm dev${NC}                       # Start development server"
        echo -e "   ${BLUE}pnpm build${NC}                     # Test production build"
        echo ""
        echo -e "${YELLOW}STEP 3: Merge back to your branch${NC}"
        echo -e "   ${BLUE}git checkout ${CURRENT_BRANCH}${NC}"
        echo -e "   ${BLUE}git merge ${SYNC_BRANCH}${NC}"
        echo ""
        echo -e "${YELLOW}STEP 4: Clean up${NC}"
        echo -e "   ${BLUE}git branch -d ${SYNC_BRANCH}${NC}"
        echo ""
        echo -e "${BLUE}────────────────────────────────────────────────────────────${NC}"
        echo -e "${BLUE}Alternative: Create Pull Request for team review${NC}"
        echo -e "   ${BLUE}git push -u origin ${SYNC_BRANCH}${NC}"
        echo "   Then create a PR on GitHub/GitLab"
        echo ""
        echo -e "${BLUE}────────────────────────────────────────────────────────────${NC}"
        echo -e "${YELLOW}To discard these changes:${NC}"
        echo -e "   ${BLUE}git checkout ${CURRENT_BRANCH}${NC}"
        echo -e "   ${BLUE}git branch -D ${SYNC_BRANCH}${NC}"
        echo ""
        echo -e "${GREEN}📖 For detailed guidance, see: ${BLUE}TEMPLATE_SYNC.md${NC}"

        # Restore stash if needed
        if [[ "$STASHED" == true ]]; then
            echo ""
            echo -e "${YELLOW}⚠ Don't forget to restore your stashed changes:${NC}"
            echo -e "     ${BLUE}git stash pop${NC}"
        fi
    else
        echo -e "${RED}✗ Merge conflicts detected${NC}"
        echo ""
        echo -e "${YELLOW}Please resolve conflicts manually:${NC}"
        echo "  1. Fix conflicts in the listed files"
        echo "  2. Run: git add <resolved-files>"
        echo "  3. Run: git commit"
        echo "  4. Continue with the next steps shown above"
        echo ""
        echo -e "${YELLOW}To abort this merge:${NC}"
        echo -e "  ${BLUE}git merge --abort${NC}"
        echo -e "  ${BLUE}git checkout ${CURRENT_BRANCH}${NC}"
        echo -e "  ${BLUE}git branch -D ${SYNC_BRANCH}${NC}"
        exit 1
    fi
else
    # Default mode: Direct merge to current branch (simple and fast)
    echo -e "${GREEN}→ Merging template updates to current branch: ${CURRENT_BRANCH}${NC}"
    echo ""
    read -p "Continue with merge? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED}✗ Aborted by user${NC}"
        exit 1
    fi

    echo -e "${BLUE}→ Merging template updates...${NC}"
    if git merge "${TEMPLATE_REMOTE}/${TEMPLATE_BRANCH}" --no-ff -m "chore: sync with template updates" --allow-unrelated-histories; then
        echo -e "${GREEN}✓ Template updates merged successfully to ${CURRENT_BRANCH}!${NC}"
        echo ""
        echo -e "${GREEN}═══════════════════════════════════════════════════════════${NC}"
        echo -e "${GREEN}Next steps:${NC}"
        echo -e "${GREEN}═══════════════════════════════════════════════════════════${NC}"
        echo ""
        echo -e "${YELLOW}1. Install any new dependencies:${NC}"
        echo -e "   ${BLUE}pnpm install${NC}"
        echo -e "   ${BLUE}uv sync${NC}"
        echo ""
        echo -e "${YELLOW}2. Test your application:${NC}"
        echo -e "   ${BLUE}pnpm dev${NC}"
        echo -e "   ${BLUE}pnpm build${NC}"
        echo ""
        echo -e "${YELLOW}3. If everything works, push to remote:${NC}"
        echo -e "   ${BLUE}git push${NC}"
        echo ""
        echo -e "${BLUE}────────────────────────────────────────────────────────────${NC}"
        echo -e "${YELLOW}If something went wrong:${NC}"
        echo -e "   ${BLUE}git reset --hard HEAD~1${NC}  # Undo the merge (CAREFUL!)"
        echo -e "   ${BLUE}git reflog${NC}                # Find and restore previous state"

        # Restore stash if needed
        if [[ "$STASHED" == true ]]; then
            echo ""
            echo -e "${YELLOW}⚠ Restoring your stashed changes...${NC}"
            if git stash pop; then
                echo -e "${GREEN}✓ Stashed changes restored${NC}"
            else
                echo -e "${RED}✗ Could not restore stash automatically${NC}"
                echo -e "${YELLOW}  You may need to resolve conflicts manually${NC}"
                echo -e "  Run: ${BLUE}git stash list${NC} to see your stashes"
            fi
        fi
    else
        echo -e "${RED}✗ Merge conflicts detected${NC}"
        echo ""
        echo -e "${YELLOW}To resolve conflicts:${NC}"
        echo "  1. Fix conflicts in the listed files"
        echo "  2. Run: ${BLUE}git add <resolved-files>${NC}"
        echo "  3. Run: ${BLUE}git commit${NC}"
        echo ""
        echo -e "${YELLOW}To abort the merge:${NC}"
        echo "  Run: ${BLUE}git merge --abort${NC}"
        exit 1
    fi
fi

echo ""
echo -e "${GREEN}✓ Sync complete!${NC}"
echo -e "${BLUE}💡 Tip: For safer merging with review, use ${YELLOW}--branch${BLUE} flag next time${NC}"
