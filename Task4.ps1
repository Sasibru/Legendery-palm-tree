$baseUrl = "https://api.met.no/weatherapi/locationforecast/2.0/compact"

$latitude = "60"
$longitude = "20"

$requestUrl = $baseUrl + "?lat=$latitude&lon=$longitude"

try {
    $response = Invoke-RestMethod -Uri $requestUrl -Headers @{"User-Agent" = "Task4/1.0"}

    $tempSum = 0
    $tempCount = 0

    $currentDate = Get-Date

    foreach ($timeSeries in $response.properties.timeseries) {
        $forecastDate = [datetime]::Parse($timeSeries.time)

        $daysDifference = ($forecastDate - $currentDate).Days
        if ($daysDifference -ge 0 -and $daysDifference -lt 7) {
            if ($timeSeries.data.instant.details.air_temperature) {
                $tempSum += $timeSeries.data.instant.details.air_temperature
                $tempCount++
            }
        }
    }

    if ($tempCount -gt 0) {
        $avgTemp = $tempSum / $tempCount
        $avgTempRounded = [math]::Round($avgTemp, 1)
        Write-Output "Gjennomsnittstemperaturen for de neste 7 dagene er: $avgTempRounded°C"
    }
    else {
        Write-Output "Ingen data tilgjengelig."
    }
}
catch {
    Write-Error "Noe gikk galt: $($_.Exception.Message)"
}