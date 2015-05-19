#|

he exponentiation algorithms in this section are based on performing exponentiation by
means of repeated multiplication. In a similar way, one can perform integer multiplication by means of
repeated addition. The following multiplication procedure (in which it is assumed that our language can
only add, not multiply) is analogous to the expt procedure:
(define (* a b)
(if (= b 0)
0
(+ a (* a (- b 1)))))
This algorithm takes a number of steps that is linear in b. Now suppose we include, together with addition,
operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using
these, design a multiplication procedure analogous to fast-expt that uses a logarithmic number of
steps.

|#



(define (fast-expt b n)
(cond ((= n 0) 1)
((even? n) (square (fast-expt b (halve n 2))))
(else (multi b (fast-expt b (- n 1))))))

(define (multi a b)
(if (= b 0)
0
(+ a (multi a (- b 1)))))


(define (double x)
(multi 2 x))


(define (halve x)
(/ x 2))

(define (even? n)
	(= (remainder n 2) 0))








