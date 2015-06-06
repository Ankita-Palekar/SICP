(define nil '())

(define (encode message tree)
	(if (null? message)
		nil
		(append (encode-symbol (car messgae) tree) (encode (cdr message) tree))))


(define left-bit (list 0))
(define right-bit (list 1))


(define (encode-symbol x tree)
	(define (encode-symbol-1 x tree bits)
		(cond 
					((null? tree) nil)
					((leaf? tree) 
						(cond ((equal? (symbol-leaf tree) x) bits)
									(else )))
					(else (encode-symbol-1 x (left-branch tree) (append left-bit bits)))

		)))


  