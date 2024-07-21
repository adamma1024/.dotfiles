# Install these programs with an Admin permission
# 1. pwsh
# 2. Chocolatey
# 3. neovim
# 4. MinGW-w64
# 5. Node

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

$nvimTargetPath = $env:LOCALAPPDATA/nvim
$nvimSourcePath = ../nvim
# Copy the Lazyvim and neovim's config into $env:LOCALAPPDATA/nvim
# Folder exists, delete it
if (Test-Path -Path $env:LOCALAPPDATA/nvim -PathType Container) {
  Remove-Item -Path $folderPath -Recurse -Force
  Write-Host 'Force remove the nvim folder'
}
cp -Force -Recurse $nvimSourcePath $nvimTargetPath

# Change the alias of vi and vim
set-alias vi nvim
set-alias vim nvim

########################## Languages #####################################
####################### MinGW-w64 (Get gcc) / NodeJS / py3 ##############
choco install -y mingw nodejs.install python3
refreshenv
gcc -v | node -v | python3 -v

