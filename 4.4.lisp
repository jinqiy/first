;;;travel bst from greatest
(defstruct (node (:print-function 
                 (lambda (n s d)
                   (format s "#<~A>" (node-elt n)))))
  elt (l nil)(r nil))
NODE

(defun bst-insert (obj bst <)
  (if (null bst)
     (make-node :elt obj)
        (let ((elt (node-elt bst)))
          (if (eql obj elt)
            bst
            (if (funcall < obj elt)
              (make-node :elt elt :l (bst-insert obj (node-l bst) <) :r (node-r bst))
              (make-node :elt elt :r (bst-insert obj (node-r bst) <) :l (node-l bst)))))))
BST-INSERT
;;;make a bst 
(setf nums nil)
(dolist (x '(5 8 4 2 1 9 6 7 3))
   (setf nums (bst-insert x nums #'<)))

(defun bst-traverse (fn bst)
  (when bst
       (bst-traverse fn (node-r bst))
       (funcall fn (node-elt bst))
       (bst-traverse fn (node-l bst))))
BST-TRAVERSE

> (bst-traverse #'princ nums)                                                                                       
987654321
NIL

