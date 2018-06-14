Set-Location "C:\git\manulife\image-concourse-pipeline"

# Remove and create containers
docker-compose down
docker-compose up -d

# Set up API
fly --target develop login --concourse-url http://127.0.0.1:8080
fly --target develop sync

# Create/Update the pipeline
#fly -t develop set-pipeline -c pipeline.yml -p image-build -n -l .\secrets.yml
fly -t develop set-pipeline -c pipeline.yml -p image-build -n

# Destroy pipeline
fly -t develop destroy-pipeline -p image-build -n

# Check Resource
#fly -t develop check-resource -r image-build/packer-templates
#fly -t develop check-resource -r image-build/packer-build-tasks

# Unpause the pipeline
fly -t develop unpause-pipeline -p image-build