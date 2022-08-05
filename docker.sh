sudo docker run -d --name=test \
    -p 6666:10022 \
    --gpus all \
    --restart unless-stopped \
    ghcr.io/woodoxen/ubuntu18_cuda:0.0.1