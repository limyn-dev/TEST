variable "VM_sourceid"     {
  type        = string
  description = "(Required) The ID of the VM that to use for clone at the new"
  default     = "NPRAOV4ERJCN297IDH9PP3TKLNEHPS4I"
}
variable "VN_Name"         {
  type        = string
  description = "(Required) The Name of VM in WS"
  default     = "VM_Test01"
}
variable "VM_description"  {
  type        = string
  description = "(Required) The Description at later maybe to explain the instance"
  default     = "VM Test01"
}
variable "VM_path"         {
  type        = string
  description = "(Required) The Path where will be our instance in VmWare"
  default     = "C:\\_VM\\VM_TEST01"
}
variable "VM_processors"   {
  type        = string
  description = "(Required) The number of processors of the Virtual Machine"
  default     = "2"
}
variable "VM_memory"       {
  type        = string
  description = "(Required) The size of memory to the Virtual Machine"
  default     = "2048"
}