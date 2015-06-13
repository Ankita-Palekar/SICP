(define (make-account balance secret-password)
	(let ((transaction-password '())) 
		(define (withdraw amount)
			(if (equal? transaction-password secret-password)
				(if (>= balance amount)
				(begin (set! balance (- balance amount)) balance)

				"insufficient funds")
				"Incorrect Password"))

		(define (deposit amount)
			(if (equal? transaction-password secret-password)
				((set! balance (+ balance amount))
					balance)
				"Incorrect Password"	
				))
		
		(define (dispatch m user-password)
			(set! transaction-password user-password)
				(cond ((eq? m 'withdraw) withdraw)
						((eq? m 'deposit) deposit)
						(else (error "unknown request -- MAKE - ACCOUNT" m))))
		dispatch))


9 error> (define account1 (make-account 2000 'anki))
;Value: account1

9 error> account1
;Value 14: #[compound-procedure 14 dispatch]

9 error> ((account1 'withdraw 'password) 40)
;Value 15: "Incorrect Password"

9 error> ((account1 'withdraw 'anki) 40)
;Value: 1960
