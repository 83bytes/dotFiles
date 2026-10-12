---
name: init_workspace
description: Initialize a git worktree and centralized gameplan for new work.
---

# Initialize Workspace Skill

Initialize a new workspace by creating a git worktree and a centralized gameplan file.

## Expected Arguments

This skill requires two pieces of information:
- **identifier**: A project or task name (e.g., "refactor-auth-module")
- **primary-repo**: The repository name to create the worktree from

If either piece of information is missing, prompt the user for it.

## Process

### 1. Parse Arguments

1. Parse the input to extract the identifier and primary-repo.
2. If either is missing, ask the user to provide them.
3. Use the identifier as a descriptive project or task name.

### 2. Validate Environment

1. Check that the primary repo exists at `~/workspace/<primary-repo>`.
2. Verify it's a git repository.
3. If not found, list available repos under `~/workspace/` and ask the user to choose.

### 3. Create Git Worktree

1. Navigate to the primary repo: `~/workspace/<primary-repo>`.
2. Fetch latest from remote: `git fetch origin`.
3. Generate branch name and worktree path:

   - Branch format: `<identifier>`
   - Worktree path: `~/workspace/<primary-repo>-<identifier>`
   - Gameplan file: `~/workspace/gameplans/gameplan-<identifier>.md`

4. Create the worktree:
   ```bash
   git worktree add -b <branch-name> <worktree-path> origin/main
   ```
   - If `origin/main` doesn't exist, try `origin/master`.
   - If the branch already exists, use `git worktree add <worktree-path> <branch-name>` instead.

### 4. Create Gameplan

Create `~/workspace/gameplans/gameplan-<identifier>.md` with the following template:

```markdown
# Gameplan: <IDENTIFIER>

## Information
- **Identifier**: <identifier>
- **Created**: <current date>
- **Workspace**: ~/workspace/<primary-repo>-<identifier>
- **Branch**: <branch-name>

## Objective
<To be filled -- describe what this work is about>

## Acceptance Criteria
<To be filled -- define what "done" looks like>

## Proposed Approach
<To be filled -- initial thoughts on how to tackle this>

## Tasks
- [ ] Task 1
- [ ] Task 2

## Open Questions
<Blockers or ambiguities to resolve before starting>

## Progress Log
### <current date>
- Initialized workspace

## Notes

```

### 5. Review and Commit the Gameplan

If `~/workspace/gameplans/` is version-controlled, show the diff and receive approval before committing the new file:

```bash
cd ~/workspace/gameplans
git add gameplan-<identifier>.md
git commit -m "add gameplan-<identifier>: initialize workspace"
```

### 6. Final Output

1. Confirm the worktree was created successfully.
2. Display the workspace path: `~/workspace/<primary-repo>-<identifier>`.
3. Display the gameplan path: `~/workspace/gameplans/gameplan-<identifier>.md`.
4. Instruct the user to review the gameplan before implementation.
