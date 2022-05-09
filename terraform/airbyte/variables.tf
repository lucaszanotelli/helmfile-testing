variable "parameters" {
  type = map
  default = { 
    airbyte_general_version = "/indicium/airbyte/general/version"
    airbyte_temporal_version = "/indicium/airbyte/temporal/version"
  } 
}