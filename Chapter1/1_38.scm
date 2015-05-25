; calculate e-2 using the expansion given in th problem 

1 2 1 1 4 1 1 6 1 1 8 1 1 10 1 1 12 1 1 
is  int the form of an arithmatic progression look at the 2 4 6 series and then solve 


(define (cont-frac n d k)
  (define (iter counter result)
    (if (< counter 1)
        result
        (iter (- counter 1) (/ (n counter) (+ (d counter) result)))))
  (iter k 0.0))

(define (euler-fraction k)
  (define n (lambda (i) 1.0))
  (define d (lambda (i) 
              (let ((r (remainder i 3))
                    (d (/ i 3)))
                (if (= r 2)
                    (* 2 (+ d 1))
                    1.0))))
  (+ 2 (cont-frac n d k)))
 
 

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 6)