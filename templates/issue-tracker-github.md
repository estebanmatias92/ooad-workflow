# Issue tracker: GitHub

Issues y specs viven como GitHub issues. Usa `gh` CLI.

## Conventions

- **Create**: `gh issue create --title "..." --body "..."` (heredoc para body largo)
- **Read**: `gh issue view <n> --comments`
- **List**: `gh issue list --state open --json number,title,body,labels,comments`
- **Comment**: `gh issue comment <n> --body "..."`
- **Label**: `gh issue edit <n> --add-label "..." / --remove-label "..."`
- **Close**: `gh issue close <n> --comment "..."`

Repo inferido por `git remote -v`; `gh` lo detecta si corres dentro del clone.

## When a skill says "publish to the issue tracker"

Crea un GitHub issue (ej. `ooad-requirements` publica RF/CU como issues con label `RF`).

## When a skill says "fetch the relevant ticket"

`gh issue view <n> --comments`

## PRs as triage surface

**no.** Cambiar a `yes` si PRs externos son feature requests.
