# Docs
**Disclaimer: as of right now, this is a best effort document. I made this primarily for my personal use and secondly for the use of others.**

### Generator functions
function ninja:add\_rule(name, content)

	Adds a rule to the ninja file like this:
	```
	rule %{name}
	  command = %{content}
        ```

function ninja:add\_var(name, val)

	Adds a variable to the ninja file like this:
	```
	%{name} = %{val}
	```

function ninja:add\_step(in, out, rule)

	Adds a `build` instruction to the ninja file like this:
	```
	build ${out}: ${rule} ${in}
	```

function ninja.write(file)

	Writes current instructions to the file `file`
