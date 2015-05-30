 (define average-damps 9)

(define (cons x y)
	(* (fast-expt 2 x) (fast-expt 3 y)))


(define (car z)
	(nth-root (/ z (find-factor-3 z 1)) 2 average-damps))


(define (cdr z)
	(nth-root (/ z (find-factor-2 z 1)) 3 average-damps))



 (define (find-factor-3 x result)
 	(if (not (= (remainder x 3) 0))
 		(find-factor-3 (/ x 3) (* 3 result))
 		result))

 (define (find-factor-2 x result)
 	(if (not (= (remainder x 2) 0))
 		(find-factor-2 (/ x 2) (* 2 result))
 		result))