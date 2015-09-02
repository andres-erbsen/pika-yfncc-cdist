export config="$(cat "$__object/parameter/config")"
export section="$(cat "$__object/parameter/section")"
export option="$(cat "$__object/parameter/option")"
export value="$(cat "$__object/parameter/value")"
export state="$(cat "$__object/parameter/state")"

if ["$state" == "absent"]; then
	uci delete "$config"."$section"."$option"
else
	export current="$(echo uci get "$config"."$section"."$option")"
	if ["$current" != "$value"]; then
		uci set "$config"."$section"."$option"="$value"
                echo "change" >> "$__messages_out"
		uci commit "$config"
	fi
fi
