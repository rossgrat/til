# One-shot container for command testing

You can setup one-shot docker containers to execute a single command on some OS that is not your own.

```
docker run --rm -v "$(pwd):/app" -w /app golang:1.25:7 bash -c "<script here>"
```

What does this do?
- `docker run --rm` - Starts a container and automatically removes it when it exists
- `-v "$(pwd):/app"` - Mount current directory into the `/app` directory in the container
- `-w /app` - Set `/app` as the working directory in the container
- `golang 1.25.7` - Uses this selected container (in this case, the official Go 1.25.7 Docker image, which is Linux based)
- `bash -c "..."` - Run a bash script inside the container

