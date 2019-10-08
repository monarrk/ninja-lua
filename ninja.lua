ninja = {}
ninja.vars = ""
ninja.rules = ""
ninja.steps = ""


function ninja:add_rule(name, command)
	ninja.rules = ninja.rules..string.format("rule %s\n  command = %s\n", name, command)
end

function ninja:add_step(i, out, rule)
	ninja.steps = ninja.steps..string.format("build %s: %s %s", out, rule, i)
end

function ninja:add_var(name, val)
	ninja.vars = ninja.vars..string.format("%s = %s\n", name, val)
end

function ninja.write(name)
	file = io.open(name, "w")
	file:write("# Generated by ninja.lua (https://github.com/monarrk/ninja-lua)")
	file:write(ninja.vars.."\n")
	file:write(ninja.rules.."\n")
	file:write(ninja.steps.."\n")
	file:write("\n") -- Ninja wants this orelse it'll throw an "unexpected EOF"
	file:close()
end

function ninja.dump_rules()
	print(ninja.rules)
end

function ninja.dump_steps()
	print(ninja.steps)
end

return ninja
