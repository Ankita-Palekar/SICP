
;processing answers 

(define interval1 (make-interval 3 4))
(define point-center (center interval1))
(define tolerance (per-tolerane 10 interval1))

(make-center-percentage point-center tolerance)
	;Value 12: (63/20 . 77/20)

(define tolerance (per-tolerane 0.05 interval1))
	(make-center-percentage point-center tolerance)
	;Value 13: (3.49825 . 3.50175)

(define tolerance (per-tolerane 0.005 interval1))
	(make-center-percentage point-center tolerance)
	;Value 14: (3.499825 . 3.500175)

(define tolerance (per-tolerane 0.00005 interval1))
	(make-center-percentage point-center tolerance)
	;Value 15: (3.49999825 . 3.50000175)

(define tolerance (per-tolerane 0.0000005 interval1))	
	(make-center-percentage point-center tolerance)
	;Value 16: (3.4999999825 . 3.5000000175)



; It is seen that for small value of percentages vcalue almost remains the same

 
 