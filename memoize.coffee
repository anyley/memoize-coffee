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

module.exports = memoize