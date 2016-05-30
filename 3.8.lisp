> 
(defun showdots (lst)
  (if (null lst)
    (format t "~A)" 'NIL)
    (progn (format t "(~A . " (car lst)) 
      (showdots (cdr lst)) 
      (format t ")"  )) )
))
SHOWDOTS

> (showdots '(a b ))
(A . (B . NIL))
NIL
> (showdots '(a b c))
(A . (B . (C . NIL)))
NIL
