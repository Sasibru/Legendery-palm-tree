$filePath = Join-Path -Path $PSScriptRoot -ChildPath ".\Oppgave 1\file.txt"

$fileContent = Get-Content -Path $filePath -Encoding UTF8

$reversedContent = $fileContent | ForEach-Object {
    $charArray = $_.ToCharArray()
    [array]::Reverse($charArray)
    -join $charArray
}


foreach ($word in $reversedContent) {
    Write-Output $word
}
