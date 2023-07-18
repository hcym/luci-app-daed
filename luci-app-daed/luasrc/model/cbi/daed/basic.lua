local m, s

m = Map("daed", translate("DAE Dashboard"))
m.description = translate("A Linux high-performance transparent proxy solution based on eBPF")

m:section(SimpleSection).template = "daed/daed_status"

s = m:section(TypedSection, "daed")
s.addremove = false
s.anonymous = true

o = s:option(Flag, "enabled", translate("Enabled"))
o.rmempty = false

o = s:option(Flag, "log", translate("Enable Logs"))
o.default = 0
o.rmempty = false

o = s:option(Value, "logfile_maxsize", translate("Logfile Max Size (MB)"))
o.default = 1
o:depends("log", "1")

o = s:option(Value, "listen_addr",translate("Listen Address"))
o.default = '0.0.0.0:2023'

return m
