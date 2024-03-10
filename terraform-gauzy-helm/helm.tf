module gauzy {
  source  = "terraform-module/release/helm"
  version = "2.6.0"

  namespace  = "default"
  repository =  "https://charts.ever.co"

  app = {
    name          = "ever-gauzy"
    version       = "0.1.9"
    chart         = "ever-gauzy"
    force_update  = true
    wait          = false
    recreate_pods = true
    deploy        = 1
  }
  
  values = [file("values.yaml")]

  set = [

    {
      name  = "ever-gauzy-api.postgresql.global.external_db"
      value = true
    },
    {
      name  = "ever-gauzy-api.postgresql.global.postgresql.auth.host"
      value = data.terraform_remote_state.rds.outputs.db_instance_address
    },
    {
      name  = "ever-gauzy-api.postgresql.global.postgresql.auth.username"
      value = data.terraform_remote_state.rds.outputs.db_instance_username
    },
    {
      name  = "ever-gauzy-api.postgresql.global.postgresql.auth.password"
      value = "postgres1234"
    },
    {
      name  = "data.terraform_remote_state.rds.outputs.db_instance_name"
      value = data.terraform_remote_state.rds.outputs.db_instance_name
    },
    {
      name  = "ever-gauzy-api.postgresql.global.postgresql.service.ports.postgresql"
      value = ""
      #tostring(data.terraform_remote_state.rds.outputs.db_instance_port)
    },
    {
      name  = "labels.kubernetes\\.io/name"
      value = "ever-gauzy"
    },
    {
      name  = "service.labels.kubernetes\\.io/name"
      value = "ever-gauzy"
    },
  ]
}
