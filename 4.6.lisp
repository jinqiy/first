> (setf ht (make-hash-table))

> (setf (gethash 'color ht) 'red)
RED
>(setf (gethash 'shape ht) 'spherical
      (gethash 'size ht) 'giant)
GIANT
> (maphash #'(lambda (k v)
                   (format t "~A = ~A~%" k v)) ht)
SIZE = GIANT
SHAPE = SPHERICAL
COLOR = RED
NIL

> (setf ass-m '((size . "giant")))
((SIZE . "giant"))
> (assoc 'size ass-m)
(SIZE . "giant")

;;;find hash from assoc-list
(defun hashfind (ass ht)    
   (setf key (car (car ass)))
   (setf val (cdr (assoc key ass)))
   (setf ha (car (list (gethash key ht))))
   (if (eql val ha)
       (gethash key ht)
       'nil))
HASHFIND

> (hashfind ass-m ht)
GIANT ;
T


> (setf ass-m '((size . giant) (shape . spherical) (color . red)))
((SIZE . GIANT) (SHAPE . SPHERICAL) (COLOR . RED))
;;;get hash talbe from assoc-list
(defun ass2hash (ass)                                                                                           
  (setf ht (make-hash-table)) 
  (dolist (obj ass)
     (setf (gethash (car obj) ht) (cdr obj))
  )ht)
ASS2HASH
;;;get assoc-list from hash table
(defun hash2ass (ht)
  (setf ass '())
  (maphash #'(lambda (k v)
    (setf ass (append ass (list (cons k v))))) ht)
  ass)
HASH2ASS
> (hash2ass ht)
((SIZE . GIANT) (SHAPE . SPHERICAL) (COLOR . RED))


