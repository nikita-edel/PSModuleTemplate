# Shared setup for all Pester tests. Dot-source it from BeforeAll, for a test file one folder below tests/:
#
#   BeforeAll { . (Join-Path -Path (Split-Path -Parent $PSScriptRoot) -ChildPath 'TestHelpers.ps1') }
#
# It imports the module under test from src/ and sets $TestRepoRoot, $TestManifest and $TestModuleName.
# Test files must stay ASCII-only (Windows PowerShell 5.1 reads BOM-less files as ANSI).

$script:TestRepoRoot = Split-Path -Parent $PSScriptRoot
$script:TestManifest = @(Get-ChildItem -Path (Join-Path -Path $script:TestRepoRoot -ChildPath 'src/*/*.psd1'))[0].FullName
$script:TestModuleName = [System.IO.Path]::GetFileNameWithoutExtension($script:TestManifest)

# A copy from elsewhere (the installed module, loaded by a profile) must go: Pester refuses two modules of one name.
$testModuleFolder = Split-Path -Parent $script:TestManifest
Get-Module -Name $script:TestModuleName | Where-Object { -not $_.Path.StartsWith($testModuleFolder) } | Remove-Module -Force
if ($null -eq (Get-Module -Name $script:TestModuleName)) { Import-Module -Name $script:TestManifest -Force -ErrorAction Stop }
