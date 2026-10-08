---
name: gameplan
description: Single unified workflow skill for creating and maintaining gameplans and specifications directly under workspace/gameplans/.
---

# Gameplan Workflow Skill

Store all project gameplans, specifications, research notes, and execution tracking in unified gameplan files under `~/workspace/gameplans/gameplan-<identifier>.md`.

## Guidelines

1. **Unified Storage Location**:
   - All gameplans, specifications, and research notes must be stored directly in `~/workspace/gameplans/`.
   - Do NOT create separate `llm-notes/` subdirectories or standalone research files.

2. **File Naming Convention**:
   - `~/workspace/gameplans/gameplan-<identifier>.md`

3. **Gameplan Structure**:
   - Header with identifier, creation date, workspace path, and primary tooling.
   - **Overview & Architecture**: Diagram and component specification.
   - **System Requirements & Specs**: Component configuration, endpoints, data formats.
   - **Dual-Mode Script Specification**: CLI usage, mode parameters (`generate`, `attack`).
   - **Metrics & Verification**: Success criteria and telemetry metrics endpoints.
   - **Tasks**: Checklists tracking progress.
   - **Progress Log**: Append-only log of completed work.

4. **Version Control**:
   - `~/workspace/gameplans/` is a git repository.
   - Commit gameplan updates after completing major tasks or changing requirements:
     ```bash
     cd ~/workspace/gameplans
     git add gameplan-<identifier>.md
     git commit -m "update gameplan-<identifier>: <description>"
     ```
