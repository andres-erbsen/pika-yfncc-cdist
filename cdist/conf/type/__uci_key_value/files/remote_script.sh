export id="$(cat "$__object/parameter/config" 2>/dev/null \
   || echo "$__object_id")"
export config="$(cat "$__object/parameter/config")"
export section="$(cat "$__object/parameter/section")"
export option="$(cat "$__object/parameter/option")"
export value="$(cat "$__object/parameter/value")"
export state="$(cat "$__object/parameter/state")"

if [ "$state" == "absent" ]; then
	uci delete "$config.$section.$option"
else
	uci set "$config.$section.$option=$value"
fi
uci commit "$config"
