output "airbyte_diff" {
  value = helmfile_release_set.airbyte.diff_output
}

output "airbyte_apply" {
  value = helmfile_release_set.airbyte.apply_output
}
