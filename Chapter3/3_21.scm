(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-font-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue? queue)(null? (front-ptr queue)))
(define (make-queue) (cons '() '()))

(define (front-queue queue)
	(if(empty-queue? queue)
		(error "Front called with an empty queue" queue)
		(car (front-ptr queue))))


(define (insert-queue! queue item)
	(let ((new-pair (cons item '())))
		(cond ((empty-queue? queue) (set-font-ptr! queue new-pair) (set-rear-ptr! queue new-pair) queue)
					(else (set-cdr! (rear-ptr queue) new-pair)
								(set-rear-ptr! queue new-pair)
								queue))))


(define (delete-queue! queue)
	(cond ((empty-queue? queue)
					(error "DELETE called with an empty queue" queue))
					(else (set-font-ptr! queue (cdr (front-ptr queue)))
						queue)))
 ; print function defines for the simple queue

(define (print-queue queue)
	(define q (front-ptr queue))
	(define (print-q q)
		(cond ((not (null? q)) (display (car q)) (print-q (cdr q)))))
		(print-q q))