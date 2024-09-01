#!/bin/sh

# Nama package yang akan digunakan untuk image
package_name="ghcr.io/rzlpratama77/shipping-service:latest"

# Membuat image Docker dengan format untuk GitHub Container Registry
echo -e "Build Docker Image:"
docker build . -t $package_name

# Melakukan login ke GitHub Container Registry
echo -e "\nMelakukan login ke GitHub Container Registry:"
docker login ghcr.io -u rzlpratama77 -p $GHCR_PAT_TOKEN

# Mengunggah image yang telah dibuat ke GitHub Container Registry
echo -e "\nPublish image ke GitHub Container Registry:"
docker push $package_name
