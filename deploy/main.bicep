targetScope = 'resourceGroup'

extension microsoftGraphV1

var storageAccountName = 'storage${uniqueString(resourceGroup().id)}'
var storageBlobContainerName = 'config'
param userAssignedIdentityName string
// var deploymentScriptName = 'CopyConfigScript'


// resource contributorRoleDefinition 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
//   name: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
// }

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  tags: {
    displayName: storageAccountName
  }
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    allowBlobPublicAccess: true
    encryption: {
      services: {
        blob: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    supportsHttpsTrafficOnly: true
  }

  resource blobService 'blobServices' existing = {
    name: 'default'

    resource blobContainer 'containers' = {
      name: storageBlobContainerName
      properties: {
        publicAccess: 'Blob'
      }
    }
  }
}



resource userAssignedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: userAssignedIdentityName
  location: resourceGroup().location
}


resource myGroup 'Microsoft.Graph/groups@v1.0' = {
  displayName: 'farid'
  mailEnabled: false
  mailNickname: 'fff'
  securityEnabled: true
  uniqueName: 'meme'
  owners: [
    userAssignedIdentity.properties.principalId
  ]
}

// resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
//   name: guid(resourceGroup().id, contributorRoleDefinition.name, userAssignedIdentity.id)
//   properties: {
//     principalId: userAssignedIdentity.properties.principalId
//     roleDefinitionId: contributorRoleDefinition.id
//     principalType: 'ServicePrincipal'
//   }
// }

// resource deploymentScript 'Microsoft.Resources/deploymentScripts@2023-08-01' = {
//   name: deploymentScriptName
//   location: resourceGroup().location
//   kind: 'AzurePowerShell'
//   identity: {
//     type: 'UserAssigned'
//     userAssignedIdentities: {
//       '${userAssignedIdentity.id}': {}
//     }
//   }
//   dependsOn: [
//     roleAssignment
//     storageAccount::blobService::blobContainer
//   ]
//   properties: {
//     azPowerShellVersion: '13.0'
//     cleanupPreference: 'Always'
//     environmentVariables: [
//       {
//         name: 'resourceGroupName'
//         value: resourceGroup().name
//       }
//       {
//         name: 'storageAccountName'
//         value: storageAccountName
//       }
//       {
//         name: 'storageBlobContainerName'
//         value: storageBlobContainerName
//       }
//     ]
//     retentionInterval: 'PT1H'
//     timeout: 'PT1H'
//     scriptContent: loadTextContent('scripts/addToStorage.ps1')
//   }
// }

output groupId string = myGroup.id
