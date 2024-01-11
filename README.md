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

## Hasura

1. Add the Postgres database using the environmental variable `PG_DATABASE_URL`
2. Expose all tables and relations in [Hasura](http://localhost:8000/hasura).
3. Add the following mutation and create a REST endpoint named `import-data`:

```
mutation import_data($data: [elvedata_insert_input!]!) {
  insert_elvedata(objects: $data)
  {
    affected_rows
    returning {
      id
    }
  }
}
```
