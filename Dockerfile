FROM python:3.12-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:0.9.6 /uv /uvx /bin/

# Where we're installing this thing.
ARG APP_HOME="/opt/emulandice2"

# Use custom user/group so container not run with root permissions.
USER 9876:9876

WORKDIR ${APP_HOME}

COPY . .

# Set HOME so uv installs python here, where it has permissions.
ENV HOME=${APP_HOME}
# Install the application dependencies into a local virtual environment, compiling to bytecode.
RUN uv sync --frozen --no-cache --no-dev --compile-bytecode

# Easily run commands from the environment just created.
ENV PATH="${APP_HOME}/.venv/bin:$PATH"

ENTRYPOINT ["emulandice2"]
