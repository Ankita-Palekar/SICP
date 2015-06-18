(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))

; ; force is an internal procedure

(define (force delayed-objects)
	(delayed-objects))


(define (memo-proc proc)
	(let ((already-run? false) (result false))
		(lambda()
						(if (not already-run?)
								(begin (set! result (proc)) (set! already-run? true) result)
								result))))

(define (stream-map proc . argstreams)
	(if (stream-null? (car argstreams))
		the-empty-stream
		(cons-stream (apply proc (map stream-car argstreams))
			(apply stream-map (cons proc (map stream-cdr argstreams))))))
