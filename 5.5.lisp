> (setf a "abracadabra")
"abracadabra"

;;;iterative
> 
(defun precedes (o x)
  (let ((prev 'done) 
        (p nil ))
       (dotimes (pos (length x))
          (let ((c (char x pos))) 
               (if (and (> pos 0) (equal c  o))
	         (progn
		    (if (or (null p) 
		         (and (not (null p)) (not (member prev p)))) 
			 (setf p (append p (list prev)))))
		 (setf prev c)))) p ))
PRECEDES
> (precedes #\a a)
(#\r #\c #\d)

;;;recursive
(defun precedes-r (o x prev p)
  (if (< (length x) 1)
     p
     (let ((c (char x 0)))
       (if (and (not (null prev)) (equal c o))
         (if (not (member prev p)) 
	   (setf p (append p (list prev))))
         (setf prev c))
       (precedes-r o (subseq x 1) prev p))))

PRECEDES-R
> 
(precedes-r #\a a nil nil)
(#\r #\c #\d)

