(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-font-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))
(define set-prev-rear-ptr! '())

(define (empty-dqueue? queue)(null? (front-ptr queue)))
(define (make-dqueue) (cons '() '()))

(define (front-dqueue queue)
	(if(empty-dqueue? queue)
		(error "Front called with an empty queue" queue)
		(car (front-ptr queue))))

(define (rear-dqueue queue)
	(if(empty-dqueue? queue)
		(error "Rear Called with an empty queue" queue)
		(rear-ptr queue)))


(define (rear-insert-dqueue! queue item)
	(let ((new-pair (cons item '())))
		(cond ((empty-dqueue? queue)  (set-font-ptr! queue new-pair) (set-rear-ptr! queue new-pair) queue)
					(else (set-cdr! (rear-ptr queue) new-pair)
								(set-rear-ptr! queue new-pair)
								queue))))



(define (front-insert-dqueue! queue item)
	(let ((new-pair (cons item '())))
		(cond ((empty-dqueue? queue)  (set-font-ptr! queue new-pair) (set-rear-ptr! queue new-pair) queue)
					(else (set-cdr! new-pair (front-ptr queue))
								(set-font-ptr! queue new-pair)
								; (set-cdr! (rear-ptr queue) new-pair)
								; (set-rear-ptr! queue new-pair)
								queue))))


(define (front-delete-dqueue! queue)
	(cond ((empty-dqueue? queue)
					(error "DELETE called with an empty queue" queue))
					(else (set-font-ptr! queue (cdr (front-ptr queue)))
						queue)))

(define (rear-delete-dqueue! queue)
	(cond ((empty-dqueue? queue)
					(error "DELETE called with an empty queue" queue))
					(else  (set-rear-ptr! queue (last-pair (but-last (front-ptr queue)))) (display (rear-ptr queue))
						queue)))


 ; print function defines for the simple queue

(define (print-dqueue queue)
	(define q (front-ptr queue))
	(define (print-q q)
		(cond ((not (null? q)) (display (car q)) (display "  ") (print-q (cdr q)))))
		(print-q q))


(define (but-last x)
	(reverse (cdr (reverse x))))