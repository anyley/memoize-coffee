# cache repeated calc values
memoize = (fx) ->
	cache = {}
	memoized = () ->
		keys = []
		keys.push i for i in arguments
		key = keys.join()
		return cache[key] if cache[key]?
		cache[key] = fx.apply(this, arguments)

module.exports = memoize