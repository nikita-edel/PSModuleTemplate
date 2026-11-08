# Agent guide

A template for PowerShell modules that run on Windows PowerShell 5.1 and PowerShell 7+.
The module is the one folder in `src/`; every script finds its name from there.

## Initialize a new module

Ask for the module name and description if you were not given them. Then, from the repository root:

```powershell
$name = 'NewName'
Rename-Item src/MyModule/MyModule.psd1 "$name.psd1"
Rename-Item src/MyModule/MyModule.psm1 "$name.psm1"
Rename-Item src/MyModule $name
```

1. In the manifest, set `RootModule` to `<name>.psm1`, `GUID` to the output of `New-Guid`, and update `Author`, `CompanyName`, `Copyright`, `Description`, `Tags`, `ProjectUri` and `ModuleVersion`.
2. Replace `Get-Greeting`, `Format-Greeting` and their tests with the real code, and update `FunctionsToExport`.
3. Update the copyright line in `LICENSE`, the top of `README.md`, and start `CHANGELOG.txt` afresh. Delete `TODO.txt` if it is the template's own list.
4. Run `./build.ps1 -Test`.

The repository owner adds the secret `PSGALLERY_API_KEY` in GitHub before the first release.

## Commands

```powershell
./build.ps1 -Test                 # all tests
./build.ps1 -Test Get-Greeting    # test names, or paths to files or folders
./build.ps1 -Install              # install for the current user
./build.ps1 -Package              # out/<Name>-<Version>.zip with an offline install.ps1
```

Before calling work done, run the tests in both shells:

```powershell
pwsh -NoProfile -File build.ps1 -Test
powershell -NoProfile -ExecutionPolicy Bypass -File build.ps1 -Test
```

## Rules

- One function per file, named after the function: exported ones in `src/<Name>/Public`, internal ones in `src/<Name>/Private`.
- Every file in `Public/` is listed under `FunctionsToExport` and has comment-based help with an example.
- Tests go in `tests/Public` or `tests/Private` as `<Function>.Tests.ps1`. Test private functions with `InModuleScope $TestModuleName`.
- PowerShell 5.1 syntax only (no `? :`, `??`, `&&`, `||`, `$IsWindows` without a check). Source and test files are ASCII.
- Add user-visible changes to the top of `CHANGELOG.txt`. GitHub releases show the lines added there.
- Do not run `./build.ps1 -Publish`, push tags or start the release workflow unless asked. A gallery version can be uploaded only once.

## Release

Set `ModuleVersion`, update `CHANGELOG.txt`, commit, tag `v<ModuleVersion>`, push the tag, then start Actions > Release > Run workflow.
