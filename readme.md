# What is this?
Within this repo I will be testing out different mechanics and behaviors of Docker and document what I learn

# Tests
## Environment Files
Environment files have two functionalities in Docker Compose:
### Variable Interpolation
By default, taken from `.env`, a different file can be selected by amending `-e different.env` to the Docker Compose command<br>
Variables defined within the environment file can be interpolated within the Compose file like so:
- **Simple interpolation**: `${VAR}`
- **Default value**: `${VAR-default value}` or `${VAR:-default value}`
  > Will use the default value if the variable is undefined; Adding `:` will use the default if the variable is defined but empty
- **Mandatory variables**: `${VAR?Error message}` or `${VAR:?Error message}` (Error message is optional)
  > Will prevent Compose and show the error message if the variable is undefined; Adding `:` will show the error if the variable is defined but empty
- **Conditionals**: `${VAR+value}` or `${VAR:+value}`
  > Will enter the defined value if VAR is defined; Adding `:` will enter the value if the variable is defined and not empty

### Container Environment
Using the `services.*.env_file` yml property, environment files can be used to define container environment variables.<br>
Multiple files can be used, later files override previous ones:
```yml
services:
  service:
    env_file:
      - example.env
      - override.env  # Will add or replace previously defined environment variables
```

## Projects
Since [compose-spec.json](https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json) restricts project names, interpolating the name as a variable will successfully create the project with the interpolated name, but the IDE will show errors
```yml
name: ${PROJECT_NAME} # ERROR: String does not match the pattern of "^[a-z0-9][a-z0-9_-]*$".yaml-schema: docker-compose.yml
```

Instead, Docker Compose has a built-in environment variable interpolation for project files: `COMPOSE_PROJECT_NAME`
```yml
name: defaultname    # Will be replaced by $COMPOSE_PROJECT_NAME if set
```
This can be set both with 
```bash
export COMPOSE_PROJECT_NAME=newname; docker compose ...
```
or with `.env`
```sh
COMPOSE_PROJECT_NAME=newname
```

Project name priority order:
- shell `export COMPOSE_PROJECT_NAME` (persists over the shell session)
- .env COMPOSE_PROJECT_NAME
- compose.yml name property
- directory name


## Volumes
How do Docker Volumes behave when they're uninitialized or empty?

- **Named Volume** - When empty or undefined, a named volume will be created with the contents of the directory it's bound to.
    > Even if the container has read-only permissions to the volume.
- **Bind Mount** - When undefined, an empty directory is created. The contents of the directory, even if empty, always override the container.

## Shebang
Shebang only splits arguments on the first whitespace, so the shebang line `#!docker compose -f` results in the following command: 
```sh
docker "compose -f" ./compose.yml
```

Using `docker-compose` could work for Docker Desktop users (Alias for `docker compose`), but for Linux would result in the legacy version of the tool, not the intended behavior

Instead, GNU env provides the `-S` flag that splits the string: `#!/usr/bin/env -S docker compose -f` results in:
```sh
env "-S docker compose -f" ./compose.yml
# which runs:
docker compose -f ./compose.yml
```