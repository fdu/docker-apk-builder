Container to build APKs
=======================

This Dockerfile allows you to build some APKs from a container.

Build the container image
-------------------------

`$ docker build docker/ -t apk-builder`

Run the container and start the APK builds
------------------------------------------

Instanciante the container with:
```
$ docker run -it --rm apk-builder
```

Then in the container:

```
$ ./scripts/build.sh
```
