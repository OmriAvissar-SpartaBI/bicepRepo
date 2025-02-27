targetScope = 'subscription'

param location string

resource myGroup 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: 'farid'
  location: location
}
