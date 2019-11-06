;;;original
(defun most (fn 1st)
  (if (null 1st)
    (values nil nil)
    (let* ((wins (car 1st))
        (max (funcall fn wins)))
      (dolist (obj (cdr 1st))
        (let ((score (funcall fn obj)))
          (when (> score max)
            (setf wins obj
              max score))))
      (values wins max))))
;;;return the two highest scoring elements of a list
(defun most2 (fn 1st)
  (if (null 1st)
    (values nil nil)
      (let* ((win1 (car 1st))
        (max1 (funcall fn win1)) (max2 nil))                                             
          (dolist (obj (cdr 1st))
            (let ((score (funcall fn obj)))
              (if (not (null max2)) (if (and (> score max1) (> score max2))
                 (progn (setf win2 win1 max2 max1) (setf win1 obj max1 score))
                 (if  (> score max2)
                   (setf win2 obj max2 score))) 
		   (if (> score max1) 
		     (progn (setf win2 win1 max2 max1)(setf win1 obj max1 score)) 
		     (setf win2 obj max2 score)))))
     (values win1 max1 win2 max2))))


> (most2 #'+ '(7 1 2 3 4 5 6))
7 ;
7 ;
6 ;
6

