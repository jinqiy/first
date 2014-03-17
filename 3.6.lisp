(a) cons
[12]>
(defun govcons (a b)
   (if (and (not (listp a)) (not (listp b))) 
      (cons a b)
   )
)
GOVCONS
[13]> (govcons 'a 'b)
(A . B)

