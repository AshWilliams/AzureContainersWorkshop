#!/bin/sh

# Set bash variables for your environment
containerRegistryFullName=<container-registry-full-name>
containerImageName=dariuszporowski/hello-world

# Pull a image from Docker Hub
docker pull $containerImageName

# Run the container locally
docker run -it --rm -p 8080:80 $containerImageName

# Create a tag of the image
docker tag $containerImageName $containerRegistryFullName/$containerImageName

# Push the image to your registry
docker push $containerRegistryFullName/$containerImageName

# Pull the image from your registry
docker pull $containerRegistryFullName/$containerImageName

# Start the container
docker run -it --rm -p 8080:80 $containerRegistryFullName/$containerImageName