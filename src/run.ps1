$azureProfile = Connect-AzAccount -Tenant 'spartabi.com'


$azureContex = Set-AzContext -DefaultProfile $azureProfile -Subscription '21ec9e4c-2010-47a0-8014-da19ee5608dd'




Select-AzSubscription -Context $azureContex -



$deployment = @{
    'Name' = 'myDeploymentStack'
    'ResourceGroupName' = 'bicep'
    'TemplateFile' = 'C:\Users\Omri Avissar\OneDrive - SpartaBI Ltd\Desktop\bicep\deploy\main.bicep'
    'ActionOnUnmanage' = 'DeleteAll'
    'DefaultProfile' = $azureProfile
    'Description' = 'myDescription'
    'Force' = $true
    'SkipTemplateParameterPrompt' = $true
    'DenySettingsMode' = 'None'
    'TemplateParameterObject' = @{
    }
}

Get-Module -name az.resource -ListAvailable

New-AzResourceGroupDeploymentStack @deployment



$deployment = @{
    'Name' = Get-Date -AsUTC -Format FileDateTime
    'ResourceGroupName' = 'bicep'
    'TemplateFile' = 'C:\Users\Omri Avissar\OneDrive - SpartaBI Ltd\Desktop\bicepRepo\bicepRepo\deploy\main.bicep'
    'DefaultProfile' = $azureProfile
    'Force' = $true
    'SkipTemplateParameterPrompt' = $true
    'TemplateParameterObject' = @{
        'userAssignedIdentityName' = 'UAMI-zzz'
    }
}


New-AzResourceGroupDeployment @deployment


# Get-AzDeploymentScriptLog -ResourceGroupName 'bicep' -Name 'CopyConfigScript'

$deletion = @{
    'Name' = 'myDeploymentStack'
    'ResourceGroupName' = 'bicep'
    'ActionOnUnmanage' = 'DeleteAll'
    'DefaultProfile' = $azureProfile
    'Force' = $true
}



Remove-AzResourceGroupDeploymentStack @deletion