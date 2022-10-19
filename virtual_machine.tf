resource "google_service_account" "default" {
  account_id   = "service-account-id"
  display_name = "Service Account"
}

resource "google_compute_instance" "default" {
  name         = "me-gcp-instance"
  machine_type = "e2-medium"
  zone         = "us-east4-a"

  tags = ["Some", "beez"]

  boot_disk {
    initialize_params {
      image = "Windows Server 2022 Datacenter"
      labels = {
        my_label = "ezbems"
      }
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}