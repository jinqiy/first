(a) cons  but cons is a primitive function, nothing changed here.
[12]>
(defun mcons (a b)
(cons a b)
)
MCONS
[13]> (mcons 'a '(b c))                                                                                            
(A B C)
[14]> (mcons '(a a) '(b c))                                                                                        
((A A) B C)

(b) list   also, list is a primitive function, nothing changed here.
!!not work yet
(defun mlist (para)
(if (null para) nil (progn (format t "~A" para) (cons (car para) (mlist (cdr para))))
)
)



