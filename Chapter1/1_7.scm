
#|

	The good-enough? test used in computing square roots will not be very effective for
finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost
always performed with limited precision. This makes our test inadequate for very large numbers. Explain
these statements, with examples showing how the test fails for small and large numbers. An alternative
strategy for implementing good-enough? is to watch how guess changes from one iteration to the
next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that
uses this kind of end test. Does this work better for small and large numbers?

|#


(a) It all depends upon the value 0.001 which is taken as the tolerance in the given procedure. Since .001 is extremely large 
for very small numbers like .0004 It evaluates to 	

(sqrt-iter 1 .0004)

;Value: .0354008825558513

and not .002

(b) For large numbers the value 0.001 becomes negligible and therefor it does not calculate the proper guess	

(sqrt-iter 1 5609909090090) 
evaluates to infinite loop 
