(define (generate-huffman-tree pairs )
	(successive-merge (make-leaf-set pairs)))

(define (make-leaf-set pairs)
	(if (null? pairs)
		'()
		(let ((pair (car pairs)))
		(adjoin-set (make-leaf (car pair)
 			(cadr pair)) 
			(make-leaf-set (cdr pairs))))))


(define (adjoin-set x set)
	(cond ((null? set) (list x))
		((< (weight x) (weight (car set))) (cons x set))
			(else (cons (car set)
				(adjoin-set x (cdr set))))))

(define (make-code-tree left right)
	(list left
		right
		(append (symbols left) (symbols right))
			(+ (weight left) (weight right))))

(define (successive-merge leaf-node-list)
	(cond ((>= (length leaf-node-list) 2)
					(display (length leaf-node-list))
					(let ((left (car leaf-node-list))
						(right (cadr leaf-node-list)))
							(append (successive-merge (adjoin-set (make-code-tree left right) (cddr leaf-node-list))))) )
					((null?leaf-node-list) '())
					(else leaf-node-list)))

; (define (successive-merge leaf-node-list)
; 	(define (successive-merge-iter leaf-node-list result)
; 		(cond ((>= (length leaf-node-list) 2)
; 					(let ((left (car leaf-node-list))
; 						(right (cadr leaf-node-list)))
; 								(successive-merge-iter (adjoin-set (make-code-tree left right) (cddr leaf-node-list)) )
; 							(append (successive-merge (adjoin-set (make-code-tree left right) (cddr leaf-node-list))))) )
; 					((null?leaf-node-list) '())
; 					(else ))))