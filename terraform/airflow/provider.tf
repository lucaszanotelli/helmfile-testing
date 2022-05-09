provider aws {
      profile = "q2p" # default: quero2pay
      region = "sa-east-1"
}

provider postgresql {
      host = data.rds_admin_host.value
      password = data.rds_admin_password.value
      port = data.rds_admin_port.value
      ssl_mode = disable
      superuser = true
      username = data.rds_admin_username.value
}

provider kubernetes {
      config_path = "~/.kube/config"
}

# there is nothing to configure for this provider
provider helmfile {}
