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

 
 (define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

 
(define (unique-tripples-sum n s)
    (define (get-tripple-sum s tripple)
      (if(null? tripple)
          nil
        (
        let ((term (car tripple)))
        (cond ((= s (+ (car term) (cadr term) (caddr term))) (append (list term) (list s)))
              (else (get-tripple-sum s (cdr tripple)))) )))
    (get-tripple-sum s (unique-tripples n)))



(unique-tripples-sum  5 12)
;Value 87: ((5 4 3) 12)

(unique-tripples  5 )
;Value 88: ((3 2 1) (4 2 1) (4 3 1) (4 3 2) (5 2 1) (5 3 1) (5 3 2) (5 4 1) (5 4 2) (5 4 3))