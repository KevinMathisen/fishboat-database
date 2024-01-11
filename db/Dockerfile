FROM ghcr.io/amacneil/dbmate as dbmate
COPY migrations/ db/migrations/
CMD ["--no-dump-schema", "--wait", "up"]
