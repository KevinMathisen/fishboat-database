FROM python:3.11

RUN --mount=type=cache,target=/root/.cache/pdm \
    python3 -m pip install pdm

WORKDIR /app
COPY pyproject.toml pdm.lock .

RUN --mount=type=cache,target=/root/.cache/pdm \
    pdm install --no-self

COPY wizard.py .

EXPOSE 8000/TCP
CMD ["pdm", "run", "./wizard.py"]
