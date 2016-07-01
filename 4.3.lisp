(defstruct (node (:print-function
                 (lambda (n s d)
                   (format s "#<~A>" (node-elt n)))))
elt (c1 nil) (c2 nil) (c3 nil))
NODE
(setf p1 (make-node :elt 1 :c1 nil :c2 nil :c3 nil))
#<1>

;;;copy tree
(defun my-copy-tree (tr)
  (when tr 
    (make-node 
      :c1 (my-copy-tree (node-c1 tr))
      :c2 (my-copy-tree (node-c2 tr))
      :c3  (my-copy-tree (node-c3 tr))
      :elt  (node-elt tr))))
MY-COPY-TREE

> (setf np (my-copy-tree p))
#<1>
> (eql p np)
NIL
> (eql (node-c1 p) (node-c1 np))
NIL

;;;sub tree
(defun my-sub-tree (obj tr)
  (when tr (or (eql obj tr)
     (my-sub-tree obj (node-c1 tr))
     (my-sub-tree obj (node-c2 tr))
     (my-sub-tree obj (node-c3 tr))
)))
MY-SUB-TREE
>(my-sub-tree p1 p)
DONE

