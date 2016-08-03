(setf a '(a b c d))
(A B C D)
;;;iterative
> 
(defun intersperse (o a)
  (let ((p nil))
    (dotimes (pos (length a))
      (let ((c (nth pos a)))
          (if (< pos (- (length a) 1))
	    (setf p (append p (list c o))) 
	    (setf p (append p (list c))))))p))             
INTERSPERSE
> 
(intersperse '- a)
(A - B - C - D)


;;;recursive
[51]> 
(defun intersperse-r (o a p)
  (if (null a) 
     p 
     (progn 
       (if (> (length a) 1) 
         (setf p (append p (list (car a) o)))
         (setf p (append p (list (car a))))) 
     (intersperse-r o (cdr a) p))))
INTERSPERSE-R
> 
(intersperse-r '- a nil)
(A - B - C - D)
> 
(defun intersperse (o a)
  (intersperse-r '- a nil))                                                                                         
INTERSPERSE
> (intersperse '- a )
(A - B - C - D)


