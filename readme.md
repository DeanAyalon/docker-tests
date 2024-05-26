# What is this?
Within this repo I will be testing out different mechanics and behaviors of Docker and document what I learn

# Tests
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