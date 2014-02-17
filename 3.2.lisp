[67]> 
(defun my-append (lst x)
  (if (not (member x lst))
    (append lst (list x))
    lst)
)
 MY-APPEND
[68]> 
(defun new-union (lsta lstb)
  (let ((len (length lstb)))
    (dolist (obj lstb)  
      (setf lsta (my-append lsta obj))
    )
  lsta)
)
NEW-UNION
[69]> (new-union '(a b c) '(d a b))
(A B C D)
[70]> (new-union '(a b c) '(b a d))
(A B C D)

