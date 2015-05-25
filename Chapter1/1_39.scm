;approximating the tangent function with the help of Lambert


; (define (cont-frac n d k)
 

	
; 	(define (cont-frac-modified n d k)
; 		(if (= k 0)
; 		(/ n d)
; 		(/ (square n) (- d (cont-frac-modified n (- d 2) (- k 1))))))
; 	(cont-frac-modified n d k))
 
 
 (define (tan-cf x k)
 	(define (cont-frac n d counter)
 		( if(=	k	counter)
 			(/	(square n) d)
 			(/	(square	n)	(-	d (cont-frac n	(+ d 2) (+ counter 1))))))
 	(cont-frac x 1 1))



  (define (tan-cf x k) 
   (cont-frac (lambda (i) 
                (if (= i 1) x (- (* x x)))) 
              (lambda (i) 
                (- (* i 2) 1)) 
              k)) 
