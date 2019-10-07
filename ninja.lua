ninja = {}
ninja.rules = ""
ninja.steps = ""


function ninja.add_rule(name, command)
	ninja.rules = ninja.rules..string.format("rule %s\n  command = %s\n", name, command)
end

function ninja.add_step(i, out, rule)
	ninja.steps = ninja.steps..string.format("build %s: %s %s", out, rule, i)
end

function ninja.write(name)
	file = io.open(name, "w")
	file:write(ninja.rules)
	file:write(ninja.steps)
	file:write("\n")
	file:close()
end

function ninja.dump_rules()
	print(ninja.rules)
end

function ninja.dump_steps()
	print(ninja.steps)
end

return ninja
