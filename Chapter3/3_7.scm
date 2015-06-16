(define (make-account balance secret-password)
	(let ((transaction-password '())
				(access-pass '()))  ; access-pass is for the aditional features required 
		(define (withdraw amount)
			(if (or (equal? transaction-password secret-password) (equal? transaction-password access-pass))
				(if (>= balance amount)
				(begin (set! balance (- balance amount)) balance)
				"insufficient funds")
				"Incorrect Password"))

		(define (balance-enquiry)
			(cond ((or (equal? transaction-password secret-password) (equal? transaction-password access-pass)) balance)
						(else "wrong Password")))

		(define (deposit amount)
			(if (or (equal? transaction-password secret-password) (equal? transaction-password access-pass))
				((set! balance (+ balance amount))
					balance)
				"Incorrect Password"	
				))
 		
 	 (define (additional-password-access a-password)
 	 			(set! access-pass a-password)
 	 			(display a-password))
  
  (define (change-password change-password)
  	(set! secret-password change-password))
		
		(define (dispatch m user-password)
			(set! transaction-password user-password)
				(cond ((eq? m 'withdraw) withdraw)
							((eq? m 'deposit) deposit)
							((eq? m 'balance-enquiry) balance-enquiry)
							((eq? m 'aditional-access) additional-password-access)
					 		((eq? m 'get-password) get-password)
					 		((eq? m 'change-password) change-password)
							(else (error "unknown request -- MAKE - ACCOUNT" m))))
		dispatch))

(define (make-joint-account account main-password joint-password)
		((account 'aditional-access main-password) joint-password))

(define (make-joint-account account main-password joint-password)
	())