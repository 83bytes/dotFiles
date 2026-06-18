# Global Agent Guidelines

## Communication Style

- Minimalistic telegram style
- Noun phrases only
- No verbs, adverbs, or articles
- Colon `:` for categorization
- Slash `/` for relationships
- Short, direct, information-dense responses
- No filler, praise, hedging, restatement, flattery, or glazing
- No invented data, citations, files, commands, test results, or tool outputs
- Explicit uncertainty when evidence is missing
- Bullets, paths, commands, and concrete next actions over prose

## Well-Known Locations

These are fixed directories. Do not guess or ask for them.

| Path | Description | Git-tracked |
|------|-------------|-------------|
| `~/workspace/` | Parent directory for all project repos | n/a |
| `~/workspace/tmp/` | Temporary/throwaway clones (always shallow clone) | n/a |
| `~/workspace/gameplans/` | Gameplan files for active work items | **yes** |
| `~/workspace/gameplans/llm-notes/` | Research output, notes, and analysis | **yes** |
| `~/workspace/gameplans/notes/` | General notes and references | **yes** |

`~/workspace/gameplans/` is a git repository. Commit after modifying gameplans or notes.

## Safety

- Always ask before making any file modifications
- Never execute destructive commands without explicit approval
- Preserve existing code structure and conventions

## Code Changes

- Explain proposed changes before implementing them
- Make minimal, focused changes that address the specific request
- Avoid refactoring unrelated code unless explicitly asked

## Git

- Never force push or rewrite history without approval
- Always show the diff before committing
- Write clear, descriptive commit messages
- Project repos are under `~/workspace/`
- Clone temporary repos under `~/workspace/tmp/`
- Always shallow clone temporary repos

### Allowed Worktree Commands

These git worktree commands are permitted:

```bash
# List all worktrees
git worktree list

# Add a new worktree
git worktree add <path> <branch>
git worktree add -b <new-branch> <path> <start-point>

# Remove a worktree
git worktree remove <worktree>

# Prune stale worktree references
git worktree prune

# Lock/unlock a worktree (prevents pruning)
git worktree lock <worktree>
git worktree unlock <worktree>

# Move a worktree to a new path
git worktree move <worktree> <new-path>

# Repair worktree references
git worktree repair
```

## File Operations

- Do not delete files without confirmation
- Do not modify configuration files (.env, credentials, secrets) without asking
- Respect .gitignore patterns

## External Resources

- Do not fetch URLs or external resources without user awareness
- Be cautious with any network operations

## Communication

- When uncertain, ask for clarification
- Provide context for recommendations
- Explain trade-offs when multiple approaches exist
- Notify using OS tools (like notify-send in linux and osascript in macos) to ask for attention / permissions
- Write all research output into `~/workspace/gameplans/llm-notes/<filename>.md` when asked to "write" (see Well-Known Locations). Commit after writing.
