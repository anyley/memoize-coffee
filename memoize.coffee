# cache repeated calc values
memoize = (arg...) ->
	@cache = {}
	@fx = arg[arg.length-1]
	if arg.length == 2
		@yield = (key) ->
			return @cache[key] if @cache[key]?
			return @cache[key] = @fx(key)
		@yield(arg[0])
	else
		throw new Error("Usage: memoize initKeyArgValue, (keyArg) ->")


# Fix start time
t1 = Date.now()

# fibonacci algorithm wrapped with memoize function
console.log memoize 100, (x) ->
	switch x 
		when 0 then result = 0
		when 1,2 then result = 1
		else result = @yield(x-1) + @yield(x-2)
	return result

# calc elapsed time
console.log "Elapsed time: #{(Date.now()-t1)/1000}s"


