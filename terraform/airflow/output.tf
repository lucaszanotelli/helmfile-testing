output "airflow_diff" {
  value = helmfile_release_set.airflow.diff_output
}

output "airflow_apply" {
  value = helmfile_release_set.airflow.apply_output
}
