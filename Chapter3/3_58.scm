(define (expand num den radix)
	(cons-stream (quotient (* num radix) den)
		(expand (remainder (* num radix) den) den radix)))


expand performs the long division of the num and denom gives the value after the decimal part in the example performed otherwise with repsect to the radix given example (example 4 2 1) wil give output as 2 0 0 0 and so on


1 ]=> (Stream-ref (expand	1 7 10) 0)
;Value: 1
1 ]=> (Stream-ref (expand	1 7 10) 1)
;Value: 4
1 ]=> (Stream-ref (expand	1 7 10) 2)
;Value: 2
1 ]=> (Stream-ref (expand	1 7 10) 3)
;Value: 8
1 ]=> (Stream-ref (expand	1 7 10) 4)
;Value: 5
1 ]=> (Stream-ref (expand	1 7 10) 5)
;Value: 7
1 ]=> (Stream-ref (expand	1 7 10) 6)
;Value: 1
1 ]=> (Stream-ref (expand	1 7 10) 7)




1 ]=> (Stream-ref (expand	3 8 10) 0)
;Value: 3
1 ]=> (Stream-ref (expand	3 8 10) 1)
;Value: 7
1 ]=> (Stream-ref (expand	3 8 10) 2)
;Value: 5
1 ]=> (Stream-ref (expand	3 8 10) 3)
;Value: 0
1 ]=> (Stream-ref (expand	3 8 10) 4)
;Value: 0