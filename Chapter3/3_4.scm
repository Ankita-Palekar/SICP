	(define (make-account balance secret-password)
		
		;local variables defined	
	(let 	((wrong-password-count 0)
					(transaction-password '()))

		(define (withdraw amount)
			(if(equal? transaction-password secret-password)
				(if(>= balance amount)
					(begin (set! balance (- balance amount)) balance)
						"insufficient funds")
				(cond ((> wrong-password-count 7) (display "call police"))
							(else (set! wrong-password-count (inc wrong-password-count)) "incorrect password"))))

		(define (deposit amount)
			(if (equal? transaction-password secret-password)
				((set! balance (+ balance amount))
					balance)
				(if(> wrong-password-count 7)
								(dispaly "call the police")
							(set! wrong-password-count (inc wrong-password-count)))))
		
		(define (dispatch m user-password)
			(set! transaction-password user-password)
				(cond ((eq? m 'withdraw) withdraw)
						((eq? m 'deposit) deposit)
						(else (error "unknown request -- MAKE - ACCOUNT" m))))
		dispatch)
		)

