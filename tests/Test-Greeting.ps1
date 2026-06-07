# Minimal, dependency-free tests for Get-Greeting.
# Run with: .\tests\Test-Greeting.ps1
# Exits 0 if all tests pass, 1 if any fail.

$ErrorActionPreference = "Stop"

# Dot-source the function under test (path relative to this script).
. (Join-Path $PSScriptRoot "..\Get-Greeting.ps1")

$failures = 0

function Assert-Equal {
    param($Expected, $Actual, [string]$Because)
    if ($Expected -eq $Actual) {
        Write-Host "  PASS: $Because" -ForegroundColor Green
    } else {
        Write-Host "  FAIL: $Because" -ForegroundColor Red
        Write-Host "        expected: '$Expected'"
        Write-Host "        actual:   '$Actual'"
        $script:failures++
    }
}

Write-Host "Running Get-Greeting tests..."

Assert-Equal "Hello, JJ! Welcome aboard." (Get-Greeting -Name "JJ") "greets a named person"
Assert-Equal "Hello, world! Welcome aboard." (Get-Greeting) "defaults to 'world' when no name is given"
Assert-Equal "Hello, world! Welcome aboard." (Get-Greeting -Name "   ") "falls back to 'world' for blank input"

if ($failures -gt 0) {
    Write-Host "`n$failures test(s) failed." -ForegroundColor Red
    exit 1
}

Write-Host "`nAll tests passed." -ForegroundColor Green
exit 0
