$azureProfile = Connect-AzAccount -Tenant 'spartabi.com'


$azureContex = Set-AzContext -DefaultProfile $azureProfile -Subscription '0a3d6877-fdae-4615-8ed5-194f34e9502a'


$deployment = @{
    'Name' = 'myDeploymentStack'
    'ResourceGroupName' = 'bicep'
    'TemplateFile' = 'C:\Users\Omri Avissar\OneDrive - SpartaBI Ltd\Desktop\bicep\deploy\main.bicep'
    'ActionOnUnmanage' = 'DeleteAll'
    'DefaultProfile' = $azureContex
    'Description' = 'myDescription'
    'Force' = $true
    'SkipTemplateParameterPrompt' = $true
    'DenySettingsMode' = 'None'
    'TemplateParameterObject' = @{
    }
}


New-AzResourceGroupDeploymentStack @deployment



$deployment = @{
    'Name' = Get-Date -AsUTC -Format FileDateTime
    'ResourceGroupName' = 'bicep'
    'TemplateFile' = 'C:\Users\Omri Avissar\OneDrive - SpartaBI Ltd\Desktop\bicepRepo\bicepRepo\deploy\main.bicep'
    'DefaultProfile' = $azureProfile
    'Force' = $true
    'SkipTemplateParameterPrompt' = $true
    # 'TemplateParameterObject' = @{
    #     'userAssignedIdentityName' = 'UAMI-zzz'
    # }
}

$env:deploymentEnvironment = 'prod'

New-AzResourceGroupDeployment @deployment -TemplateParameterFile 'C:\Users\Omri Avissar\OneDrive - SpartaBI Ltd\Desktop\bicepRepo\bicepRepo\deploy\main.bicepparam'


$testDeployment = @{
    'ResourceGroupName' = 'bicep'
    'TemplateFile' = 'C:\Users\Omri Avissar\OneDrive - SpartaBI Ltd\Desktop\bicepRepo\bicepRepo\deploy\main.bicep'
    'DefaultProfile' = $azureProfile
    'SkipTemplateParameterPrompt' = $true
    'TemplateParameterObject' = @{
        'userAssignedIdentityName' = 'UAMI-zzz'
    }
}


Test-AzResourceGroupDeployment @testDeployment

Get-AzResourceGroupDeploymentWhatIfResult @testDeployment

find-Module -Name Az.resources -MaximumVersion 7.9999.9999


$a=Get-AzADGroup -ObjectId '5341b1b9-f9ae-4630-bc4e-02975659add' -DefaultProfile $azureContex






$deletion = @{
    'Name' = 'myDeploymentStack'
    'ResourceGroupName' = 'bicep'
    'ActionOnUnmanage' = 'DeleteAll'
    'DefaultProfile' = $azureProfile
    'Force' = $true
}



Remove-AzResourceGroupDeploymentStack @deletion