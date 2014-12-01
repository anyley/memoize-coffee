__USAGE:__
```coffee
result = memoize initialKeyValue, (keyValue) ->
  # check conditions
  return if keyValue ...
  
  # calc new key value if required
  newKeyValue = keyValue ...
  
  # calculate and return next result
  return @yield(newKeyValue)
```

Example calculate fibonacci numbers
fib.coffee:
```coffee
memoize = require "./memoize"

...

# fibonacci algorithm wrapped with memoize function
# arg1 = keyValue
# arg2 = user function
# @yield = a memoized user function that returns the result from cache
fast_fib = (x) ->
	memoize x, (n) ->
		return n if n<2
		@yield(n-1) + @yield(n-2)

# fibonacci algorithm
fib = (n) ->
	return n if n<2
	fib(n-1) + fib(n-2)

# run
result = fast_fib(45)
result = fib(45)
```
__Output:__
```
$ coffee fib.coffee
Fibonacci index: 45

Calc with memoize wrapper...
1134903170
Elapsed time: 0.001s

Calc fib function...
1134903170
Elapsed time: 12.884s
```
