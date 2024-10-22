ninja = {}
ninja.vars = ""
ninja.rules = ""
ninja.steps = ""
ninja.body = ""

-- add information to the "structured" part of the file
function ninja:add_rule(name, command)
	ninja.rules = ninja.rules..string.format("rule %s\n  command = %s\n", name, command)
end

function ninja:add_step(i, out, rule)
	ninja.steps = ninja.steps..string.format("build %s: %s %s", out, rule, i)
end

function ninja:add_var(name, val)
	ninja.vars = ninja.vars..string.format("%s = %s\n", name, val)
end

-- Add "raw" information to the bottom of the file in the body section
function ninja:add_raw_line(cont)
	ninja.body = ninja.body..cont.."\n"
end

function ninja:add_raw_rule(name, command)
	ninja.body = ninja.body..string.format("rule %s\n  command = %s\n", name, command)
end

function ninja:add_raw_step(i, out, rule)
	ninja.body = ninja.body..string.format("build %s: %s %s\n", out, rule, i)
end

function ninja:add_raw_var(name, val)
	ninja.body = ninja.body..string.format("%s = %s\n", name, val)
end

-- reset all vars for making multiple files
function ninja:reset()
	ninja.vars = ""
	ninja.rules = ""
	ninja.steps = ""
	ninja.body = ""
end

-- write information to file
function ninja.write(name)
	file = io.open(name, "w")
	file:write("# Generated by ninja.lua (https://github.com/monarrk/ninja-lua)")
	file:write(ninja.vars.."\n")
	file:write(ninja.rules.."\n")
	file:write(ninja.steps.."\n")
	file:write(ninja.body.."\n")
	file:write("\n") -- Ninja wants this orelse it'll throw an "unexpected EOF"
	file:close()
end

-- dump info to stdout
function ninja.dump_rules()
	print(ninja.rules)
end

function ninja.dump_steps()
	print(ninja.steps)
end

function ninja.dump_vars()
	print(ninja.vars)
end

function ninja.dump_body()
	print(ninja.body)
end

return ninja
