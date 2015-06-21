(define (pairs s t)
	(interleave (stream-map (lambda(x) (list (stream-car s) x))
		t)
	(pairs (stream-cdr s) (stream-cdr t))))


Luis program does not work 
if we try to run pair of the (pairs integers integers) then it will show the maximum recusrion depth reached error 
interleave procedure will keep on interchanging the stram because of which sreams will be computed recusrsive inside but will never output any stream of output streams
