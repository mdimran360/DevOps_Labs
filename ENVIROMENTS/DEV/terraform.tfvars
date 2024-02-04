rg = {

  rg1 = {

    name     = "Imran_RG_DEV"
    location = "Central India"
  }
}

vnet = {

  vnet1 = {
    name                = "imranvnet"
    address_space       = ["10.0.0.0/16"]
    location            = "Central India"
    resource_group_name = "Imran_RG_DEV"
  }
}

subnet = {
  subnet1 = {
    name                 = "imransubnet1"
    resource_group_name  = "Imran_RG_DEV"
    virtual_network_name = "imranvnet"
    address_prefixes     = ["10.0.2.0/24"]
  }

  #         subnet1={
  #  name                 = "imransubnet2"
  #   resource_group_name  = "Imran_RG_DEV"
  #   virtual_network_name = "imranvnet"
  #   address_prefixes     = ["10.0.3.0/24"] 
  #     }
}

pupip = {

  pip1 = {
    name                = "frontentimranpip1"
    resource_group_name = "Imran_RG_DEV"
    location            = "Central India"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip2 = {
    name                = "frontentimranpip2"
    resource_group_name = "Imran_RG_DEV"
    location            = "Central India"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

nic = {
  nic1 = {
    name                 = "frontentimrannic1"
    location             = "Central India"
    resource_group_name  = "Imran_RG_DEV"
    ipname               = "frontentimranpip1"
    virtual_network_name = "imranvnet"
    subnetname           = "imransubnet1"
  }
  nic2 = {
    name                 = "frontentimrannic2"
    location             = "Central India"
    resource_group_name  = "Imran_RG_DEV"
    ipname               = "frontentimranpip2"
    virtual_network_name = "imranvnet"
    subnetname           = "imransubnet1"
  }
}
nsg = {
  nsg1 = {
    name                = "imrannsg"
    location            = "Central India"
    resource_group_name = "Imran_RG_DEV"
  }


}
rule = {
  rule1 = {
    name                   = "ssh"
    priority               = 100
    destination_port_range = 22

  }
  rule2 = {
    name                   = "http"
    priority               = 101
    destination_port_range = 80

  }
}

nsgass = {
  nsgass1 = {
    resource_group_name  = "Imran_RG_DEV"
    virtual_network_name = "imranvnet"
    subnetname           = "imransubnet1"
    nsgname              = "imrannsg"

  }
}
vms = {
  vm1 = {

    name                = "frontendimranvm1"
    location            = "Central India"
    resource_group_name = "Imran_RG_DEV"
    size                = "Standard_F2"
    admin_username      = "Imran"
    admin_password      = "Imran@12345678"
    nicname             = "frontentimrannic1"
  }
  vm = {

    name                = "frontendimranvm2"
    location            = "Central India"
    resource_group_name = "Imran_RG_DEV"
    size                = "Standard_F2"
    admin_username      = "Imran"
    admin_password      = "Imran@12345678"
    nicname             = "frontentimrannic2"
  }
}