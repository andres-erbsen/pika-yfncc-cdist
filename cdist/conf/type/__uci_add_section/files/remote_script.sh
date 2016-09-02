export section="$(cat "$__object/parameter/section" 2>/dev/null \
   || echo "$__object_id")"

export config="$(echo "$section" | awk -F'.' '{print $1}')"

export type="$( echo "$section" | cut -d. -f2 | cut -d'[' -f1 | tr -d '@')"

uci add "$config" "$type"
uci commit "$config"
