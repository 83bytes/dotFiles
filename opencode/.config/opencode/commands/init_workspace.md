---
description: Initialize a git worktree workspace with a gameplan file
---

Initialize a new workspace for a task by creating a git worktree and a gameplan file to track progress.

## Arguments

This command requires two arguments:
- **identifier**: A ticket ID (e.g., PROJ-123) or a project name (e.g., "refactor-auth-module")
- **primary-repo**: The repository name to create the worktree from

Arguments: `$ARGUMENTS`

If arguments are not provided or incomplete, prompt the user for the missing information.

## Process

### 1. Parse Arguments

1. Parse `$ARGUMENTS` to extract the identifier and primary-repo
2. If either is missing, ask the user to provide them
3. Detect if the identifier looks like a ticket ID (matches pattern like `PROJ-123`, `ABC-1234`) or a project name

### 2. Validate Environment

1. Check that the primary repo exists at `~/workspace/<primary-repo>`
2. Verify it's a git repository
3. If not found, list available repos under `~/workspace/` and ask user to choose

### 3. Create Git Worktree

1. Navigate to the primary repo: `~/workspace/<primary-repo>`
2. Fetch latest from remote: `git fetch origin`
3. Generate branch name and worktree path:

   **If ticket ID:**
   - Branch format: `<identifier>-<short-summary>` (e.g., `PROJ-123-add-user-auth`)
   - Worktree path: `~/workspace/<primary-repo>-<identifier>`
   - Gameplan file: `~/workspace/gameplans/gameplan-<identifier>.md`

   **If project name:**
   - Branch format: `<identifier>` (e.g., `refactor-auth-module`)
   - Worktree path: `~/workspace/<primary-repo>-<identifier>`
   - Gameplan file: `~/workspace/gameplans/gameplan-<identifier>.md`

4. Create the worktree:
   ```bash
   git worktree add -b <branch-name> <worktree-path> origin/main
   ```
   - If `origin/main` doesn't exist, try `origin/master`
   - If the branch already exists, use `git worktree add <worktree-path> <branch-name>` instead

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

### 5. Commit the Gameplan

The gameplans directory is a git repo. Commit the new file:

```bash
cd ~/workspace/gameplans
git add gameplan-<identifier>.md
git commit -m "add gameplan-<identifier>: initialize workspace"
```

### 6. Final Output

1. Confirm the worktree was created successfully
2. Display the workspace path: `~/workspace/<primary-repo>-<identifier>`
3. Display the gameplan path: `~/workspace/gameplans/gameplan-<identifier>.md`
4. **Instruct the user to review and edit the gameplan before starting work**

## Example Usage

```
/init_workspace PROJ-123 my-service
```
This will:
1. Create worktree at `~/workspace/my-service-PROJ-123`
2. Create branch `PROJ-123-<summary>` based on `origin/main`
3. Create `~/workspace/gameplans/gameplan-PROJ-123.md`

```
/init_workspace refactor-auth-module my-service
```
This will:
1. Create worktree at `~/workspace/my-service-refactor-auth-module`
2. Create branch `refactor-auth-module` based on `origin/main`
3. Create `~/workspace/gameplans/gameplan-refactor-auth-module.md`

$ARGUMENTS
