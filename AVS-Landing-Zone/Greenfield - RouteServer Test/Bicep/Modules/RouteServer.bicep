targetScope = 'subscription'

param Location string
param Prefix string
param VNetName string
param RouteServerSubnetPrefix string

resource NetworkResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${Prefix}-Network'
  location: Location
}

module RouteServer 'RouteServer/RouteServer.bicep' = {
  scope: NetworkResourceGroup
  name: '${deployment().name}-Network'
  params: {
    Prefix: Prefix
    Location: Location
    VNetName: VNetName
    RouteServerSubnetPrefix : RouteServerSubnetPrefix
  }
}

output RouteServer string = RouteServer.outputs.RouteServer
output RouteServerSubnetId string = RouteServer.outputs.RouteServerSubnetId
output NetworkResourceGroup string = NetworkResourceGroup.name
