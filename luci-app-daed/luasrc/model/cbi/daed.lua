local m, s

m = Map("daed", translate("DAE Dashboard"))
m.description = translate("A Linux high-performance transparent proxy solution based on eBPF")

m:section(SimpleSection).template = "daed/daed_status"

s = m:section(TypedSection, "daed")
s.addremove = false
s.anonymous = true

o = s:option(Flag, "enabled", translate("Enabled"))
o.rmempty = false

o = s:option(Value, "listen_addr",translate("Listen Address"))
o.default = '0.0.0.0:2023'

return m
