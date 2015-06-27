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


1 ]=> (put 'decimal1 4.0 30.35)
;Value: ok
1 ]=> (display-table)
(*table* (decimal1 (4. . 30.35)))
1 ]=> (put 'decimal1 4.0000001 40.35) ; note the vale it changes the key value pair since the point-keys are nearly equal 
;Value: ok
1 ]=> (display-table)

1 ]=> (display-table)
(*table* (decimal2 (4.0000001 . 40.35)) (decimal1 (4. . 40.35)))
