(let ((max 0)) (format t "~A;;~%" max)
  (defun getmax (x)
    (if (< max x)
       (setf max x) (setf max max)))
  (defun getmaxreset ()
    (setf max 0)))
0;;
GETMAXRESET
> (getmax 16)
16
> (getmax 1)
16
> (getmaxreset)
0
> (getmax 1)
1
