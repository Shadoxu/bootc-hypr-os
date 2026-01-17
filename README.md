sudo podman load -i /run/media/liveuser/Ventoy/bootc-hypr.tar


sudo podman run --rm --privileged \
  -v /dev:/dev -v /var/lib/containers:/var/lib/containers \
  localhost/bootc-hypr:latest \
  bootc install to-disk --generic-image --replace-root --karg=rw /dev/sda
