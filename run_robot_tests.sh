Write-Host "Running tests"

# Käynnistetään Flask-palvelin taustalle
$flask = Start-Process -FilePath "poetry" -ArgumentList "run python src/index.py" -PassThru
Write-Host "Started Flask server (PID $($flask.Id))"

# Odotetaan että palvelin vastaa portissa 5001
Write-Host "Waiting for server to be ready..."
$serverReady = $false

while (-not $serverReady) {
    try {
        $response = Invoke-WebRequest -Uri "http://localhost:5001" -UseBasicParsing -TimeoutSec 1
        if ($response.StatusCode -eq 200) {
            $serverReady = $true
        }
    } catch {
        Start-Sleep -Seconds 1
    }
}

Write-Host "Flask server is ready"

# Suoritetaan testit
poetry run robot --variable HEADLESS:true src/tests
$exitCode = $LASTEXITCODE

# Pysäytetään Flask-palvelin
Write-Host "Stopping Flask server"
Stop-Process -Id $flask.Id -Force

exit $exitCode
