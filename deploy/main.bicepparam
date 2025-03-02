using './main.bicep'

var deploymentEnvironment = readEnvironmentVariable('deploymentEnvironment')
param userAssignedIdentityName = (deploymentEnvironment == 'prod') ? 'UAMI-zzz' : 'UAMI-zzz-test'


