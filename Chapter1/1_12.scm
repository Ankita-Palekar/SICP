(define (pascal-triangle row col) 
   (cond ((> col row) 0) 
         ((< col 0) 0) 
         ((= col 1) 1)
         ((+ (pascal-triangle (- row 1) col)
             (pascal-triangle (- row 1) (- col 1)))))) 


	
(define (iter-display-1 row n)
		(cond ((not (> row n)) (newline) (iter-display-2 row 1) (iter-display-1 (+ row 1) n))))

(define (iter-display-2 row col)
		(cond ((not (> col row)) (display " ") (display (pascal-triangle row col)) (display " ") (iter-display-2 row (+ col 1)))))

(define (pascal-display n)
	(iter-display-1 1 1 n))

;using single iteration method

(define (pascal-display n)
	(iter-display 1 1 n))

(define (iter-display row col n)
	(cond ((and (= row n) (= col n)) (display (pascal-triangle row col)))
				((> col row)(newline) (iter-display (+ row 1) 1 n))
				((= col n)(newline) (display (pascal-triangle row col))    (iter-display (+ row 1) 1 n))
				((<= col n)(display (pascal-triangle row col)) (iter-display row (+ col 1) n))))