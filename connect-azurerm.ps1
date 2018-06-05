function Connect-AzureRM {
    if (-not($Cred)) {Connect-AzureAD}

    Write-Host "Connecting to Azure IRM..."

    if (-not(Get-Module -name aadrm)) {Import-Module aadrm}

    #$global:SessionSFB = New-CsOnlineSession -Credential $global:Cred

    # Import-PSSession $global:SessionSFB | Out-Null
    connect-aadrmservice -Credential $global:Cred
    Write-Host ""
}
