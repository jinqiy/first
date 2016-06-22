> (copy-list '(a b))                                                                                                
(A B)
[28]> (setf a (copy-list '(a b)))
(A B)
[29]> a
(A B)

(a) copy-list
> (defun mycopy-list (lst)
    (reduce #'append  lst :key #'list)
 )
MYCOPY-LIST

> (mycopy-list a)                                                                                                  
(A B)

(b) reverse (for list)

(defun myappend (x lst)
   (append  lst (list x))
  
)
MYAPPEND
> (reduce #'myappend  '(a b c)   :initial-value '() :from-end t)
