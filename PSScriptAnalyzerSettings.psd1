@{
    Severity     = @('Error', 'Warning')

    ExcludeRules = @(
        'PSUseSingularNouns'

        'PSAvoidGlobalVars'

        'PSAvoidGlobalAliases'

        'PSAvoidUsingWriteHost'
    )

    Rules        = @{
        PSUseCompatibleSyntax  = @{
            Enable         = $true
            TargetVersions = @('5.1', '7.0')
        }

        PSUseCompatibleCmdlets = @{
            Compatibility = @(
                'desktop-5.1.14393.206-windows'
                'core-6.1.0-windows'
                'core-6.1.0-linux'
                'core-6.1.0-macos'
            )
        }
    }
}
