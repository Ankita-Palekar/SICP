generic pocedure (=zero) to find if its given argument is zero

;;
(define (install-scheme-number-package)
 	(define (=zero? x)
 		(= x zero))
;interface to the external worls
(put '=zero? 'scheme-number =zero?))

(define (install-complex-package)
	(define (=zero-complex? x)
		(and (= (real-part x) 0) (= (imag-part x) 0)))
	(put '=zero? 'complex =zero-complex?))


(define (install-rational-package)
	(define (=zero-rational? x)
		(= (numer x) 0))
(put '=zero? 'rational =zero-rational?))


(define (=zero? x)
	(apply-generic '=zero? x))



 