
(define (ripple-carry-adder A B S C)
	(let ((lengthA (length A))
				(lengthB (length B)))
	(if (not (= lengthA lengthB))
			(error "strings nto of eqaul length")
			(ripple-adder A B S C)))

	(define (ripple-adder A B S C)
		(let  ((cin (make-wire)))
			(set! cin c)
			(cond ((or (null? A) (null? b)) s)
					(else (half-adder (car A) (car B) cin s c-out)
								(ripple-adder (cdr A) (cdr B) s c-out)
							)))))

delay for full adder
2 * (2 * and-gate-dealy + or-gate-dealy + inverter-delay) + (or-gate-dealy)


delay for the ripple adder will be dependent on the lenght of the list provided as the addend and adder 
if length of the list provided is k then the delay will be 


k*(2 * (2 * and-gate-dealy + or-gate-dealy + inverter-delay) + (or-gate-dealy))

