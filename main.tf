provider "google" {
  project     = "focal-renderer-431214-b8"
  region      = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name = "my-vpc"
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}