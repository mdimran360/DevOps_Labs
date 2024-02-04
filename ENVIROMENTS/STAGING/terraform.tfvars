rg = {

  rg1 = {

    name     = "Imran_RG_Staging"
    location = "west US"
  }
}

vnet = {

  vnet1 = {
    name                = "imranvnetstaging"
    address_space       = ["10.0.0.0/16"]
    location            = "west US"
    resource_group_name = "Imran_RG_Staging"
  }
}

subnet = {
  subnet1 = {
    name                 = "imransubnetstaging1"
    resource_group_name  = "Imran_RG_Staging"
    virtual_network_name = "imranvnetstaging"
    address_prefixes     = ["10.0.2.0/24"]
  }

  #         subnet1={
  #  name                 = "imransubnetstaging2"
  #   resource_group_name  = "Imran_RG_Staging"
  #   virtual_network_name = "imranvnetstaging"
  #   address_prefixes     = ["10.0.3.0/24"] 
  #     }
}

pupip = {

  pip1 = {
    name                = "frontentimranstagingpip1"
    resource_group_name = "Imran_RG_Staging"
    location            = "west US"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip2 = {
    name                = "frontentimranstagingpip2"
    resource_group_name = "Imran_RG_Staging"
    location            = "west US"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

nic = {
  nic1 = {
    name                 = "frontentimranstagingnic1"
    location             = "west US"
    resource_group_name  = "Imran_RG_Staging"
    ipname               = "frontentimranstagingpip1"
    virtual_network_name = "imranvnetstaging"
    subnetname           = "imransubnetstaging1"
  }
  nic2 = {
    name                 = "frontentimranstagingnic2"
    location             = "west US"
    resource_group_name  = "Imran_RG_Staging"
    ipname               = "frontentimranstagingpip2"
    virtual_network_name = "imranvnetstaging"
    subnetname           = "imransubnetstaging1"
  }
}
nsg = {
  nsg1 = {
    name                = "imrannsgstaging"
    location            = "west US"
    resource_group_name = "Imran_RG_Staging"
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
    resource_group_name  = "Imran_RG_Staging"
    virtual_network_name = "imranvnetstaging"
    subnetname           = "imransubnetstaging1"
    nsgname              = "imrannsgstaging"

  }
}
vms = {
  vm1 = {

    name                = "frontendimranstagingvm1"
    location            = "west US"
    resource_group_name = "Imran_RG_Staging"
    size                = "Standard_F2"
    admin_username      = "Imran"
    admin_password      = "Imran@12345678"
    nicname             = "frontentimranstagingnic1"
  }
  vm = {

    name                = "frontendimranstagingvm2"
    location            = "west US"
    resource_group_name = "Imran_RG_Staging"
    size                = "Standard_F2"
    admin_username      = "Imran"
    admin_password      = "Imran@12345678"
    nicname             = "frontentimranstagingnic2"
  }
}