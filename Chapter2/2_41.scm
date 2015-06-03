(define (enumerate-interval low high)
	(if (> low high)
		nil
		(cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
	(if (null? sequence) initial	
		(op (car sequence) (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
	(accumulate append nil (map proc sq)))


(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (unique-tripples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                    (map (lambda (k) (list i j k))
                         (enumerate-interval 1 (- j 1))))
                  (enumerate-interval 2 (- i 1))))
           (enumerate-interval 1 n)))

(define (check-sum-equal? s)
  (lambda (tripple) 
    (= s (+ (car tripple) (cadr tripple) (caddr tripple)))))

(define (make-tripple-sum tripple)
  (list (car tripple) (cadr tripple) (caddr tripple)
        (+ (car tripple) (cadr tripple) (caddr tripple))))

(define (equal-sum-tripples n s)
  (map make-tripple-sum
       (filter (check-sum-equal? s)
               (unique-tripples n))))