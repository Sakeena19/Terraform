# Specify the Terraform version and required providers
terraform {
  required_providers {
    # Define the Spotify provider with its source and version
    spotify = {
      source  = "conradludgate/spotify" # Source of the Spotify provider plugin
      version = "0.2.7"                 # Version of the Spotify provider to use
    }
  }
}

# Configure the Spotify provider
provider "spotify" {
  # API key for authenticating with the Spotify API
  api_key = var.api_key # Retrieve the API key from a variable named 'api_key'
}
