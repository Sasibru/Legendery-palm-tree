$path = Join-Path -Path $PSScriptRoot -ChildPath ".\Oppgave 3"

$fileType = "*.txt"
$pattern = "Sommer"

$allFiles = Get-ChildItem -Path $path -Filter $fileType -Recurse

$numberOfMatchingFiles = 0

foreach ($file in $allFiles) {
    $content = Get-Content -Path $file.FullName -Encoding UTF8 -Raw

    if ($content -match $pattern) {
        $numberOfMatchingFiles++
    }
}

Write-Output "Antall filer som inneholder '$pattern': $numberOfMatchingFiles"
