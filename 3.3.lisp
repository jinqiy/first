(defun myocurr (lstin)
  (setf lst (mklst lstin '()))
    (sortmy lst))
MYOCURR
(defun mklst (lstin lstout)
  (if (null lstin)
    'done_for_empty_lstin
    (dolist (e lstin)
       (setf lstout (n-ele e lstout))
  )) lstout)
MKLST
(defun n-ele (ele lstout)
  (if (member ele (mapcar #'(lambda(x) (car x)) lstout))
     (mapcar #'(lambda(x) 
       (if (eql (car x) ele)
         (cons  ele (+ (cdr x) 1)) x )) lstout
     )
    (setf lstout (append  (list (cons ele 1)) lstout))
))
N-ELE
(defun sortmy (lstin)
  (if (null lstin)
     'done
     (sort lstin #'(lambda (x y) (if (> (cdr x) (cdr y)) T nil)))
))
SORTMY

(myocurr '( a b a d a c d c a ))
((A . 4) (C . 2) (D . 2) (B . 1))

