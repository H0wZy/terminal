if (-not $env:OMP_THEME_PATH) {
    $env:OMP_THEME_PATH = "$HOME\.cache\oh-my-posh\themes\h0wzy-main-theme.omp.json"
}

$wakatimeCfg = "$HOME\.wakatime.cfg"
if (Test-Path $wakatimeCfg) {
    $match = Select-String -Path $wakatimeCfg -Pattern '^api_key\s*=\s*(.+)$'
    if ($match) { $env:WAKATIME_API_KEY = $match.Matches[0].Groups[1].Value.Trim() }
}

oh-my-posh init pwsh --config "$env:OMP_THEME_PATH" | Invoke-Expression