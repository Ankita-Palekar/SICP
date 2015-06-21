(define (log-sumands n)
	(cons-stream (/ 1.0 n) (stream-map - (log-sumands (+ n 1)))))


(define ln2-stream (partial-sum (log-sumands 1)))