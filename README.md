__USAGE:__
```coffee
recFunction = memoize (arguments...) ->
  # check conditions
  return if arguments[0]== ... arguments[...]==....
  
  # calculate and return next result
  return recFunction(arg1 | [arg1, arg2, ... argN])
```

Example calculate fibonacci numbers
fib.coffee:
```coffee
memoize = require "./memoize"

# fibonacci algorithm
fib = (n) ->
	return n if n<2
	fib(n-1) + fib(n-2)

# fibonacci algorithm wrapped with memoize function
fast_fib = memoize (n) ->
	return n if n<2
	fast_fib(n-1) + fast_fib(n-2)

# run
result = fib(40)
result = fast_fib(40)
```
__Output:__
```
$ coffee fib.coffee
Fibonacci index: 40

Calc slow fib function...
102334155
Elapsed time: 1.808s

Calc with memoize wrapper...
102334155
Elapsed time: 0.001s
```
