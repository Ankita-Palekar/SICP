(define (good-enough? v1 v2) 
   (define tolerance 0.000001) 
   (< (/ (abs (- v1 v2)) v2)  tolerance)) 
  
(define (iterative-improve good-enough? improve) 
 (lambda (x) 
   (let ((y (improve x))) 
     (if (good-enough? x y) 
         y
       ((iterative-improve good-enough? improve) y)) 
     ))) 

(define (sqrt x) 
 ((iterative-improve   
   (lambda (y) 
     (/ (+ (/ x y) y) 2)) 
   good-enough?) 1.0)) 