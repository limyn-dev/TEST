terraform {
  required_version = ">= 0.14.4"
  required_providers {
    vmworkstation = {
      source   = "elsudano/vmworkstation"
      version  = "0.2.3"
    }
  }
}
resource "vmworkstation_vm" "VM" {
  sourceid     = var.VM_sourceid
  denomination = var.VN_Name
  description  = var.VM_description
  path         = var.VM_path
  processors   = var.VM_processors
  memory       = var.VM_memory
}