# Gitpod Terraform Image

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/SERC-Terraform-Labs/Gitpod-Terraform-Image)

Custom Gitpod Docker image with Terraform and cloud tools installed.

## Using

Add the following to `.gitpod.yml` settings file.

```
image: ghcr.io/SERC-Terraform-Labs/Gitpod-Terraform-Image:full
```

## Tags

| Tag | Description |
| --- | --- |
| `full` | This image is built on top of the Gitpod [`workspace-full`](https://hub.docker.com/r/gitpod/workspace-full) image. |
| `base` | This image is built on top of the Gitpod [`workspace-base`](https://hub.docker.com/r/gitpod/workspace-base) image. |
