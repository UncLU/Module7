
resource "yandex_compute_instance" "vm-1" {
  name = "terraform1"
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd88m3uah9t47loeseir"
      #     image_id = "fd89cudngj3s2osr228p"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.asubnet.id
    nat       = true
  }

  metadata = {
    #    user-data = "${file("~/meta.txt")}"
    "user-data" : "#cloud-config\nusers:\n  - name: ${var.useros}\n    groups: sudo\n    shell: /bin/bash\n    sudo: ['ALL=(ALL) NOPASSWD:ALL']\n    ssh-authorized-keys:\n      - ${var.adm_pub_key}"
  }
}


resource "yandex_vpc_network" "anet" {
  name = "anet"
}

resource "yandex_vpc_subnet" "asubnet" {
  name           = "asubnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.anet.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

