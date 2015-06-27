(define (elementlookup given-key set-of-records)
	(cond ((null? set-of-records) false)
				((= given-key (car set-of-records)) true)
				((< given-key (car set-of-records))	false)
				(else (element-of-set? given-key (cdr set-of-records)))))


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
		
	(define (lookup key-1 key-2)
		(let ((subtable (assoc key-1 (cdr local-table))))
			(if subtable 
							(let ((record (assoc key-2 (cdr subtable))))
								(if record 
											(cdr record)
												false))
							false)))

(define (show-table)
	(display local-table))

	(define (insert! key-1 key-2 value)
		(let ((subtable (assoc key-1 (cdr local-table))))
			(if subtable
				(let ((record (assoc key-2 (cdr subtable)) ))
					(if record
							(set-cdr! record value)
							(set-cdr! subtable (cons (cons key-2 value) (cdr subtable)))))
					(set-cdr! local-table (cons (list key-1 (cons key-2 value))
						(cdr local-table)))))
			'ok)

	(define (dispatch m)
		(cond ((eq? m 'lookup-proc) lookup)
					((eq? m 'insert-proc!) insert!)
					((eq? m 'show-table) show-table)
					(else (error "UNKNOWN OPERATION -- TABLE" m))))
			dispatch))

(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))




; object modified in order to accomodate the values of the ordered key pair list


	(define (assoc key records)
		(cond ((null? records) false)
					((< key (caar records)) (set! cur-ptr (car records)) false)
					((> key (caar records)) (set! prev-ptr (car records))(assoc key (cdr records)) )
					; ((< key (caar records)) (set! prev-ptr (car records)) (assoc key (cdr records)))
					; ((> key (caar records))  false)
					((nearly-equal? key (caar records)) (car records))
					(else (assoc key (cdr records)))))





(define (insert! key value table)
	(set! prev-ptr (cdr table))
	(let ((record (assoc key (cdr table))))
		(cond  (record (set-cdr! record value) )
					 ((not (null? prev-ptr)) 
							(let ((new-node (cons (cons key value) '())))
											(set-cdr! cur-ptr new-node)
											(set-cdr! new-node prev-ptr)
											(set! prev-ptr nil)
											(set! cur-ptr (cons nil nil))))
						(else (set-cdr! table (cons (cons key value) (cdr table))))))
	'ok)
