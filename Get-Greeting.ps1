function Get-Greeting {
    [CmdletBinding()]
    param(
        [string]$Name = "world"
    )

    if ([string]::IsNullOrWhiteSpace($Name)) {
        $Name = "world"
    }

    return "Hello, $Name! Welcome aboard."
}
