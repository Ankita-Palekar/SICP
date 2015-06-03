(require racket/gui) ; It is helpful in the case 

(define dc (new bitmap-dc% [bitmap target]))
(define frame (new frame%
                   [label "Example"]
                   [width 500]
                   [height 500]))

(new canvas% [parent frame]
             [paint-callback
              (lambda (canvas dc)
                (send dc draw-line 0 0 60 60))])

(send frame show #t)




; right split test 


(require 2htdp/image) ; for external images and for beside and above to work 
(define painter (bitmap "rabbit.png"))
(define (right-split painter n)
    (if (= n 0)
        painter 
        (let ((smaller (right-split painter (- n 1))))
          (beside painter (above smaller smaller)))))
 
 (define (corner-split painter n)
		(if (= n 0)
			painter
		(let ((up (up-split painter (- n 1)))
			(right (right-split painter (- n 1))))
		(let ((top-left (beside up up))
			(bottom-right (above right right))
				(corner (corner-split painter (- n 1))))
			(beside (above painter top-left)
				(above bottom-right corner))))))

 (define (up-split painter n)
	(if (= n 0)
		painter
		(let ((smaller (up-split painter (- n 1))))
			(above painter (beside smaller smaller)))))