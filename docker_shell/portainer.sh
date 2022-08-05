# This file is only for reference. Please do not run it in your login surface.
docker run -d \
                  -p 9000:9000 \
                  -p 8000:8000 \
                  --gpus all \
                  --restart=always \
                  -v /var/run/docker.sock:/var/run/docker.sock \
                  -v /opt/docker/portainer-ce/data:/data \
                  -v /mnt/pool1/portainer_data:/pool1 \
                  -v /mnt/pool2/portainer_data:/pool2 \
                  --name portainer \
                  portainer/portainer:latest