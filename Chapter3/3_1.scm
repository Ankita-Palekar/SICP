(define (make-accumulator ammount)
	(define (dispatch accumulation)
		(set! ammount (+ ammount accumulation))
		ammount)
	dispatch)



Explaination : This functions are generic they should be abble to accumulate anything for eg 2 lists or lists of lists , trees etc