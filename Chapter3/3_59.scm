; reverse stream generated in order to multiply the reverse term with each of the coefficeients  
; a0 + (1/2 * a1) + (1/3 * a2) + (1/4 * a3) 
; (1, 1/2,1/3,1/4)
; odd-strams and even-streams are generated as input to the integral function and for no other specific pusrpose


===========================================================================================================
(define (reverse-integer-stream n)
	(cons-stream (/ 1 n) (reverse-integer-stream (+  n 1))))

(define reverse (cons-stream 1 (reverse-integer-stream 1)))

(define (integers-starting-from n)
	(cons-stream n (integers-starting-from (+ n 1))))

(define (integrate-stream stream)
	(define (iter-stream-inter stream rev-stream)
		(cons-stream (* (stream-car stream) (stream-car rev-stream)) (iter-stream-inter (stream-cdr stream) (stream-cdr rev-stream))))
	(iter-stream-inter stream reverse))

(define odds (cons-stream 1 (stream-filter odd? (integers-starting-from 1))))
(define evens (cons-stream 2 (stream-filter even? (integers-starting-from 1))))

(define integrate-odd-series (cons-stream 'c (stream-cdr (integrate-stream odds))))
(define integrate-even-series (cons-stream 'c (stream-cdr (integrate-stream evens))))

;choose alternate and alternat are been used for the cosine and the sine streams since they are alternate exponentials if obeserved clearly 

 

(define (stream-negate stream)
	(cons-stream (- (stream-car stream)) (stream-negate (stream-cdr stream))))


(define (choose-negate-alternate stream)
	(cons-stream (cond ((= negate 0) (set! negate 1) (stream-car stream) )
										 ((= negate 1) (set! negate 0) (- (stream-car stream))))  (choose-negate-alternate (stream-cdr (stream-cdr stream)))))

(define integers (integers-starting-from 1))


1 ]=> (stream-ref integrate-odd-series 0)
;Value: c
1 ]=> (stream-ref integrate-odd-series 1)
;Value: 1
1 ]=> (stream-ref integrate-odd-series 2)
;Value: 3/2
1 ]=> (stream-ref integrate-odd-series 3)
;Value: 5/3
1 ]=> (stream-ref integrate-odd-series 4)
;Value: 7/4
1 ]=> (stream-ref integrate-odd-series 5)
;Value: 9/5
1 ]=> (stream-ref integrate-odd-series 6)
;Value: 11/6


================================================================================================


B ===>
(define exp-stream (cons-stream 1 (integrate-stream exp-stream)))



1 ]=> (stream-ref exp-stream 1)
;Value: 1
 
 
 (define cosine-stream (cons-stream 1 (integrate-stream (scale-stream sine-stream -1))))
 (define sine-stream (cons-stream 0 (integrate-stream cosine-stream)))

(define (scale-stream stream factor)
     	(stream-map (lambda(x) (* x factor)) stream))

 ; procedure tried to find the mapping of the negative sign on the alterante integers 

 (define (odd-negative-int n)
 	(cons-stream n (stream-map - (odd-negative-int (+ n 1)))))