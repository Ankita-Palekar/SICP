(define auxilary-ds '())
(define (count-pairs x)
	(if (not (pair? x))
		0
		(+ (if (check-pair? (count-pairs (car x)) auxilary-ds)
					1
					0) 
			
			 (if (check-pair? (count-pairs (cdr x)) auxilary-ds)
					1
					0) 1)))

; (define (check-pair pair-list)
; 	(define (check-internal temp-array)
; 		(cond
; 					((null? temp-array) (display "--  --") (display pair-list)    (set! auxilary-ds (append auxilary-ds (list pair-list))) 1)
; 					((pair? (car temp-array)) (display "--  --") (if (eq? pair-list (car temp-array)) 0 (check-internal (cdr temp-array))))
; 					(else (display "-- --")  (check-internal (cdr temp-array)))))
; 	(check-internal auxilary-ds))

(define (check-pair? pair-list auxilary-ds)
	(cond
				((null? auxilary-ds)  (display pair-list)    (set! auxilary-ds (append auxilary-ds (list pair-list))) true)
				((pair? (car auxilary-ds))  (if (eq? pair-list (car auxilary-ds)) false (check-pair pair-list (cdr auxilary-ds))))
				(else (check-internal pair-list (cdr auxilary-ds)))))


(define auxilary-ds '())


(define (count-pairs pair-list)
	(cond ((not (pair? pair-list)) (length auxilary-ds))
				((check-pair-exist? (car (list pair-list)) auxilary-ds)  (count-pairs (cdr pair-list)))
				((check-pair-exist? (cdr (list pair-list)) auxilary-ds) (count-pairs (car pair-list)))))


(define (check-pair-exist? pair auxilary-ds)
	(define new-node cons '() '())
	(cond ((null? auxilary-ds)(display pair) (set-cdr! auxilary-ds pair) false)
				 (equal? pair (car auxilary-ds) true)
				(else (check-pair-exist pair (cdr auxilary-ds)))))

 