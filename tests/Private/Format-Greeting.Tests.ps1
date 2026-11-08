BeforeAll {
    . (Join-Path -Path (Split-Path -Parent $PSScriptRoot) -ChildPath 'TestHelpers.ps1')
}

Describe 'Format-Greeting' {
    It 'is not exported' {
        Get-Command -Name Format-Greeting -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
    }

    It 'formats the greeting (private functions are tested with InModuleScope)' {
        InModuleScope $TestModuleName { Format-Greeting -Name 'Ada' } | Should -Be 'Hello, Ada!'
    }
}
