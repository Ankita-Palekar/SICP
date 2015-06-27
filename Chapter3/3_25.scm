(define tolerance  0.001)
 
(define (nearly-equal? val1 val2)
	(cond ((and (number? val1) (number? val2)) (cond ((< (abs (- val1 val2)) tolerance) true)
																										(else false)))
				(else (cond ((equal? val1 val2) true)
										(else false)))))


(define (make-table)
	(let ((local-table (list '*table*)))

	(define (assoc key records)
		(cond ((null? records) false)
					((nearly-equal? key (caar records)) (car records))
					(else (assoc key (cdr records)))))
		

	(define (lookup-2d  key-1 key-2)  ; for 1 dimension should take one key and for 2 dimesion 2 keys
		(let ((subtable (assoc key-1 (cdr local-table))))
			(if subtable 
							(let ((record (assoc key-2 (cdr subtable))))
								(if record 
											(cdr record)
												false))
							false)))

(define (lookup-1d key)
	(let ((record (assoc key (cdr local-table))))
			(display record)
		(if record (cdr record)
								false)))


(define (lookup key-list)
	(let ((key-nos (length key-list)))
		(cond ((= key-nos 1) (lookup-1d (car key-list)))
					((= key-nos 2) (lookup-2d (car key-list) (cadr key-list))))))	



(define (show-table)
	(display local-table))

(define (insert-2d! key-1 key-2 value)
	(let ((subtable (assoc key-1 (cdr local-table))))
		(if subtable
			(let ((record (assoc key-2 (cdr subtable)) ))
				(if record
						(set-cdr! record value)
						(set-cdr! subtable (cons (cons key-2 value) (cdr subtable)))))
				(set-cdr! local-table (cons (list key-1 (cons key-2 value))
					(cdr local-table)))))
		'ok)



(define (insert-1d! key value)
	(let ((record (assoc key (cdr local-table))))
		(if record 
							(set-cdr! record value)
							(set-cdr! local-table (cons (cons key value) (cdr local-table)))))
	'ok)

(define (insert! key-list value)
	(let ((key-nos (length key-list)))
	(cond ((= key-nos 1) (insert-1d! (car key-list) value))
				((= key-nos 2) (insert-2d! (car key-list) (cadr key-list) value)))))

	(define (dispatch m)
		(cond ((eq? m 'lookup-proc) lookup)
					((eq? m 'insert-proc!) insert!)
					((eq? m 'show-table) show-table)
					(else (error "UNKNOWN OPERATION -- TABLE" m))))
			dispatch))

(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))




