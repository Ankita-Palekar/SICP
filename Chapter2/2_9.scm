(define (find-width interval)
	(/ (+ (upper-bound interval) (lower-bound interval)) 2))

(define (add-interval x y)
	(make-interval (+ (lower-bound x) (lower-bound y))
		(+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
	(make-interval (- (lower-bound x) (upper-bound y)) 
									(- (upper-bound x) (lower-bound y))))
 

(define (make-interval a b) (cons a b))

(define (make-interval a b)
	(cons a b))

(define (upper-bound x)
	(car x))

(define (lower-bound y)
	(cdr y))

(define (print-interval interval) 
	(newline)
	(display "[")
	(display (lower-bound interval))
	(display ",")
	(display (upper-bound interval))
	(display "]"))

(define interval1 (make-interval 2 3))
(define interval2 (make-interval 3 5))

(define final-interval (add-interval interval1 interval2))

(find-width final-interval)


; verifying for add-interval

(define interval1 (make-interval 2 3))
(define interval2 (make-interval 3 5))
(define final-interval (add-interval interval1 interval2))

(find-width interval)
;Value: 13/2
(find-width interval1)
;Value: 5/2
 (find-width interval2)
;Value: 4
width (interval1 + interval2) = width (interval)

;verifyung for the subtract procedures
(define final-sub-interval (sub-interval interval1 interval2))


3 error> (find-width final-sub-interval)

;Value: -3/2

3 error> (find-width interval1)

;Value: 5/2

3 error> (find-width interval2)

;Value: 4



Hence it wirks perfectly only for the aditiona nd subtraction 


