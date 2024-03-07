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
  
  values = [templatefile("values.yaml", {
    ever-gauzy-api.postgresql.global.external_db                         = true
    ever-gauzy-api.postgresql.global.postgresql.auth.host                = data.terraform_remote_state.rds.outputs.db_instance_address
    ever-gauzy-api.postgresql.global.postgresql.auth.username            = data.terraform_remote_state.rds.outputs.db_instance_username
    ever-gauzy-api.postgresql.global.postgresql.auth.password            = data.terraform_remote_state.rds.outputs.db_instance_endpoint
    ever-gauzy-api.postgresql.global.postgresql.auth.database            = data.terraform_remote_state.rds.outputs.db_instance_name
    ever-gauzy-api.postgresql.global.postgresql.service.ports.postgresql = data.terraform_remote_state.rds.outputs.db_instance_port
  })]

  set = [
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
