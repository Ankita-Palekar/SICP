


define (sum-square-largest-3 a b c)
( if and (>= a b) (>= a c) (define largest a (if (>= b c) (define second_largest b) (define second_largest c))))
( if and (>= b a) (>= b c) (define largest b (if (>= a c) (define second_largest a) (define second_largest c))))
( if and (>= c a) (>= c b) (define largest c (if (>= a b) (define second_largest a) (define second_largest b))))
return (+ square(largest) + square(second_largest))


