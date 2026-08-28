# Checklist Prod — Release {{ version }}

- [ ] Migraciones probadas en staging
- [ ] Env vars / secrets en vault
- [ ] Feature flags definidos
- [ ] Rollback script probado (`scripts/rollback-{{ version }}.sh`)
- [ ] Runbooks actualizados (`docs/06-deploy/runbooks/`)
- [ ] SLI/SLO configurados
- [ ] Release Notes desde RTM

## Rollback

```bash
./scripts/rollback-{{ version }}.sh
```
