(define (square-tree tree) (tree-map cube tree))


(define (tree-map proc tree)
	(map (lambda (sub-tree) (if (pair? sub-tree) (square-tree sub-tree) (proc sub-tree ))) tree))

