BeforeAll {
    . (Join-Path -Path (Split-Path -Parent $PSScriptRoot) -ChildPath 'TestHelpers.ps1')
}

Describe 'Get-Greeting' {
    It 'greets the world by default' {
        Get-Greeting | Should -Be 'Hello, World!'
    }

    It 'greets the given name' {
        Get-Greeting -Name 'Ada' | Should -Be 'Hello, Ada!'
    }

    It 'greets every name from the pipeline' {
        'Ada', 'Linus' | Get-Greeting | Should -Be @('Hello, Ada!', 'Hello, Linus!')
    }

    It 'rejects an empty name' {
        { Get-Greeting -Name '' } | Should -Throw
    }
}
