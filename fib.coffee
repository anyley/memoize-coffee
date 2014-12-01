memoize = require "./memoize"

fib_index = 45
console.log "Fibonacci index: #{fib_index}\n"

print_elapsed_time = (startTime) ->
	console.log "Elapsed time: #{(Date.now()-startTime)/1000}s\n"

# Fix start time
startTime = Date.now()

# fibonacci algorithm wrapped with memoize function
# arg1 = keyValue
# arg2 and @yield = user function
fast_fib = (x) ->
	memoize x, (n) ->
		return n if n<2
		return @yield(n-1) + @yield(n-2)

console.log "Calc with memoize wrapper..."
console.log fast_fib(fib_index)
print_elapsed_time startTime


# Fix start time
startTime = Date.now()

# fibonacci algorithm
fib = (n) ->
	return n if n<2
	return fib(n-1) + fib(n-2)

console.log "Calc fib function..."
console.log fib(fib_index)
print_elapsed_time startTime

