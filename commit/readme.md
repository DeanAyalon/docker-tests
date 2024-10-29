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
Images are identical, committed layer seems to reflect the command inputted as the container's main process

## Test 2
- Create a container and execute multiple commands
- Commit the container as a new image
- Dive to see what layers are made
  > Probably just a single layer with all file differences

```sh
docker run -it --name custom alpine
# Within the 'custom' container
apk add curl
mkdir test
touch lorem ipsum
echo dolor sit > amet
wget https://google.com
exit
# Back on host machine
docker commit custom deanayalon/test:custom-commit
```

### Results
As hypothesized, Docker Dive only shows a single layer with all file differences.
Layer's command reflects the container's main process (`/bin/sh`)

## Test 3
Multiple processes within a container?
```sh
docker run -d --name multi alpine tail -f /dev/null  # process 0
docker exec -it multi sh
# Within the 'multi' container, in process 1
apk add curl
mkdir test
touch lorem ipsum
# ---- NEW TERMINAL ----
# Host machine
docker exec -it multi sh
# Within the 'multi' container, in process 2
echo dolor sit > amet
wget https://google.com
# ---- NEW TERMINAL ----
# Host machine
docker exec -w /test multi wget https://devin.fm
docker commit multi deanayalon/test:multi-commit
```

### Results
Same as previous tests, Docker Dive shows a single layer with all file differences.
Layer command is container PID 0