# Issue tracker: GitHub

Issues and specs live as GitHub issues. Use `gh` CLI.

## Conventions

- **Create**: `gh issue create --title "..." --body "..."` (heredoc for long body)
- **Read**: `gh issue view <n> --comments`
- **List**: `gh issue list --state open --json number,title,body,labels,comments`
- **Comment**: `gh issue comment <n> --body "..."`
- **Label**: `gh issue edit <n> --add-label "..." / --remove-label "..."`
- **Close**: `gh issue close <n> --comment "..."`

Repo inferred by `git remote -v`; `gh` detects it when run inside the clone.

## When a skill says "publish to the issue tracker"

Create a GitHub issue (e.g., `ooad-requirements` publishes FR/UC as issues with label `FR`).

## When a skill says "fetch the relevant ticket"

`gh issue view <n> --comments`

## PRs as triage surface

**no.** Change to `yes` if external PRs are feature requests.
