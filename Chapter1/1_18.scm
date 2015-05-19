#|

Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative
process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic
number of steps
|#

(define (fast-expt b n) 
   (define (iter a b n) 
     (cond ((= n 0) a) 
           ((even? n) (iter a (square b) (halve n))) 
           (else (iter (multi a b) b (- n 1))))) 
   (iter 1 b n)) 
  
(define (square x) (multi x x)) 

(define (even? n)
	(= (remainder n 2) 0))


	(define (multi a b)
(if (= b 0)
0
(+ a (multi a (- b 1)))))


(define (double x)
(multi 2 x))


(define (halve x)
(/ x 2))

 