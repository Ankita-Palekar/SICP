(define (miller-rabin n)
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder 
            (square 
             (trivial-test (expmod base (/ exp 2) m) m))
            m))
          (else
           (remainder (* base (expmod base (- exp 1) m))
                      m))))        
 
(define (trivial-test r m)
  (if (or (= r 1) (= r (- m 1)))
    r
      (if (= (remainder (square r) m) 1) 
        0
        r)))

(define (try-it a)
  (= (expmod a (- n 1) n) 1))
  	(try-it (+ 1 (random (- n 1)))))
