---
name: gameplan
description: Unified workflow for centralized gameplans and research notes.
---

# Gameplan Workflow Skill

Store project gameplans and specifications under `~/workspace/gameplans/gameplan-<identifier>.md`. Store research under `~/workspace/gameplans/llm-notes/<name>.md`.

## Guidelines

1. **Centralized Storage**:
   - Gameplans and specifications: `~/workspace/gameplans/gameplan-<identifier>.md`.
   - Research notes: `~/workspace/gameplans/llm-notes/<name>.md`.
   - No project-local `GAMEPLAN.md` files.

2. **File Naming Convention**:
   - `~/workspace/gameplans/gameplan-<identifier>.md`

3. **Gameplan Structure**:
   - Header with identifier, creation date, workspace path, and primary tooling.
   - Objective, acceptance criteria, approach, tasks, and open questions.
   - Verification commands and expected results.
   - **Tasks**: Checklists tracking progress.
   - **Progress Log**: Append-only log of completed work.

4. **Version Control**:
   - Keep updates version-controlled when `~/workspace/gameplans/` is a git repository.
   - After diff review and user approval, commit gameplan updates after task completion or requirement changes:
     ```bash
     cd ~/workspace/gameplans
     git add gameplan-<identifier>.md
     git commit -m "update gameplan-<identifier>: <description>"
     ```
