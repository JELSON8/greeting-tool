# greeting-tool

A tiny PowerShell utility that builds a friendly greeting. Created as a first-PR practice project.

## Usage

```powershell
. .\Get-Greeting.ps1
Get-Greeting -Name "JJ"
# => Hello, JJ! Welcome aboard.
```

If you call it without a name, it greets the world:

```powershell
Get-Greeting
# => Hello, world! Welcome aboard.
```

## Project layout

| Path                 | Purpose                          |
| -------------------- | -------------------------------- |
| `Get-Greeting.ps1`   | The greeting function            |
| `tests/`             | Tests for the greeting function  |

## Running the tests

```powershell
.\tests\Test-Greeting.ps1
```
