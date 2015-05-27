(define (center i)
	(/ (+ (lower-bound i) (upper-bound i)) 2))

(define (per-tolerane per i)
	(/ (+ (* (/ per 100) (upper-bound i)) (* (/ per 100) (lower-bound i))) 2))

(define (make-center-percentage c p) 
	(make-interval (- c p) (+ c p)))


(define interval1 (make-interval 3 4))
(define point-center (center interval1))
(define tolerance (per-tolerane 10 interval1))



