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
# arg2 and @yield = user function
fast_fib = (x) ->
	memoize x, (n) ->
		switch n 
			when 0 then result = 0
			when 1,2 then result = 1
			else result = @yield(n-1) + @yield(n-2)
		return result

# fibonacci algorithm
fib = (n) ->
	switch n 
		when 0 then result = 0
		when 1,2 then result = 1
		else result = fib(n-1) + fib(n-2)
	return result
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
