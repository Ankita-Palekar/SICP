;note: for diagram please refer the solved exercise on the notebook

(define (or-gate a1 a2 output)
	)


; nand is the construction of and & not using nand we will create or logic
(define (nand-gate a1 a2 output)
	(let ((op1 (make-wire)))
		(and-gate a1 a2 op1)
		(inverter op1 output)
		'ok))


(define (or-gate a1 a2 output)
	(let ((op1 (make-wire))
				(op2 (make-wire)))
		(nand-gate a1 a1 op1)
		(nand-gate a2 a2 op2)
		(nand op1 op2 output)
		'ok))

delay-added : 3 * (invert-delay + and-delay)
for each nand gate delay will be (invert-delay + and-delay)


				 


