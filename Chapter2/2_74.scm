Explaination : Since Each division retrieves the data in their own way we need to pass the same number of arguments to the internal procedure 

and in this case get-record, get-salary, find-employee-record will be the operators where as  divisions will be the type 

tabular form 


										=	div1 											div2 												div3
================================================================================================
get-record					=	get-record-div1 					get-record-div2							get-record-div3
get-salary 					=	get-salary-div1 					get-salary-div2 						get-salary-div3 		
find-employee-record=	find-employee-record-div1 find-employee-record-div2 	find-employee-record-div3
personal-file				=	personal-file-div1				personal-file-div2					personal-file-div3

Get record in the simpler way 


(define (get-record emp-name personal-file)
	(define (get-record-iter div emp-name personal-file)
		(if(null? div)
				(display "Record does not exist")
			(let ((record (get 'get-record div)))
				(if(record)
					record
				(get-record-iter (get-next-div) emp-name personal-file))
				))
		(get-record-iter start-div emp-name personal-file)))


 (define (get-salary emp-record)
 	(define (get-salary-iter div emp-record)
		(if(null? div)
				(display "Specified Record does not exist in the db")
				(let ((file (get 'personal-file div)))
					(if(file-contains-record?)
						(salary record)
					(get-salary-iter (get-next-div) emp-record))
					))
		(get-record-iter start-div emp-record)))


 (define (find-employee-record emp-name)
 	(define (get-emp-iter div emp-name)
		(if (null? div)
			(display "record not found")
			(let ((emp-name (get 'find-employee-emp-name div)))
				(if (emp-name)
					(display "record found")
					(get-emp-iter (get-next-div) emp-name))))))



; Below given is the sample for the divison-1 procedure will be similar for the other divisions too

 (define (install-package-div-1)
 	(define (get-record emp-name personal-file)
 		(lookup emp-name personal-file) ; using the look up procedure used earlier to find the record depending upon the key
 		)


 	(define (find-employee-record emp-name)
 		(define (find-employee-record-iter personal-file emp-name)
 				(if(null? personal-file)
 					fasle
 					(let record (get-record emp-name personal-file))
 						(if (record)
 							record
 							(find-employee-record-iter (get-next-file) emp-name))))
 		(find-employee-record-iter start-file emp-name))

 	(define (get-name-from-record record)
 		(return name))

 		(define (lookup key record)
 			(body -> defines as per the division)))