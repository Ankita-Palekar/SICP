(define (cc amount coin-values)
	(cond ((= amount 0) 1)
		((or (< amount 0) (no-more? coin-values)) 0)
		(else 

			(+ (cc amount
			(except-first-denomination coin-values))
				(cc (- amount	(first-denomination coin-values))	coin-values)))))

(define (except-first-denomination coins)
	(cdr coins))

(define (no-more? coins)
	(null? coins))

(define (first-denomination coins) 
	(car coins))


==================Miscallaneous tried==========================

(define indian-rs (list 50 25 10 5 1 0.5))
;Value: indian-rs
1 ]=> (cc 100 indian-rs)
;Value: 7747
1 ]=> (define uk-coins (list 100 50 20 10 5 2 1 0.5))
;Value: uk-coins
1 ]=> (cc 100 uk-coins)
;Value: 104561
 1 ]=> (cc 100 uk-coins)
;Value: 104561

===================Us coins=========================
; for us coins
1 ]=> (define us-coins (list 50 25 10 5 1))
;Value: us-coins
1 ]=> (cc 11 us-coins)
;Value: 4


1 ]=> (define us-coins (list 25 50 5 10 1))
;Value: us-coins
1 ]=> (cc 11 us-coins)
;Value: 4'


=====================Uk coins==============================

1 ]=> (define uk-coins (list 50 100 0.5 20 10 5 2 1))
;Value: uk-coins
1 ]=> (cc 100 uk-coins)
;Value: 104561

1 ]=> (define uk-coins (list 100 50 20 10 5 2 1 0.5))
;Value: uk-coins
1 ]=> (cc 100 uk-coins)
;Value: 104561



Explaination : from the above answer it is seen that the order of the list does not metter at all. Because first type of coin can be anything and remainning coins will be chosen subtracting the first kind of coins 