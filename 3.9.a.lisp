#9
(setf min '((a b c) (b c) (c d)))
((A B C) (B C) (C D))
(setf min '((d c) (b a) (c b a)))
((D C) (B A) (C B A))
;recursion
(defun longestpath (start end net)
  (setf ddfs nil)
  (dfs end (list (list start)) net)
  (setf mlst nil)
  (maxlens ddfs 0 mlst))
LONGESTPATH
(defun new-paths(path node net)
  (mapcar #'(lambda (n)
        (cons n path))
        (cdr (assoc node net))))
NEW-PATHS
(defun dfs (end queue net)                                                                                         
  (if (null queue)                                                                                                 
    nil                   
    (dolist (path queue) 
      (if (not (isdup path))
        (let  ((node (car path)))
          (if (eql node end)
            (setq ddfs (cons (reverse path) ddfs))
            (dfs end  (new-paths path node net) net)))))))
DFS
(defun isdup (lst)
  (if (member (car lst) (cdr lst)) 
    t
    nil))
ISDUP
(defun maxlens (lst maxl mlst)
  (if (listp (car lst))
    (progn (if (> (length (car lst)) maxl)
              (progn (setq maxl (length (car lst))) 
	        (setq mlst (car lst))) )
              (if (and (not (null (cdr lst))) (listp (car (cdr lst)))) 
                 (maxlens (cdr lst) maxl mlst) mlst))
                 maxl ))
MAXLENS
[7]> (longestpath 'd 'a min)
(D C B A)
;iteration




(defun longestpath (start end net)
  (dfs end (list (list start)) net))
  LONGESTPATH
(defun new-paths(path node net)
  (mapcar #'(lambda (n)
        (cons n path))
        (cdr (assoc node net))))
NEW-PATHS
(defun dfs (end queue net)
  (if (null queue)
    nil
    (mapcar #'(lambda (path)   (if (not (isdup path)) 
       (let  ((node (car path)))
          (if (eql node end)
            (reverse path)
	    (dfs end  (new-paths path node net) net))))) queue )))
DFS
(defun isdup (lst)
  (if (member (car lst) (cdr lst)) 
    t
    nil))
ISDUP

(defun dfs (end queue net)                            
  (if (null queue)
   nil
   (mapcar #'(lambda (path) 
     (let  ((node (car path))) 
       (if (and (not (isdup path)) (not (null path)))
         (if (eql node end)
            (format t "~A " (reverse path))
            (dfs end  (new-paths path node net) net))))) queue )))
(defun dfs (end queue net)
  (if (null queue)
    nil
   (dolist (path queue) (if (not (isdup path)) 
      (let  ((node (car path)))
         (if (eql node end)
             (setq ddfs (cons (reverse path) ddfs))
             (dfs end  (new-paths path node net) net)))))  ))
DFS



(defun maxlens (lst maxl)
   (format t "~Aa" lst) 
     (if (listp (car lst))
       (progn (if (> (length (car lst)) maxl)
          (setf maxl (length (car lst))) )
           (if (and (not (null lst)) (listp (car (cdr lst)))) 
	     (maxlens (cdr lst) 
	     maxl)) )                                      
   maxl ))
MAXLENS
