#  Port Tests
## Is there a difference between mapping and exposing a port?
Mapping ports automatically exposes them, BUT:
- `-p :80` exposes port `80/tcp`
- `--expose 80` also exposes port `80/tcp` **but is documented as just '80'**
    ```yml
    expose: [80]    # 80/tcp by default
    ports: [':80']  # 80/tcp by default
    ```
    Upon `docker inspect`, results in:
    ```json
    "ExposedPorts": {
        "80": {},    // 80/tcp?
        "80/tcp": {}
    },
    ```