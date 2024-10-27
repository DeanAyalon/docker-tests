[Source](https://discord.com/channels/460871933748183040/460871933748183042/1295666627144323072)
# Question
Is it possible to define a `VOLUME` for a file?

# Answer
Yes, but it is not ideal.<br>
By definition, Docker volumes are always directories, and cannot be bound to a file - Only bind-mounts can (`/host/path:/container/path`)

Limitations:
- When started without a volume defined, an anonymous volume will be created, which will refuse to create the container due to binding a directory to a file.
- The default contents of the file will not be accessible, unlike volume initialization when using directories

# Conclusion
This is only useful to enforce the user to use a bind mount.