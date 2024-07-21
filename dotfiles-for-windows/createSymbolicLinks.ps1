$sourceFolder = "../nvim"
$destinationFolder = "$env:LOCALAPPDATA/nvim"

# Get all files in the source folder
$files = Get-ChildItem -Path $sourceFolder -File

if (Test-Path -Path $destinationFolder -PathType Container) {
    # Folder exists, delete it
    Remove-Item -Path $destinationFolder -Recurse -Force
    Write-Output "Existing folder deleted: $destinationFolder"
}

# Create a new folder
New-Item -ItemType Directory -Path $destinationFolder
Write-Output "New folder created: $destinationFolder"

# Loop through each file and create a symbolic link in the destination folder
foreach ($file in $files) {
    Write-Host $file.Name $file $file.FullName
    $linkPath = Join-Path -Path $destinationFolder -ChildPath $file.Name
    New-Item -ItemType SymbolicLink -Path $linkPath -Target $file.FullName
}
