memoize = require "./memoize"

fib_index = 40
console.log "Fibonacci index: #{fib_index}\n"

print_elapsed_time = (startTime) ->
	console.log "Elapsed time: #{(Date.now()-startTime)/1000}s\n"

# fibonacci algorithm
fib = (n) ->
	return n if n<2
	fib(n-1) + fib(n-2)

startTime = Date.now()
console.log "Calc slow fib function..."
console.log fib(fib_index)
print_elapsed_time startTime


# fibonacci algorithm wrapped with memoize function
fast_fib = memoize (n) ->
	return n if n<2
	fast_fib(n-1) + fast_fib(n-2)


startTime = Date.now()
console.log "Calc with memoize wrapper..."
console.log fast_fib(fib_index)
print_elapsed_time startTime


