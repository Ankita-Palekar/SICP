(define (elementlookup given-key set-of-records)
	(cond ((null? set-of-records) false)
				((= given-key (car set-of-records)) true)
				((< given-key (key (car set-of-records)))	false)
				(else (element-of-set? given-key (cdr set-of-records)))))
