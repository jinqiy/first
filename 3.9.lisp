(setf min '((a b c) (b c) (c d)))                                                                                 
;((A B C) (B C) (C D))

(defun longest-path (start end net)
 (bfs end (list (list start)) net)
)
;LONGEST-PATH


(defun bfs (end qu net)
  (if (null qu)
    nil
    (let ((path (car qu)))
      (let ((node (car path)))
       (if (eql node end)
          (reverse path)
          (bfs end
              (append (cdr qu) 
              (new-paths path node net))
              net))))))
;BFS

(defun new-paths (path node net)
  (mapcar #'(lambda (n)
           (cons n path))
    (cdr (assoc node net))))
;NEW-PATHS


;solution from here
;no circle
(defun myb-paths (qu net)
  (car (mapcar #'(lambda (path)
            (new-paths path (car path) net))
  qu )))
MYB-PATHS
 (defun mybfs (node qu rt net)                                                                            
  (if (null qu) rt
      (progn (setf rt qu)
             (mybfs node (myb-paths qu net) rt net)
  )))
MYBFS


