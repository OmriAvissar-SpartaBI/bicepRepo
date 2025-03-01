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


$testDeployment = @{
    'ResourceGroupName' = 'bicep'
    'TemplateFile' = 'C:\Users\Omri Avissar\OneDrive - SpartaBI Ltd\Desktop\bicepRepo\bicepRepo\deploy\main.bicep'
    'DefaultProfile' = $azureProfile
    'SkipTemplateParameterPrompt' = $true
    'TemplateParameterObject' = @{
        'userAssignedIdentityName' = 'UAMI-zzz'
    }
}


$at='C:\Users\Omri Avissar\OneDrive - SpartaBI Ltd\Desktop\New Text Document.txt'
$a=Test-AzResourceGroupDeployment @testDeployment 4>$at

$aaaa=Get-Content -LiteralPath 'C:\Users\Omri Avissar\OneDrive - SpartaBI Ltd\Desktop\New Text Document.txt' -Raw -Force


-WarningVariable aaa -WarningAction SilentlyContinue

$null -eq $aaaa


$a=@{}

$a.Keys.Count

Get-ChildItem 'gfgg' -ErrorVariable 'aaa'

$deletion = @{
    'Name' = 'myDeploymentStack'
    'ResourceGroupName' = 'bicep'
    'ActionOnUnmanage' = 'DeleteAll'
    'DefaultProfile' = $azureProfile
    'Force' = $true
}



Remove-AzResourceGroupDeploymentStack @deletion