Test of memoized Fibonacci algorithm
---------------------------------

Include our __memoize__ modules

	memoize = require "./memoize"

Set index of fibonacci number to find

	fib_index = 40
	console.log "Fibonacci index: #{fib_index}\n"

Utility function for output elapsed time

	print_elapsed_time = (startTime) ->
		console.log "Elapsed time: #{(Date.now()-startTime)/1000}s\n"

Implementation of slow fibonacci function

	fib = (n) ->
		return n if n<2
		fib(n-1) + fib(n-2)

Run slow function and show result

	startTime = Date.now()
	console.log "Calc slow fib function..."
	console.log fib(fib_index)
	print_elapsed_time startTime

Implementation of memoized function

	fast_fib = memoize (n) ->
		return n if n<2
		fast_fib(n-1) + fast_fib(n-2)

Run fast function and show result

	startTime = Date.now()
	console.log "Calc with memoize wrapper..."
	console.log fast_fib(fib_index)
	print_elapsed_time startTime


