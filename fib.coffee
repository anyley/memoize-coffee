memoize = require "./memoize"

fib_index = 30

print_elapsed_time = (startTime) ->
	console.log "Elapsed time: #{(Date.now()-startTime)/1000}s\n"

# Fix start time
startTime = Date.now()

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

console.log "Calc with memoize wrapper..."
console.log fast_fib(fib_index)
print_elapsed_time startTime


# Fix start time
startTime = Date.now()

# fibonacci algorithm
fib = (n) ->
	switch n 
		when 0 then result = 0
		when 1,2 then result = 1
		else result = fib(n-1) + fib(n-2)
	return result

console.log "Calc fib function..."
console.log fib(fib_index)
print_elapsed_time startTime

