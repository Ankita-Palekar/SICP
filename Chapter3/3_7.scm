(define (make-account balance secret-password)
	(let ((transaction-password '())
				(additional-pass 'protected))  ; access-pass is for the aditional features required 
		
		(define (withdraw amount)
			(if (or (eq? transaction-password secret-password) (eq? transaction-password additional-pass))
				(if (>= balance amount)
				(begin (set! balance (- balance amount)) balance)
				"insufficient funds")
				"Incorrect Password"))


		(define (balance-enquiry)
			(cond ((or (eq? transaction-password secret-password) (eq? transaction-password additional-pass)) balance)
						(else "wrong Password")))

		; (define (deposit amount)
		; 	(if (or (eq? transaction-password secret-password) (eq? transaction-password additional-pass))
		; 		((set! balance (+ balance amount))
		; 			balance)
		; 		"Incorrect Password"	 
		; 		))
 		 (define (deposit amount)
 		 	(cond ((or (eq? transaction-password secret-password) (eq? transaction-password additional-pass)) 
 		 						(set! balance (+ balance amount)))
 		 				(else "Incorrect Password")))


 		 (define (make-joint old-pass new-pass)
 		 	(cond ((eq? old-pass secret-password) (set! additional-pass new-pass) dispatch) 		 		
 		 				(else "old pasword do not match")))
   

		(define (dispatch m user-password)
			(set! transaction-password user-password)
				(cond ((eq? m 'withdraw) withdraw)
							((eq? m 'deposit) deposit)
							((eq? m 'balance-enquiry) balance-enquiry)
					 		((eq? m 'make-joint) make-joint)
							(else (error "unknown request -- MAKE -- ACCOUNT" m))))
		dispatch))


(define (make-joint-account account old-pass new-pass)
	((account 'make-joint old-pass) old-pass new-pass))



 