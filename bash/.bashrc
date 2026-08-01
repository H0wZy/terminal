export OMP_THEME_PATH="${OMP_THEME_PATH:-$HOME/.cache/oh-my-posh/themes/h0wzy-main-theme.omp.json}"
export WAKATIME_API_KEY="$(awk -F' = ' '/^api_key/{print $2}' ~/.wakatime.cfg 2>/dev/null)"
eval "$(oh-my-posh init bash --config "$OMP_THEME_PATH")"