# Question
What does `docker commit` actually add to the image? How are the layers parsed?

## Test 1
- Create dockerfile installing a package
- Create a container from the base image
- Install the package on the container using `docker exec`
- Commit the container as a new image
- Compare with Docker Dive

```sh
docker compose build
docker compose up commit
docker commit curl-commit deanayalon/test:curl-commit
```

### Results
Images are identical, committed layer seems to reflect the command inputted

## Test 2
- Create a container and execute multiple commands
- Commit the container as a new image
- Dive to see what layers are made
  > Probably just a single layer with all file differences