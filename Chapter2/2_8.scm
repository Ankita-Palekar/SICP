; interval arithmatic

[a,b]+ [c,d] =[a+c , a+d]

[a,b] - [c,d] =[a-d,b-c]
[a,b]*[c,d]	=	[min(ac,ad,bc,bd),max(ac,ad,bc,bd)]

[a,b]
-----	=	[min(a/c,a/d,b/c,b/d), max(a/c,a/d,b/c,b/d)]
[c,d]



; according to above interval arithmatic 

(define (sub-interval x y)
	(make-interval (- (lower-bound x) (upper-bound y)) 
								 (- (upper-bound x) (lower-bound y))))


									


