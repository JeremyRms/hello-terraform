terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.21.0"
    }
  }
}

provider "google" {
  credentials = file("credentials.json")

  project = "effective-might-323902"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "hello-terraform-jeremy-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "hello-terraform-jeremy-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
