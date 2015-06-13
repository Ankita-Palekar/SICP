(define (make-account balance secret-password)
	(let ((transaction-password '())) 
		(define (withdraw amount)
			(if (equal? transaction-password secret-password)
				(if (>= balance amount)
				(begin (set! balance (- balance amount)) balance)
				"insufficient funds")
				"Incorrect Password"))

		(define (balance-enquiry)
			(cond ((equal? transaction-password secret-password) balance)
						(else p)))

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
							((eq? m 'balance-enquiry) balance-enquiry)
							(else (error "unknown request -- MAKE - ACCOUNT" m))))
		dispatch))


(define (make-joint-account account main-password joint-password)
		(account main-password joint-password))
