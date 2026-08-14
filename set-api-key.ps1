$ErrorActionPreference = "Stop"
Write-Host "Aqua Agent - konfiguracja klucza OpenAI API" -ForegroundColor Cyan
Write-Host "Klucz zostanie zapisany jako zmienna srodowiskowa uzytkownika OPENAI_API_KEY." -ForegroundColor Gray
$secure = Read-Host "Wklej klucz API" -AsSecureString
$ptr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure)
try {
  $plain = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr)
  if ([string]::IsNullOrWhiteSpace($plain)) { throw "Nie podano klucza." }
  [Environment]::SetEnvironmentVariable("OPENAI_API_KEY", $plain, "User")
  Write-Host "Klucz zapisany. Zamknij to okno i uruchom START_AQUA_AGENT.bat." -ForegroundColor Green
}
finally {
  if ($ptr -ne [IntPtr]::Zero) { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr) }
  $plain = $null
}
Read-Host "Enter aby zakonczyc"
