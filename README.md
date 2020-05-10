# vcpkg-docker

A docker image based on Ubuntu 20 with VCPKG (in /opt/vcpkg) and boost (vcpkg install boost). This image is huge, around 8 GB (1.65 GB compressed)

## Publish the image

Build and tag, using the current date.

```sh
docker build -t antiteum/vcpkg .
docker tag antiteum/vcpkg antiteum/vcpkg:20200510
```

Publish:

```sh
docker push antiteum/vcpkg
```

## Helper calls

In order to create an image, let's do it iteratively:

1. Create an base docker file
2. Enter into the container in a bash session
3. Try the commands
4. Consolidate all the commands in the final Dockerfile

For example:

```Dockerfile
FROM ubuntu:20.04

RUN apt-get update
```

Then:

```sh
docker build -t antiteum/vcpkg .
```

And enter into it:

```sh
docker run -it --entrypoint /bin/bash antiteum/vcpkg
```
