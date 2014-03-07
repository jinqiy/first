(a) recursion
[92]> (defun pos+i (lst i)
(if (null lst) nil
  (progn  
    (cons (+ (car lst) i) (pos+i (cdr lst) (+ i 1)))
  )
))
POS+I
[93]> (defun pos+ (lst)
(pos+i lst 0))
POS+
[94]> (pos+ '(7 5 1 4))
(7 6 3 7)
[95]>

(b) iteration
[43]> (defun pos+ (lst)
(let ((i 0))
(setf rtn '())
(dolist (obj lst)
  (setf rtn (append rtn (list(+ obj i)))) 
  (setf i (+ i 1))
)rtn)
)
POS+
[44]> (pos+ '(1 2))
(1 3)
[45]> (pos+ '(1 2 3))
(1 3 5)
[46]> (pos+ '(7 5 1 4))
(7 6 3 7)
[47]>

(c) mapcar
[100]> (defun pos+ (lst)
(if (null lst) nil
  (cons (car lst) (pos+ (mapcar #'(lambda (x) (+ x 1)) (cdr lst))))
))
POS+
[101]> (pos+ '(7 5 1 4))
(7 6 3 7)
[102]> 
