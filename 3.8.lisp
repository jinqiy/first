[32]> 
(defun showdotss (lst)
  (if (and (consp lst))
      (progn (format t "(~A . " (car lst) ) 
        (showdotss (cdr lst)) 
	(format t ")" ))
      (progn lst (format t "NIL"))
  )
)
SHOWDOTSS
[33]> (showdotss '(a b ))
(A . (B . NIL))
NIL
[34]> (showdotss '(a b c))
(A . (B . (C . NIL)))
NIL
