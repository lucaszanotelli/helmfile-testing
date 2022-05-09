resource helmfile_release_set "airbyte" {
    working_directory = path.module
    
    # Environment variables available to helmfile's requireEnv and commands being run by helmfile
    environment_variables = {
        "airbyte_general_version" = data.airbyte_general_version.value
        "airbyte_temporal_version" = data.airbyte_temporal_version.value
        KUBECONFIG = "~/.kube/config"
    }
}
