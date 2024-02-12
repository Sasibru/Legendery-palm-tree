$filePath = Join-Path -Path $PSScriptRoot -ChildPath ".\Oppgave 2\array.json"

$fileContent = Get-Content -Path $filePath -Raw | ConvertFrom-Json

$evenNumbers = $fileContent | Where-Object { $_ % 2 -eq 0 }

$sumEven = $evenNumbers | Measure-Object -Sum | Select-Object -ExpandProperty Sum

Write-Output "Partall: $evenNumbers"
Write-Output "Summen av partall: $sumEven"
