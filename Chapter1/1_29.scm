
(define (simpsons f a b n)
	(define final-n n)
	(define h (/ (- b a) n))
	
	(define (y-term k) 
     (define y (f (+ a (* k h)))) 
     (if (or (= k 0) (= k final-n)) 
         (* 1 y) 
         (if (even? k) 
             (* 2 y) 
             (* 4 y)))) 
	(* (/ h 3)(sum y-term 0 inc final-n))
)

(simpson cube 0  1 1000)

;Value: 1/4

(simpson cube 0  1 100)

;Value: 1/4