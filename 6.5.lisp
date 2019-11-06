;;;orignal
(remove-if predicate proseq &key key from-end start end count)
> (remove-if #'evenp '(1 2 3 4 5))                                                                                  
(1 3 5)

;;;no keywords remove-if
(defun myremove-if (fn lst)
  (let ((acc nil))
    (dolist (x lst)
       (let ((val (funcall fn x)))
         (if (not val) (push x acc))))
    (nreverse acc)))
MYREMOVE-IF
> (myremove-if #'evenp '(1 2 3 4 5))
(1 3 5)
