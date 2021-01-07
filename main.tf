provider "google" {
  
  credentials = file("essential-tower-270310-094c1713c908.json")  
  project = var.projectid
  region  = var.region
  zone    = var.zone
}
resource "google_compute_instance" "default" {
  name         = var.instancename
  machine_type = var.machinetype

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  metadata = {
    foo = "bar"
  }
}
resource "google_compute_network" "vpc_network" {
  name = var.vpc
  auto_create_subnetworks = "false"
  mtu = 1500
}
resource "google_compute_subnetwork" "subnet" {
 name          = var.name
 ip_cidr_range = var.subnet_cidr
 network       = var.vpc
 depends_on    = [google_compute_network.vpc_network]
 region      =   var.region
}
resource "google_compute_firewall" "firewall" {
  name    = var.firewall
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}