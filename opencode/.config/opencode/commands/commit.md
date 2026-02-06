---
description: Create a commit following conventional commit guidelines
---

Create a git commit following conventional commit message guidelines.

## Commit Message Format

The commit message must follow this format:

```
<type>: <description>

<body explaining WHY this change is needed>

```

## Guidelines

### Type (required)
Must be one of:
- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, etc.)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **build**: Changes that affect the build system or external dependencies
- **ci**: Changes to CI configuration files and scripts
- **chore**: Changes to build process or auxiliary tools
- **revert**: Reverting a previous commit

### Description
- Keep it short (~50 chars)
- Use imperative, present tense: "change" not "changed" nor "changes"
- Don't capitalize the first letter
- No period at the end

### Message Body
- Explain WHY the change is needed, not just what was changed
- Provide context for future readers
- Use bullet points
- Think: "What would help me understand this change 2 years from now?"

## Instructions

1. First run `git status` and `git diff --staged` to see what changes are staged
2. If no changes are staged, inform the user they need to stage changes first
3. Analyze the staged changes to understand what was modified
4. Based on the changes, suggest an appropriate type and scope
5. Draft a commit message following the format above
6. Show the proposed commit message to the user for approval
7. Once approved, create the commit using `git commit` (do NOT use -m flag, use a temp file or heredoc for multi-line messages)

$ARGUMENTS
