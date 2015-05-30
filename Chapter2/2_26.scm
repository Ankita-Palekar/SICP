23 error> (define x (list 1 2 3 4))

;Value: x

23 error> (define y (list 4 5 6))

;Value: y

23 error> (append x y)

;Value 37: (1 2 3 4 4 5 6)

23 error> (cons x y)

;Value 38: ((1 2 3 4) 4 5 6)

23 error> (list x y)

;Value 39: ((1 2 3 4) (4 5 6))