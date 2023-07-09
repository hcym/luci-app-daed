local sys  = require "luci.sys"
local http = require "luci.http"

module("luci.controller.daed", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/daed") then
		return
	end

	local page = entry({"admin", "services", "daed"}, cbi("daed"), _("DAED"), -1)
	page.dependent = true
	page.acl_depends = { "luci-app-daed" }

	entry({"admin", "services", "daed", "status"}, call("act_status")).leaf = true
end

function act_status()
	local e = {}
	e.running = sys.call("pgrep -f daed >/dev/null") == 0
	http.prepare_content("application/json")
	http.write_json(e)
end
