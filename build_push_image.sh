#!/bin/sh

# Mendefinisikan variabel untuk nama image, versi image, dan nama akun GitHub
name="item-app"
version="v1"
githubAccount="rzlpratama77"

# membuat Docker image
echo -e "Initiating the Docker image build process:"
docker build . -t $name:$version

# Menampilkan daftar image yang ada di lokal
echo -e "\nRetrieving the list of locally available Docker images:"
docker images

# Memberikan nama tag baru pada image agar sesuai dengan format GitHub Container Registry
echo -e "\nRe-tagging the Docker image to conform to the GitHub Container Registry naming convention:"
docker tag $name:$version ghcr.io/$githubAccount/$name:$version
docker images

# Melakukan login ke GitHub Container Registry
echo -e "\nAuthenticating with GitHub Container Registry:"
docker login ghcr.io -u $githubAccount

# Mempublish image ke GitHub Container Registry
echo -e "\nPushing the Docker image to GitHub Container Registry:"
docker push ghcr.io/$githubAccount/$name:$version

echo -e "\nProcess completed."