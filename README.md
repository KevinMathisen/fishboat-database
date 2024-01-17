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

## Hasura setup

1. Connect to [Hasura](http://localhost:8000/hasura).
1. Add the Postgres database using the environmental variable `PG_DATABASE_URL`
3. Track all tables and views in the public schema
4. Track all foreign-key relationship in the public schema
5. Create a REST endpoint named `import_data`, with `import-data` as URL Path, `POST` as method, and with the following GraphQL Request:

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

## Usage

The wizard is an example application to upload data into the database, available at [localhost:8000](http://localhost:8000).

PostgREST interface is available at [localhost:8000/postgrest/](http://localhost:8000/postgrest/). [API documentation](https://postgrest.org/en/stable/references/api.html) is available as well.
