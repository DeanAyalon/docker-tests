# Purpose
Tested out multi-platform images - Docker Buildx emulates other platforms using QEMU

This works, which means [fms-docker](https://github.com/deanayalon/fms-docker)'s multi-platofrm build has a package that interferes with the QEMU virtualization


# Learned
Docker receently introduces the experimental `docker images --tree` flag, which lists the images along with their platforms

# Questions
Pulling the alpine image and listing, I get the following output:
```
IMAGE                            ID             DISK USAGE   CONTENT SIZE   USED
deanayalon/test:arm              74b623a29d1d       4.09MB         4.09MB       
└─ linux/arm64                   657c8cd71c88       4.09MB         4.09MB       

deanayalon/test:amd              e3af49ed5016       12.1MB         3.63MB       
└─ linux/amd64                   fa03b0b68e10       12.1MB         3.63MB       

deanayalon/test:multi-platform   1e6abfc4389b       16.2MB         7.71MB       
├─ linux/arm64                   98adea690715       4.09MB         4.09MB       
└─ linux/amd64                   fd42480c63d6       12.1MB         3.63MB       

alpine:latest                    beefdbd8a1da       25.7MB         7.72MB       
├─ linux/arm64/v8                9cee2b382fe2       13.6MB         4.09MB       
├─ linux/amd64                   33735bd63cf8       12.1MB         3.63MB       
```


- **Why is my ARM image platform `linux/arm64` and not `linux/arm64/v8`?**
When using `--platform linux/arm/v8`, it actually uses alpine for `linux/arm/v7`

- **Why are the `deanayalon/test` images for `linux/arm64` disk usage a third of the size as the `alpine` image used as base?**