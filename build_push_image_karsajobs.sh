#!/bin/sh

# Menetapkan variabel untuk nama image, versi image, dan akun GitHub
name="karsajobs"
version="latest"
githubAccount="rzlpratama77"
packageName="$githubAccount/$name:$version"

# Membuat image Docker dengan nama sesuai variabel yang telah ditetapkan
echo -e "Building a new Docker image:"
docker build . -t $packageName

# Menandai ulang image agar sesuai dengan format GitHub Container Registry
echo -e "\nTagging the Docker image to match the GitHub Container Registry format:"
docker tag $packageName ghcr.io/$packageName

# Menampilkan daftar image yang ada di lokal
echo -e "\nListing local Docker images:"
docker images

# Masuk ke GitHub Container Registry
echo -e "\nLogging into GitHub Container Registry:"
docker login ghcr.io -u $githubAccount -p $GHCR_PAT_TOKEN

# Mengunggah image ke GitHub Container Registry
echo -e "\nPushing the Docker image to GitHub Container Registry:"
docker push ghcr.io/$packageName

echo -e "\nDone."