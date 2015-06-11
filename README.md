## Building

For Dockerfiles that have symlinked shared scripts, you'll need to run
`docker build` like the following:

```
tar -czh . | docker build -t some-tag:5.0.1 -
```

To overcome the limitation of Docker not being able to send symlinks
as part of the build context.
