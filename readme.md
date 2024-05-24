# What is this?
Within this repo I will be testing out different mechanics and behaviors of Docker as I learn

# Tests
## Volumes
How do Docker Volumes behave when they're uninitialized or empty?

- **Named Volume** - When empty or undefined, a named volume will be created with the contents of the directory it's bound to.
    > Even if the container has read-only permissions to the volume.
- **Bind Mount** - When undefined, an empty directory is created. The contents of the directory, even if empty, always override the container.