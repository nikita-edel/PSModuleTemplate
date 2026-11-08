function Format-Greeting {
    [CmdletBinding()]
    [OutputType([string])]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    "Hello, $Name!"
}
