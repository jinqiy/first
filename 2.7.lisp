[35]> (defun xx (lst) (if (null lst) nil (if (listp (car lst)) t (xx (cdr lst)))))
XX
[36]> (xx '(1 2 3))
NIL
[37]> (xx '(1 2 3 (4 5)))
T
[38]> (xx '((6 7) 1 2 3 (4 5)))
T
[39]> (xx '( 1 (2 8) 3 (4 5)))
T
[40]> (xx '( 1 (2) 3 (4 5)))
T