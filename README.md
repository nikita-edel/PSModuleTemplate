# PSModuleTemplate

A template for PowerShell modules that run on Windows PowerShell 5.1 and PowerShell 7+, with a build script, Pester tests and a release workflow.

## Start a new module

1. Rename `src/MyModule` and the `MyModule.psd1` and `MyModule.psm1` inside it to your module's name. Everything else finds the name from there.
2. In the manifest, set `RootModule`, a new `GUID` (`New-Guid`), `Author`, `CompanyName`, `Copyright`, `Description`, `Tags` and `ProjectUri`.
3. Replace `Get-Greeting` and `Format-Greeting` and their tests with your own code. List each file in `Public/` under `FunctionsToExport`.
4. Update the copyright line in `LICENSE`, and start `CHANGELOG.txt` afresh.

## Build script

| Command | What it does |
| --- | --- |
| `./build.ps1 -Test` | Runs all tests |
| `./build.ps1 -Test Get-Greeting tests/Private` | Runs the given tests: test names, or paths to files or folders |
| `./build.ps1 -Install` | Builds the module and installs it for the current user with `tools/install.ps1` |
| `./build.ps1 -Package` | Writes `out/<Name>-<Version>.zip`, the module with an offline `install.ps1` |
| `./build.ps1 -Publish <key>` | Builds the module and publishes it to the PowerShell Gallery |

Tests need Pester 5.5 or later. The PSScriptAnalyzer check is skipped if PSScriptAnalyzer is not installed. Publishing needs PSResourceGet, which comes with PowerShell 7.4 and later.

## Layout

| Path | Contents |
| --- | --- |
| `src/<Name>/Public` | Exported functions, one per file, named after the function |
| `src/<Name>/Private` | Internal functions |
| `tests/Module.Tests.ps1` | Rules for the whole module: manifest, exports, help, ASCII files, analyzer |
| `tests/Public`, `tests/Private` | One `<Function>.Tests.ps1` per function |
| `tests/TestHelpers.ps1` | Imports the module under test; dot-sourced by every test file |
| `agents/` | Instructions for coding agents: how to work with this repository and initialize a new module |
| `tools/` | The scripts behind `build.ps1` |
| `tools/update-subtree.ps1` | Updates the branch `<name>` (lowercase) with only the history of `src/<Name>`, for use with `git subtree` |

## Release

One-time setup: add your PowerShell Gallery API key as the repository secret `PSGALLERY_API_KEY`.

1. Run `./build.ps1 -Test`. The workflow does not run the tests.
2. Set `ModuleVersion` in the manifest and add the changes to the top of `CHANGELOG.txt`.
3. Commit, then tag the commit with `v<ModuleVersion>` and push the tag.
4. Start the workflow: Actions > Release > Run workflow.

The workflow releases the latest `v*` tag. It creates a GitHub release with the zip attached and the lines added to `CHANGELOG.txt` since the previous release as its text, then publishes to the PowerShell Gallery.

## Offline install

Unzip the release package and run `./install.ps1`. `./install.ps1 -Uninstall` removes that version again.
