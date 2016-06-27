'''Description of reduce
(reduce function proseq &key key from-end start end initial-value) Function
If the function is/and the elements of proseq are a, b, c, then the behavior of
reduce is indicated by the following table:
 from-end initial-value   EQUIVALENT TO
 false    no             (f (f a b) c)
 false    yes            (f (f (f initial-value a) b) c)
 true     no             (f a(f b c))
 true     yes            (f a (f b (f c initial-value)))
 
If proseq contains just one element and no initial-value is provided, that element
is returned. If proseq is empty and an initial-value is provided, it is returned, but
if no initial-value is provided, the return value is the result of calling function
with no arguments. If both key and initial-value are provided, the former is not
called on the latter.

The key function is applied exactly once to each element of sequence in the order 
implied by the reduction order but not to the value of initial-value, if supplied.

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
   (append  lst  x)
)
MYAPPEND
>(defun myreverse (lst)                                                                                            
 (reduce #'myappend  lst :key #'list))
MYREVERSE
