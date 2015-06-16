; It is called as the church numerals and is one of the most useful one we can literally show numebrs in terms of proedures itself 
 
; Church Numeral is the form which represents data in the form of lambda clculus and it can be used with any function anywhere


(define zero (lambda (x) (lambda (x) x)))

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))

 (define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))


(define a one)
(define b two)

;numeral application 
((a f) x)  ;function should be executed this way


((b (lambda (x)
      (external-func x)
      x)) 2)

(define (external-func x)( display (* x x x)))


(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))

(define three (add one two))


((three (lambda (x) (external-func x) x)) 3)



 