(defun myunik (lst)
(if(consp lst)
(if(member (car lst) (cdr lst)) (myunik(cdr lst))
(append (list(car lst)) (myunik (cdr lst)))
)))


(defun mycnt (lst key)
(if(null lst) 0
(if(eql  key (car lst)) (+ 1 (mycnt (cdr lst) key)) 
(mycnt (cdr lst) key))))

(defun myoc(lst)
(if (consp lst) (progn 
(setf uniklst (myunik lst)) 
(let (( x nil))
(dolist (obj uniklst)
(setf x (append x (cons (cons obj (mycnt lst obj)) '()))) ) x))
))

(defun mymax (lst x)
(if (> (length lst) 1)
(if (> (car lst) (car (cdr lst))) 
(mymax (cdr lst) (car lst))
(mymax (cdr lst) (car (cdr lst)))
)x))


(defun mymaxa (lst x)
   (if (> (length lst) 1)  
        (if (not (consp x ))  
	       (progn (setf x (car lst)) (mymaxa lst x))  
	              (if (> (cdr x) (cdr (car (cdr lst)))) 
		               (mymaxa (cdr lst) x)
			                (progn (setf x (car (cdr lst))) (mymaxa (cdr lst) x))
		      )
	)   
       x   
   )   
)



(defun myocsort (lst x)
(if (> (length lst) 1)
(progn (setf d (mymaxa lst 0))                                
(setf lst (remove d lst))  (setf x (append x (cons d '())))  (myocsort lst x)  ) (append x lst)  
) )

;test
(myocsort (myoc '(a b a c a d a b c e)) '())
((A . 4) (C . 2) (B . 2) (E . 1) (D . 1))

(defun occurrences (lst)
(myocsort lst nil)
)

;test
(occurrences (myoc '(a b a c a d a b c e c)))
((A . 4) (C . 3) (B . 2) (E . 1) (D . 1))

