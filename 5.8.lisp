> 
(setf vec (vector 1 2 3 4 5 6))
#(1 2 3 4 5 6)
> vec
#(1 2 3 4 5 6)

> 
(defun maxmin (v vmax vmin pos)
   (if (> pos (- (length v) 1))
       (values vmax vmin)
       (let ((vc (svref v pos)))
          (if (> vc vmax)
             (setf vmax vc))
          (if (< vc vmin)
             (setf vmin vc))
          (maxmin v vmax vmin (+ pos 1)))))
MAXMIN
> 
(defun maxminv (v)
  (maxmin v (svref v 0) (svref v 0) 0))
MAXMINV
> (maxminv vec )
6 ;
1
> (maxminv vec1 )
10 ;
2


