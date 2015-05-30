(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
				(cons (square (car things)) answer))))

	(iter items '()))


explaination: above procedure gives answer in the reverse order because of (cons (square (car things) answer))


(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
				(cons answer (square (car things)) ))))

	(iter items nil))


(defien nil '())


explaination: nil defiend works as the firsst object in the cons because of which full subsequent construction varies
 