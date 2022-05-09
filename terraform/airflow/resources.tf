resource postgresql_database "metadata-airflow-db" {
    name = data.rds_admin_db_name.value
}

resource kubernetes_namespace "airflow-jobs-namespace" {
  metadata {
    name = "airflow-jobs-ns"
  }
}

resource kubernetes_secret "airflow-gitsync-secret" {
  data = {
    gitSshKey = data.airflow_gitsync_ssh_key.value
  }
  metadata = {
    name = "airflow-ssh-secret"
    namespace = "dataplatform-ns"
  }
}

resource kubernetes_manifest "airflow-scheduler-role" {
  manifest = {
    apiVersion = "rbac.authorization.k8s.io/v1"
    kind = "Role"
    metadata = {
      name = "airflow-scheduler-permissions-role"
      namespace = "airflow-jobs-ns"
    },
    rules = {
        apiGroups = []
        resources = [
          "pods",
          "pods/log"
        ]
        verbs = [
          "get",
          "list",
          "watch",
          "create",
          "patch",
          "delete"
        ]
      }
  }
}

resource kubernetes_manifest "airflow-scheduler-role-binding" {
  manifest = {
    apiVersion = "rbac.authorization.k8s.io/v1"
    kind = "RoleBinding"
    metadata = {
      name = "scheduler-perimissions-role-binding"
      namespace = "airflow-jobs-ns"
    },
    roleRef = {
      apiGroup = "rbac.authorization.k8s.io"
      kind = "Role"
      name = "airflow-scheduler-permissions-role"
    },
    subjects = [
      {
        kind = "ServiceAccount"
        name = "apache-airflow-scheduler"
        namespace = "dataplatform-ns"
      }
    ]
  }
  depends_on = [
    kubernetes_manifest.airflow-scheduler-role
  ]
}

resource helmfile_release_set "airflow" {
    working_directory = path.module
    
    # Environment variables available to helmfile's requireEnv and commands being run by helmfile
    environment_variables = {
        "rds_admin_host" = data.rds_admin_host.value
        "rds_admin_password" = data.rds_admin_password.value
        "rds_admin_username" = data.rds_admin_username.value
        "rds_admin_db_name" = data.rds_admin_db_name.value
        "airflow_gitsync_ssh_key" = data.airflow_gitsync_ssh_key.value
        "airflow_gitsync_repository" = data.airflow_gitsync_repository.value
        "airflow_gitsync_branch" = data.airflow_gitsync_branch.value
        "airflow_gitsync_path" = data.airflow_gitsync_path.value
        "airflow_image" = data.airflow_image.value
        "smtp_admin_sus_rname" = data.smtp_admin_sus_rname.value
        "smtp_admin_spa_sword" = data.smtp_admin_spa_sword.value
        "smtp_admin_port" = tonumber(data.smtp_admin_port.value)
        "smtp_admin_host" = data.smtp_admin_host.value
        KUBECONFIG = "~/.kube/config"
    }
}