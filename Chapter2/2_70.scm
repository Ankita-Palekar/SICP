
(define song-char (list (list 'A 2) (list 'BOOM 1) (list 'GET 2) (list 'JOB 2) (list 'NA 16) (list 'SHA 16) (list 'YIP 9) (list 'WAH 1)))


===> song tree generated usfing generate-huffman-tree

22 error> (define song-tree (generate-huffman-tree song-char))
;Value: song-tree

22 error> song-tree
Value 52: (((((leaf job 2) (leaf get 2) (job get) 4) ((leaf a 2) ((leaf wah 1) (leaf boom 1) (wah boom) 2) (a wah boom) 4) (job get a wah boom) 8) (leaf yip 9) (job get a wah boom yip) 17) ((leaf sha 16) (leaf na 16) (sha na) 32) (job get a wah boom yip sha na) 49)

22 error>  (encode message1 song-tree)
;Value 53: (0 0 0 1 0 0 1 0 0 0 0 0)

22 error> message1
;Value 49: (get a job)


24 error> message2
;Value 54: (sha na na na na na na na na)

24 error> (encode message2 song-tree)
;Value 55: (1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)


24 error> message3
;Value 60: (get a job sha na na na na na na na na get a job sha na na na na na na na na wah yip yip yip yip yip yip yip yip yip sha boom)

24 error> (encode message3 song-tree)
;Value 61: (0 0 0 1 0 0 1 0 0 0 0 0 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 1 0 0 1 0 0 0 0 0 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 1 1 0 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 0 0 0 1 1 1)

25 error> (encode-symbol 'job song-tree)
;Value 62: (0 0 0 0)
 
26 error> (encode-symbol 'get song-tree)
;Value 64: (0 0 0 1)

26 error> (encode-symbol 'a song-tree)
;Value 65: (0 0 1 0)

26 error> (encode-symbol 'wah song-tree)
;Value 66: (0 0 1 1 0)

26 error> (encode-symbol 'boom song-tree)
;Value 67: (0 0 1 1 1)

26 error> (encode-symbol 'yip song-tree)
;Value 68: (0 1)

26 error> (encode-symbol 'sha song-tree)
;Value 69: (1 0)

26 error> (encode-symbol 'na song-tree)
;Value 70: (1 1)

Explaination : Number of bits required for the encoding the song is 90 bits

if we used fixed length code then encoding will take (n * (fixed-length-code))

n-> the words in the lyrics of song 


; below are all required procedures fror the current program 

============================================== required  pairs ======================================
(define (make-leaf symbol weight)
	(list 'leaf symbol weight))

(define (leaf? object)
	(eq? (car object) 'leaf))

(define (symbol-leaf x)
	(cadr x))

(define (weight-leaf x)
	(caddr x))

(define (make-code-tree left right)
	(list left right (append (symbols left)(symbols right)) (+ (weight left) (weight right))))

(define (left-branch tree)
	(car tree))

(define (right-branch tree)
	(cadr tree))

(define (symbols tree)
	(if (leaf? tree) 
		(list (symbol-leaf tree))
		(caddr tree)))

(define (weight tree)
	(if (leaf? tree)
		(weight-leaf tree)
		(cadddr tree)))
(define nil '())

(define (decode bits tree)
	(define (decode-1 bits current-branch)
		(if (null? bits)
			nil
			(let ((next-branch (choose-branch (car bits) current-branch)))
				(if (leaf? next-branch)
					(cons (symbol-leaf next-branch)
							(decode-1 (cdr bits) tree))	
						(decode-1 (cdr bits) next-branch)))))
						(decode-1 bits tree))


(define (choose-branch bit branch)
	(cond ((= bit 0)	(left-branch branch))
				((= bit 1)	(right-branch branch))
				(else (error "bad bit--- CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
	(cond ((null? set) (list x))
				((< (weight x) (weight (car set))) (cons x set))
				(else (cons (car set) (adjoin-set x (cdr set))))))


(define (make-leaf-set pairs)
	(if (null? pairs)
			nil
			(let ((pair (car pairs)))
				(adjoin-set (make-leaf (car pair) (cadr pair))
					(make-leaf-set (cdr pairs))))))

===============================================2.68=================================================

(define nil '())

(define (encode message tree)
	(if (null? message)
		nil
		(append (encode-symbol (car message) tree) (encode (cdr message) tree))))

	 

	(define (encode-symbol x tree)
		(define (encode-symbol-1 x tree bits)
			(if(check-if-symbol-exist? x (symbols tree))
					(let ((left-branch-elements (symbols (left-branch tree)))
							(right-branch-elements (symbols (right-branch tree)))
							(left-branch-tree (left-branch tree))
							(right-branch-tree (right-branch tree)))
							(cond ((check-if-symbol-exist? x left-branch-elements)
											(cond ((leaf? left-branch-tree)  (append bits (list 0)))
														(else  (append (list 0) (encode-symbol-1 x left-branch-tree bits)) )))
											((check-if-symbol-exist? x right-branch-elements)
												(cond ((leaf? right-branch-tree) (append bits (list 1)))
															(else (append (list 1) (encode-symbol-1 x right-branch-tree bits)))))))
					(error "This symbol does not exist " x)))
		(encode-symbol-1 x tree '()))

 

(define (check-if-symbol-exist? x symbol-set)
	(cond ((null? symbol-set) false)
				((equal? x (car symbol-set)) true)
				(else  (check-if-symbol-exist? x (cdr symbol-set)))
				))





==============================================2.69==================================================
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
					(let ((left (car leaf-node-list))
						(right (cadr leaf-node-list)))
							(successive-merge (adjoin-set (make-code-tree left right) (cddr leaf-node-list)))))
					((null? leaf-node-list) '())
					(else (car leaf-node-list))))
