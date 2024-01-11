# Configuration

## Secrets

Generate passwords and tokens randomly:

```bash
docker compose --file setup/docker-compose.yml build
docker compose --file setup/docker-compose.yml run --rm setup
```

# Run

```bash
docker compose --env-file secrets/docker up --build
```
