local prefs = import("LrPrefs").prefsForPlugin()
local LrView = import("LrView")

local Updates = require("Updates")

local bind = LrView.bind

local Info = {}

function Info.sectionsForTopOfDialog(f, _)
	if prefs.checkForUpdates == nil then
		prefs.checkForUpdates = true
	end
	local settings = {
		title = LOC("$$$/iNat/Info/PluginOptions=Plugin options"),
		bind_to_object = prefs,
		
		f:row({
			f:static_text({
				title = LOC("$$$/iNat/Info/AutoCheckUpdates=Automatically check for updates"),
				alignment = "right",
				width = LrView.share("inaturalistPrefsLabel"),
			}),
			f:checkbox({
				value = bind("checkForUpdates"),
				alignment = "left",
			}),
		}),
		
		f:row({
			f:static_text({
				title = LOC("$$$/iNat/Info/CheckUpdatesNow=Check for updates now"),
				alignment = "right",
				width = LrView.share("inaturalistPrefsLabel"),
			}),
			f:push_button({
				title = LOC("$$$/iNat/Info/Go=Go"),
				action = Updates.forceUpdate,
			}),
		}),
		
		f:row({
			f:static_text({
				title = LOC("$$$/iNat/Info/LogLevel=Log level"),
				alignment = "right",
				width = LrView.share("inaturalistPrefsLabel"),
			}),
			f:popup_menu({
				value = bind("logLevel"),
				items = {
					{ title = LOC("$$$/iNat/Info/LogNone=None"), value = nil },
					{ title = LOC("$$$/iNat/Info/LogTrace=Trace"), value = "trace" },
				},
			}),
		}),
	}
	
	return { settings }
end

return Info
