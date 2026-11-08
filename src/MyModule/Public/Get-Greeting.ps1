function Get-Greeting {
    <#
    .SYNOPSIS
        Returns a greeting.

    .PARAMETER Name
        Who to greet.

    .EXAMPLE
        Get-Greeting -Name 'Ada'
        Returns "Hello, Ada!".

    .EXAMPLE
        'Ada', 'Linus' | Get-Greeting
        Returns one greeting per name.
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param(
        [Parameter(Position = 0, ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name = 'World'
    )

    process {
        Format-Greeting -Name $Name
    }
}
