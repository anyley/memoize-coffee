# cache repeated calc values
memoize = (arg...) ->
	@cache = {}
	if arg.length == 2
		@fx = arg[arg.length-1]
		@yield = (key) ->
			return @cache[key] if @cache[key]?
			return @cache[key] = @fx(key)
		@yield(arg[0])
	else
		throw new Error("Usage: memoize initKeyArgValue, (keyArg) ->")

module.exports = memoize