rg = {

  rg1 = {

    name     = "Imran_RG_PROD"
    location = "East US"
  }
}

vnet = {

  vnet1 = {
    name                = "imranvnetprod"
    address_space       = ["10.0.0.0/16"]
    location            = "East US"
    resource_group_name = "Imran_RG_PROD"
  }
}

subnet = {
  subnet1 = {
    name                 = "imransubnetprod1"
    resource_group_name  = "Imran_RG_PROD"
    virtual_network_name = "imranvnetprod"
    address_prefixes     = ["10.0.2.0/24"]
  }

  #         subnet1={
  #  name                 = "imransubnetprod2"
  #   resource_group_name  = "Imran_RG_PROD"
  #   virtual_network_name = "imranvnetprod"
  #   address_prefixes     = ["10.0.3.0/24"] 
  #     }
}

pupip = {

  pip1 = {
    name                = "frontentimranprodpip1"
    resource_group_name = "Imran_RG_PROD"
    location            = "East US"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip2 = {
    name                = "frontentimranprodpip2"
    resource_group_name = "Imran_RG_PROD"
    location            = "East US"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

nic = {
  nic1 = {
    name                 = "frontentimranprodnic1"
    location             = "East US"
    resource_group_name  = "Imran_RG_PROD"
    ipname               = "frontentimranprodpip1"
    virtual_network_name = "imranvnetprod"
    subnetname           = "imransubnetprod1"
  }
  nic2 = {
    name                 = "frontentimranprodnic2"
    location             = "East US"
    resource_group_name  = "Imran_RG_PROD"
    ipname               = "frontentimranprodpip2"
    virtual_network_name = "imranvnetprod"
    subnetname           = "imransubnetprod1"
  }
}
nsg = {
  nsg1 = {
    name                = "imrannsgprod"
    location            = "East US"
    resource_group_name = "Imran_RG_PROD"
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
    resource_group_name  = "Imran_RG_PROD"
    virtual_network_name = "imranvnetprod"
    subnetname           = "imransubnetprod1"
    nsgname              = "imrannsgprod"

  }
}
vms = {
  vm1 = {

    name                = "frontendimranprodvm1"
    location            = "East US"
    resource_group_name = "Imran_RG_PROD"
    size                = "Standard_F2"
    admin_username      = "Imran"
    admin_password      = "Imran@12345678"
    nicname             = "frontentimranprodnic1"
  }
  vm = {

    name                = "frontendimranprodvm2"
    location            = "East US"
    resource_group_name = "Imran_RG_PROD"
    size                = "Standard_F2"
    admin_username      = "Imran"
    admin_password      = "Imran@12345678"
    nicname             = "frontentimranprodnic2"
  }
}