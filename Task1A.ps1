$filePath = Join-Path -Path $PSScriptRoot -ChildPath ".\Oppgave 1\file.txt"

$fileContent = Get-Content -Path $filePath -Encoding UTF8 -Raw

$reversedContent = -join $fileContent[-1..-$fileContent.Length]

Write-Output $reversedContent