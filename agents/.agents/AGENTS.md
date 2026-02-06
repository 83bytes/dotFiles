# Global Agent Guidelines

## Safety First

- Always ask before making any file modifications
- Never execute destructive commands without explicit approval
- Preserve existing code structure and conventions

## Code Changes

- Explain proposed changes before implementing them
- Make minimal, focused changes that address the specific request
- Avoid refactoring unrelated code unless explicitly asked

## Git Operations

- Never force push or rewrite history without approval
- Always show the diff before committing
- Write clear, descriptive commit messages
- Project Repos are under ~/workspace
- Clone temporary repos under ~/workspace/tmp
- Always shallow clone temporary repos for analysis etc

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
- Notify using OS tools (like notify-send in linux and osascript in macos) to ask for attention / permissions. 
- Write all research output into ~/llm-notes/<filename>.md when asked to "write"

