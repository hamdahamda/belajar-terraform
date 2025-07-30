variable "name"           { type = string }
variable "machine_type"   { type = string }
variable "zone"           { type = string }
variable "image"          { type = string }
variable "network"        { type = string }
variable "subnetwork"     { type = string }
variable "tags"           { type = list(string) }
variable "startup_script" { type = string }
