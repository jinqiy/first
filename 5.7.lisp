> (setf a '(1 2 3 4 5 6))
(1 2 3 4 5 6)
> (setf b '(6 5 4 3 2 1))                                                                                           
(6 5 4 3 2 1)

;recursion
> 
(defun diff1 (x prev)
  (if (< (length x) 1)
      'DONE
      (if (or (= prev (+ (car x) 1))(= prev (- (car x) 1)))
         (diff1 (cdr x) (car x))
         nil)))
 DIFF1
 > 
 (defun diff (x)
   (diff1 (cdr x) (car x))
   )
DIFF

> (diff a)
T
> (diff b)
T
> (diff '(1 3))                                                                                                     
NIL

;do
> (defun diff2 (x)
  (catch 'abort 
    (let ((prev (car x))) 
      (dolist (obj (cdr x))
       (if (or (= prev (+ obj 1)) (= prev (- obj 1)))  
         (setf prev obj)
            (throw 'abort nil))) t )))
DIFF2
> (diff2 a)
T
> (diff2 b)
T
> (diff2 '(1 3))
NIL


;mapc and return
> 
(defun diff3 (x)
  (let ((prev (car x)) 
        (o (cdr x))) 
       (mapc #'(lambda (ele) 
               (if (or (= prev (+ ele 1)) (= prev (- ele 1))) 
	          (setf prev ele) 
		  (return-from diff3 nil)))))  
  (return-from diff3 t))
DIFF3
> 
(diff3 a)
T
> (diff3 b)
T
> (diff3 '(1 3))
NIL

