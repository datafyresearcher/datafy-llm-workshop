# The builder image, used to build the virtual environment
FROM python:3.11-buster as builder

# Environment setup for build
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/home/appuser/.local/bin:${PATH}" \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

RUN apt-get update && apt-get install -y git
RUN apt install -y build-essential

RUN groupadd -g 1001 appgroup && \
    adduser --uid 1001 --gid 1001 --disabled-password --gecos '' appuser

USER 1001

RUN pip install --user --no-cache-dir --upgrade pip && \
    pip install --user --no-cache-dir poetry==1.4.2

WORKDIR /home/appuser/app/
COPY pyproject.toml poetry.lock /home/appuser/app/
RUN poetry install --no-cache --no-root && \
    rm -rf $POETRY_CACHE_DIR

# The runtime image, used to just run the code provided its virtual environment
FROM python:3.11-buster as runtime

# Environment setup for runtime
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    VIRTUAL_ENV=/home/appuser/app/.venv \
    PATH="/home/appuser/app/.venv/bin:/home/appuser/.local/bin:$PATH" \
    HOST=0.0.0.0 \
    LISTEN_PORT=8888

RUN groupadd -g 1001 appgroup && \
    adduser --uid 1001 --gid 1001 --disabled-password --gecos '' appuser

USER 1001
EXPOSE 8888
WORKDIR /home/appuser/app/

# Copy virtual environment from builder
COPY --chown=1001:1001 --from=builder ${VIRTUAL_ENV} ${VIRTUAL_ENV}

COPY --chown=daemon:daemon ./notebooks /home/appuser/app/notebooks


CMD ["jupyter", "lab", "--ip='0.0.0.0'", "--port=8888", "--no-browser", "--allow-root"]
