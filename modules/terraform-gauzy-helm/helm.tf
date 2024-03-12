module gauzy {
  source  = "terraform-module/release/helm"
  version = "2.6.0"

  namespace  = "default"
  repository =  "https://charts.ever.co"

  app = {
    name            = var.name
    version         = var.h_version
    chart           = var.chart 
    force_update  = true
    wait          = false
    recreate_pods = true
    deploy        = 1
  }
  
  values = [file("${path.module}/values.yaml")]

  set = [

    {
      name  = "ever-gauzy-api.postgresql.global.external_db"
      value = true
    },
    {
      name  = "ever-gauzy-api.postgresql.global.postgresql.auth.host"
      value = var.db_instance_address
    },
    {
      name  = "ever-gauzy-api.postgresql.global.postgresql.auth.username"
      value = var.db_instance_username
    },
    {
      name  = "ever-gauzy-api.postgresql.global.postgresql.auth.password"
      value = "postgres1234"
    },
    {
      name  = "data.terraform_remote_state.rds.outputs.db_instance_name"
      value = var.db_instance_name
    },
    {
      name  = "ever-gauzy-api.postgresql.global.postgresql.service.ports.postgresql"
      value = ""
      #tostring(data.terraform_remote_state.rds.outputs.db_instance_port)
    },
    {
      name  = "ever-gauzy-api.global.hosts.host"
      value = var.api_host
    },
    {
      name  = "ever-gauzy-api.global.tls.hosts[0]"
      value = var.api_host
    },
    {
      name  = "ever-gauzy-api.global.tls.secretName"
      value = var.api_secretName
    },
    {
      name  = "webapp.hosts.host"
      value = var.web_host
    },
    {
      name  = "webapp.tls.hosts[0]"
      value = var.web_host
    },
    {
      name  = "webapp.tls.secretName"
      value = var.web_secretName
    },
  ]
}
