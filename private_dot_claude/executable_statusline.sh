#!/bin/bash
input=$(cat)

read -r model dir used size pct cost <<< "$(printf '%s' "$input" | jq -r '
  [ (.model.display_name // "?" | gsub(" "; " ")),
    (.workspace.current_dir // .cwd // "-"),
    (.context_window.total_input_tokens // 0),
    (.context_window.context_window_size // 0),
    (.context_window.used_percentage // 0 | floor),
    (.cost.total_cost_usd // 0)
  ] | @tsv')"

model=${model//$' '/ }
branch=$(git -C "$dir" rev-parse --abbrev-ref HEAD 2>/dev/null)

human() {
  awk -v n="$1" 'BEGIN{
    if (n >= 1000000) printf "%.1fM", n/1000000;
    else if (n >= 1000) printf "%.0fk", n/1000;
    else printf "%d", n
  }'
}

if   [ "$pct" -ge 80 ]; then ctx=$'\033[31m'
elif [ "$pct" -ge 20 ]; then ctx=$'\033[33m'
else                         ctx=$'\033[32m'
fi
dim=$'\033[2m'; reset=$'\033[0m'; cyan=$'\033[36m'; sep="${dim} · ${reset}"

out="${cyan}${model}${reset}${sep}${ctx}$(human "$used")/$(human "$size") (${pct}%)${reset}"
[ -n "$branch" ] && out+="${sep}${dim}${branch}${reset}"
out+="${sep}${dim}\$$(printf '%.2f' "$cost")${reset}"

printf '%b' "$out"
