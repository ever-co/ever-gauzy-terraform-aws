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
  //  region                = var.region
    //storage               = "4Gi"
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
