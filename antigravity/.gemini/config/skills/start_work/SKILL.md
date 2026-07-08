---
name: start_work
description: Start working on a project using an existing gameplan file. Use when you need to start or resume implementation work on a task.
---

# Start Work Skill

Start implementation work on a project by reading the gameplan and coordinating tasks.

## Expected Arguments

This skill requires:
- **gameplan-identifier**: A ticket ID (e.g., PROJ-123) or a project name (e.g., "refactor-auth-module")

If the identifier is not provided, list available gameplan files in `~/workspace/gameplans/` and ask the user to choose.

## Process

### 1. Locate and Read Gameplan

1. Parse the input to get the gameplan identifier.
2. Look for the gameplan file at `~/workspace/gameplans/gameplan-<identifier>.md`.
3. If not found, list available gameplan files in `~/workspace/gameplans/` and prompt the user.
4. Read and parse the gameplan file to extract:
   - Workspace path
   - Branch name
   - Objectives
   - Acceptance criteria
   - Tasks (with their completion status)
   - Open questions

### 2. Validate Workspace

1. Verify the worktree exists at the specified workspace path.
2. If not, ask the user if they want to run `/init_workspace` first.
3. Check the worktree is on the correct branch using `git worktree list`.
4. Navigate to the workspace directory.

### 3. Understand Current State

1. Check git status for any uncommitted changes.
2. Review completed tasks in the gameplan.
3. Identify the next pending task(s) to work on.
4. If there are open questions marked as blockers, surface them to the user first.

### 4. Execute Tasks

For each pending task in the gameplan:

1. **Mark task as in-progress**
2. **Analyze the task** -- understand what needs to be done.
3. **Research** relevant code sections, dependencies, architecture as needed.
4. **Implement the changes** following the proposed approach in the gameplan.
5. **Update and commit the gameplan** (see section 5).
6. **Commit code changes** if appropriate (ask the user first).

### 5. Update Gameplan (after every completed task)

After completing **each task** (not just at the end), update and commit the gameplan:

1. Mark completed tasks with `[x]`.
2. Add an entry to the Progress Log with the date and a summary.
3. Update the Notes section with any discoveries.
4. Add new tasks if the scope expanded.
5. Update Open Questions if any arose.
6. **Commit the gameplan file** in the `~/workspace/gameplans/` repo:
   ```bash
   cd ~/workspace/gameplans
   git add gameplan-<identifier>.md
   git commit -m "update gameplan-<identifier>: mark <task summary> complete"
   ```

This ensures the gameplan is always up to date and recoverable if a session is interrupted.

### 6. Checkpoint with User

At regular intervals or after significant progress:

1. Summarize what was accomplished.
2. Show updated task status.
3. Ask if the user wants to continue, pause, or adjust priorities.
4. If pausing, ensure the gameplan is fully updated for the next session.

## Important Notes

- Always verify with the user before making significant changes.
- Commit frequently with descriptive messages.
- **Commit the gameplan after every task completion** -- `~/workspace/gameplans/` is a git repo.
- Keep the gameplan updated as the single source of truth.
- Surface blockers and open questions early.
- Write research output to `~/llm-notes/` and commit (also a git repo).
