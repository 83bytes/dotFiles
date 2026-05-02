---
description: Create a gameplan file for a new work item
---

Create a gameplan file to plan and track progress on a work item.

## Arguments

This command requires one argument:
- **identifier**: A ticket ID (e.g., PROJ-123) or a project name (e.g., "refactor-auth-module")

Arguments: `$ARGUMENTS`

If argument is not provided, ask the user what they want to work on.

## Process

### 1. Parse Arguments

1. Parse `$ARGUMENTS` to extract the identifier
2. If missing, ask the user to provide it
3. Detect if the identifier looks like a ticket ID (matches pattern like `PROJ-123`, `ABC-1234`) or a project name

### 2. Create Gameplan File

Create `~/workspace/gameplans/gameplan-<identifier>.md` with the following template:

```markdown
# Gameplan: <IDENTIFIER>

## Information
- **Identifier**: <identifier>
- **Created**: <current date>

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
- Created gameplan

## Notes

```

### 3. Commit the Gameplan

The gameplans directory is a git repo. Commit the new file:

```bash
cd ~/workspace/gameplans
git add gameplan-<identifier>.md
git commit -m "add gameplan-<identifier>"
```

### 4. Final Output

1. Display the gameplan path: `~/workspace/gameplans/gameplan-<identifier>.md`
2. **Instruct the user to review and edit the gameplan before starting work**

## Example Usage

```
/init_work PROJ-123
```
This will create `~/workspace/gameplans/gameplan-PROJ-123.md`

```
/init_work refactor-auth-module
```
This will create `~/workspace/gameplans/gameplan-refactor-auth-module.md`

$ARGUMENTS
