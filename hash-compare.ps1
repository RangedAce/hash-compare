param (
    [Parameter(Mandatory=$true)]
    [string]$target_file,

    [Parameter(Mandatory=$true)]
    [string]$Hash
)
try {
    if (-Not (Test-Path $target_file)) {
        throw "Le fichier spécifié n'existe pas."
    }
    $file_info = Get-FileHash $target_file
    if ($file_info.Hash.ToUpper() -eq $Hash.ToUpper()) {
        Write-Output "Fichier OK"
    } else {
        Write-Output "Fichier Corrompu"
    }
} catch {
    Write-Output "Une erreur s'est produite : $_"
}
