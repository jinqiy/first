> 
(defun showdotss (lst)
  (if (and (consp lst))
      (progn (format t "(~A . " (car lst) ) 
        (showdotss (cdr lst)) 
	(format t ")" ))
      (progn lst (format t "NIL"))
  )
)
SHOWDOTSS
> (showdotss '(a b ))
(A . (B . NIL))
NIL
> (showdotss '(a b c))
(A . (B . (C . NIL)))
NIL
