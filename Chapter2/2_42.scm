


(define (enumerate-interval low high)
	(if (> low high)
		nil
		(cons low (enumerate-interval (+ low 1) high))))




(define (enumerate-tree tree)
	(cond ((null? tree) nil)
				((not (pair? tree)) (list tree))
				(else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree)) ))))


================================================================================================

(define (queens board-size)
	(define (queen-cols k)
		(if (= k 0)
			(list empty-board)
			(filter (lambda (positions) (safe? k positions)) 
				(flatmap (lambda (rest-of-queens) (map (lambda (new-row)(adjoin-position new-row k rest-of-queens))
					(enumerate-interval 1 board-size)))
					(queen-cols (- k 1)))))
		(queen-cols board-size)))



(define (safe? k positions)
		(if (null? positions) 
			false
			(let ((current-pos (car positions))
						(current-row (car current-pos))
						(current-col (cdr current-pos)))
			(cond ((or 	(and (= current-col (- k 1)) (= current-row (- k 1))) 
									(and (= current-col (+ k 1)) (= current-row (+ k 1)))
									(and (= current-col (- k 1)) (= current-row (+ k 1)))
									(and (= current-col (+ k 1)) (= current-row (- k 1)))) (display "===	traced false  ===")(newline) (safe? k (cdr positions)))
							(else ("=== traced true  ====") (newline) true)))))


(define (adjoin-position new-row k rest-of-queens)
	(append (list new-row k) (rest-of-queens)))

(define empty-board '())