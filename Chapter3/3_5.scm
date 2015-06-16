 (define (monte-carlo trials experiment)
	(define (iter trials-remainning trials-passed)
		(cond ((= trials-remainning 0)(/ trials-passed trials))
					(experiment  (iter (- trials-remainning 1) (+ trials-passed 1)))
					(else (display experiment) (iter (- trials-remainning 1) trials-passed))))
	(iter trials 0))


(define (estimate-integral p x1 x2 y1 y2 trials)
	(let ((fractions  (monte-carlo trials (p (random-in-range x1 x2) (random-in-range y1 y2))))
				(rectangle-area (area-co-ordinate-ractangle x1 x2 y1 y2)))
			(* fractions rectangle-area)))
	
(define (random-in-range low high )	
	(let ((range (- high low)))
		(+ low (random range))))

; x1 x2 y1 y2 are same upper and lower bouds given on top 

(define (area-co-ordinate-ractangle x1 x2 y1 y2)
	(* (- x2 x1) (- y2 y1)))

;predicate p defined will return an funciton which will test if the value of the eqautions are true or false using the random values of x and y

(define (predicate origin-x origin-y radius)
	(lambda(x y)
		(if(<= (+ (square (- x origin-x)) (square (- y origin-y))) (square radius))
				true
				false)))
 

; (define (predicate origin-x origin-y radius x1 x2 y1 y2)
; 	(let (( f (lambda(x y)
; 							(if(<= (+ (square (- x origin-x)) (square (- y origin-y))) (square radius))
; 							true
; 							false)))) 
; 		(f (random-in-range x1 x2) (random-in-range y1 y2)))) 
 