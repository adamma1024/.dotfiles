# Install these programs with an Admin permission
# 1. pwsh
# 2. Chocolatey
# 3. neovim
# 4. starship
# 5. Compilors
# 5. Terminal

####################### pwsh ########################
winget install --id Microsoft.Powershell.Preview --source winget
# Source the Path immediately
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

pwsh -v

####################### Chocolatey ########################
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Make `refreshenv` available right away, by defining the $env:ChocolateyInstall
# variable and importing the Chocolatey profile module.
# Note: Using `. $PROFILE` instead *may* work, but isn't guaranteed to.
$env:ChocolateyInstall = Convert-Path "$((Get-Command choco).Path)\..\.."   
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
#$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# refreshenv is now an alias for Update-SessionEnvironment
# Make 'choco' usable
refreshenv

####################### neovim ########################
choco install -y neovim
refreshenv
nvim -v

$nvimTargetPath = "$env:LOCALAPPDATA\nvim"
$nvimSourcePath = "../nvim"
# Copy the Lazyvim and neovim's config into $env:LOCALAPPDATA/nvim
# Folder exists, delete it
if (Test-Path -Path $nvimTargetPath -PathType Container) {
  Remove-Item -Force -Recurse $folderPath
  Write-Host 'Force remove the nvim folder'
}
Copy-Item -Force -Recurse $nvimSourcePath $nvimTargetPath

# Move the alias to the powershell's $PROFILE
#set-alias vi nvim
#set-alias vim nvim

####################### starship ########################
choco install starship
# Create a .config file if not exists and a symbolic link of the starship's toml file
if (-not (Test-Path -Path ~/.config -PathType Container)) {
  mkdir ~/.config
}
# A symbolic link of the style file
New-Item -ItemType SymbolicLink -Path ~/.config/starship.toml -Target ./starship.toml

########################## Languages ##################################### ####################### MinGW-w64 (Get gcc) / NodeJS / py3 ##############
choco install -y mingw nodejs.install python3
refreshenv
gcc -v | node -v | python3 -v


######################### Terminal ################################
# Terminal Dracula
Copy-Item -Force .\windows-terminal-settings.json $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json

