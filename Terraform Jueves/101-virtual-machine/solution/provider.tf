provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.38.0"

  subscription_id = "9449d579-1890-436c-993c-b4137de560d2"
  client_id       = "e3313e55-ca5e-438f-9fe4-911504838802"
  client_secret   = "29afeaa4-8382-44dc-bbfd-fd4a2199cbed"
  tenant_id       = "72f988bf-86f1-41af-91ab-2d7cd011db47"
}

# {
#   "appId": "e3313e55-ca5e-438f-9fe4-911504838802",
#   "displayName": "azure-cli-2020-01-28-15-52-02",
#   "name": "http://azure-cli-2020-01-28-15-52-02",
#   "password": "29afeaa4-8382-44dc-bbfd-fd4a2199cbed",
#   "tenant": "72f988bf-86f1-41af-91ab-2d7cd011db47"
# }