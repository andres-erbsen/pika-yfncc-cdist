export option="$(cat "$__object/parameter/option" 2>/dev/null \
   || echo "$__object_id")"
export value="$(cat "$__object/parameter/value")"
export state="$(cat "$__object/parameter/state")"

export config="$(echo "$option" | awk -F'.' '{print $1}')"

if [ "$state" == "absent" ]; then
	uci delete "$option"
else
	uci set "$option=$value"
fi
uci commit "$config"
