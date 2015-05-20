/********************************************************************
A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n -
3) if n> 3. Write a procedure that computes f by means of a recursive process. Write a procedure that
computes f by means of an iterative process.
*********************************************************************/

==>recursive procedure 
  
 (define (f n) 
    (cond ((< n 3) n) 
         (else (+ (f (- n 1)) 
               (* 2 (f (- n 2))) 
               (* 3 (f (- n 3)))
               )
         )
     )
	) 



===>iterative proceudre


(define (f n) 
   (define (iter n a b c) 
     (if (< n 4) 
       (+ (* a (- n 1) ) 
         (* b (- n 2)) 
         (* c (- n 3))) 
       (iter (- n 1) (+ b a) (+ c (* 2 a)) (* 3 a)))) 
   (iter n 1 2 3)) 