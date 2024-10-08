# Question
Is it possible to keep a minimal Docker image idle?

# Tests
- Bind mount `/usr/bin/tail:/bin/tail:ro`
  ```
  exec /bin/tail: no such file or directory
  ```