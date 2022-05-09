variable "parameters" {
  type = map
  default = { 
    rds_admin_host = "/indicium/rds/admin/host"
    rds_admin_password = "/indicium/rds/admin/password"
    rds_admin_username = "/indicium/rds/admin/username"
    rds_admin_db_name = "/indicium/rds/admin/db/name"
    airflow_gitsync_ssh_key = "/indicium/airflow/gitsync/ssh/key"
    airflow_gitsync_repository = "/indicium/airflow/gitsync/repository"
    airflow_gitsync_branch = "/indicium/airflow/gitsync/branch"
    airflow_gitsync_path = "/indicium/airflow/gitsync/path"
    airflow_image = "/indicium/airflow/image"
    smtp_admin_username = "/indicium/smtp/admin/username"
    smtp_admin_password = "/indicium/smtp/admin/password"
    smtp_admin_from = "/indicium/smtp/admin/from"
    smtp_admin_port = "/indicium/smtp/admin/port" # convert to integer
    smtp_admin_host = "/indicium/smtp/admin/host"
  } 
}