@{
    RootModule           = 'MyModule.psm1'
    ModuleVersion        = '0.1.0'
    CompatiblePSEditions = @('Desktop', 'Core')
    GUID                 = '8e87a77b-d855-4a06-bcba-2293310e939d'
    Author               = 'Nikita Edel'
    CompanyName          = 'Nikita Edel'
    Copyright            = '(c) 2026 Nikita Edel. Licensed under the MIT License.'
    Description          = 'A minimal example module. Replace this text with what your module does.'
    PowerShellVersion    = '5.1'
    RequiredModules      = @()

    # One entry per file in Public/. tests/Module.Tests.ps1 checks that the two stay in sync.
    FunctionsToExport    = @(
        'Get-Greeting'
    )
    CmdletsToExport      = @()
    VariablesToExport    = @()
    AliasesToExport      = @()

    PrivateData          = @{
        PSData = @{
            Tags         = @('Example', 'Windows', 'Linux', 'MacOS', 'PSEdition_Desktop', 'PSEdition_Core')
            LicenseUri   = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://github.com/nikita-edel/PSModuleTemplate'
            ReleaseNotes = 'See CHANGELOG.txt'
        }
    }
}
