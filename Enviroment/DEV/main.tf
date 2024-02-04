module "rg" {
  source = "github.com/mdimran360/DevOps_Labs.git//0.1RG"     #github.com/mdimran360/DevOps_Labs.git//0.1RG
  rg     = var.rg
}
module "vnet" {
  source     = "github.com/mdimran360/DevOps_Labs.git//2.VNET"          #/2.VNET"
  vnet       = var.vnet
  depends_on = [module.rg]
}
module "subnet" {
  source     = "github.com/mdimran360/DevOps_Labs.git//3.Subnet"
  subnet     = var.subnet
  depends_on = [module.vnet]

}
module "pupip" {
  source     = "github.com/mdimran360/DevOps_Labs.git//4.PupIP"
  pupip      = var.pupip
  depends_on = [module.rg]
}

module "nic" {
  source     = "github.com/mdimran360/DevOps_Labs.git//5.NIC"
  nic        = var.nic
  depends_on = [module.pupip, module.subnet]

}
module "nsg" {
  source     = "github.com/mdimran360/DevOps_Labs.git//6.NSG"
  nsg        = var.nsg
  rule       = var.rule
  depends_on = [module.subnet, module.pupip]
}

module "nsgass" {
  source     = "github.com/mdimran360/DevOps_Labs.git//7.NSG_Association"
  nsgass     = var.nsgass
  depends_on = [module.nsg]

}
module "vms" {
  source     = "github.com/mdimran360/DevOps_Labs.git//8.VM"
  vms        = var.vms
  depends_on = [module.nsgass]

}