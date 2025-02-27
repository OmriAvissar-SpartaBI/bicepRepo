$azureProfile = Connect-AzAccount -Tenant 'spartabi.com'


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


New-AzResourceGroupDeploymentStack @deployment



$deployment = @{
    'Name' = 'myDeploymentStack'
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