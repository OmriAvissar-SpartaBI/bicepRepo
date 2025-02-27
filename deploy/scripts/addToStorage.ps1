$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'
Set-StrictMode -Version 3

$resourceGroupName = $env:resourceGroupName
$storageAccountName = $env:storageAccountName
$storageBlobContainerName = $env:storageBlobContainerName

$DeploymentScriptOutputs = @{
    'Account' = (Get-AzContext).Account.Id
}