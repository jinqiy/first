> (setf sqarr #2a((a b) (c d)))                                                                                     
#2A((A B) (C D))
> (aref sqarr 0 0)
A
> (aref sqarr 0 1)
B
> (setf sqar3 #2a((1 2 3) (4 5 6)(7 8 9))) 
#2A((1 2 3) (4 5 6) (7 8 9))

> 
(defun quarter-turn (q)
  (setf dim (- (car (array-dimensions q)) 1))
    (setf r (make-array (array-dimensions q) :initial-element nil))
      (let ((i 0) (j dim))
         (do ((i 0 (+ i 1)))
             ((> i dim) 'done)
             (do ((j dim (- j 1))) ((< j 0) 'donej) (setf (aref r i (- dim j)) (aref q j i))     
))))r)
QUARTER-TURN

> (quarter-turn sqarr)
#2A((C A) (D B))
> (quarter-turn sqar3)
#2A((7 4 1) (8 5 2) (9 6 3))

