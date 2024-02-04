module "rg" {
  source = "../0.1RG"
  rg     = var.rg
}
module "vnet" {
  source     = "../2.VNET"
  vnet       = var.vnet
  depends_on = [module.rg]
}
module "subnet" {
  source     = "../3.Subnet"
  subnet     = var.subnet
  depends_on = [module.vnet]

}
module "pupip" {
  source     = "../4.PupIP"
  pupip      = var.pupip
  depends_on = [module.rg]
}

module "nic" {
  source     = "../5.NIC"
  nic        = var.nic
  depends_on = [module.pupip, module.subnet]

}
module "nsg" {
  source     = "../6.NSG"
  nsg        = var.nsg
  rule       = var.rule
  depends_on = [module.subnet, module.pupip]
}

module "nsgass" {
  source     = "../7.NSG_Association"
  nsgass     = var.nsgass
  depends_on = [module.nsg]

}
module "vms" {
  source     = "../8.VM"
  vms        = var.vms
  depends_on = [module.nsgass]

}