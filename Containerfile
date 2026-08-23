# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /
COPY system_files /system_files

# Base Image: Bazzite 41 (Stable) with open-source NVIDIA drivers
FROM ghcr.io/ublue-os/bazzite-nvidia-open:41

### MODIFICATIONS
# Executes build_files/build.sh while mounting cache and system file contexts
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

### LINTING
# Verify final image and bootc metadata
RUN bootc container lint
