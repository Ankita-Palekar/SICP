(define (accumulate-n op init seqs)
	(if (null? (car seqs))
		nil 
		(cons (accumulate op init (map car seqs))
					(accumulate-n op init (map cdr seqs)))))


(define (accumulate op initial sequence)
	(if (null? sequence) initial	
		(op (car sequence) (accumulate op initial (cdr sequence)))))



Explaination : (map car seqs) gives output for the list which is composed of the squential list 


for more explaination 





 error> (define x-comp (list x1 x2 x3))
;Value: x-comp
7 error> (map car x-comp)
;Value 17: (1 3 1)
7 error> x1
;Value 18: (1 2 3 4)
7 error> x2
;Value 19: (3 4 5 6)
7 error> x3
;Value 20: (1 2 5 6)
