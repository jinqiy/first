(a)
should assign lst removed nil elements to a new variable before add up
[26]> 
(defun summit (lst)
  (setf lstx (remove nil lst))
  (apply #'+ lstx))
SUMMIT
[27]> (summit '(1 2 3 nil))
6

(b)
should have the teminal statment
[43]>
(defun summit (lst)
  (let ((x (car lst)))
    (if (null (cdr lst)) 
      0 
      (if (null x)  
        (summit (cdr lst))
	    (+ x (summit (cdr lst)))))))
SUMMIT
[44]> (summit '(1 2 3 nil))
6
