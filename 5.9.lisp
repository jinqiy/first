;;;a)
> (setf min '((a b c) (b c) (c d)))
((A B C) (B C) (C D))

> (defun shortest-path (start end net)
    (bfs end (list (list start)) net))
SHORTEST-PATH
> (defun bfs (end queue net)
  (catch 'abort 
    (if (null queue)
      nil
      (let ((path (car queue)))
      (let ((node (car path)))
        (if (eql node end)
           (throw 'abort (reverse path))
           (bfs end
             (append (cdr queue)
             (new-paths path node net))
             net)))))))
BFS
>(defun new-paths (path node net)
    (mapcar #'(lambda (n)
      (cons n path))
      (cdr (assoc node net))))
NEW-PATHS

> (shortest-path 'a 'd min)
(A C D)

;;;b)
(defun bfs (end queue net)
  (block found 
    (if (null queue)
        nil                     
        (let ((path (car queue)))
         (let ((node (car path)))
         (if (eql node end)
           (return-from found (reverse path))
           (bfs end
              (append (cdr queue)
                (new-paths path node net))
       net)))))))
BFS
> (shortest-path 'a 'd min)
(A C D)

