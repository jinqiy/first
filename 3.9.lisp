(setf min '((a b c) (b c) (c d)))                                                                                 
;((A B C) (B C) (C D))

;solution from here
(defun new-paths (path node net)
  (mapcar #'(lambda (n)
           (cons n path))
    (cdr (assoc node net))))
;NEW-PATHS

;no circle
(defun myb-paths (qu net)
  (car (mapcar #'(lambda (path)
            (new-paths path (car path) net))
  qu )))
MYB-PATHS
(defun mybfs (node qu rt net)                                                                            
  (if (null qu) (myrev rt)
      (progn (setf rt qu)
             (mybfs node (myb-paths qu net) rt net)
  )))
MYBFS
> 
(defun mybfsa (start min)
  (mybfs start (list (list start)) '() min))
MYBFSA
> (defun myrev (lst)
(mapcar #'(lambda (n)
   (reverse n))                                                                                                 
    lst)))
MYREV
> (mybfs 'a '((a)) '() min)
((A B C D))
> (mybfsa 'a  min)
((A B C D))

;circle a-b-c-d-b
(setf min1 '((a b c) (b c) (c d) (d b ) )) 
((A B C) (B C) (C D) (D B))

(defun my-ifdedup (head lst)
  (if (equal head (car lst))
        t
     (if  (null lst) nil (my-ifdedup head (cdr lst) )) 
     ))
MY-IFDEDUP
(defun mybfsaa (node qu rt net)                                                   
  (if (null qu) (myrev rt)
        (progn (append rt (my-circle qu)) (setf qu (my-rmcircle qu))                      
    (mybfsaa node (myb-paths qu net) rt net)
)))
MYBFSAA
(defun my-circle (lst)
  (remove nil 
    (mapcar  #'(lambda (n) 
      (if (my-ifdedup (car n) (cdr n))
        n
	nil))
      lst)))
MY-CIRCLE
(defun my-rmcircle (lst)
  (remove nil 
    (mapcar  #'(lambda (n) 
      (if (my-ifdedup (car n) (cdr n))
        nil   
        n))
        lst)))
MY-RMCIRCLE

(defun mybfsaa (node qu rt cc net)                                                   
  (if (null qu) (progn (append (myrev rt) (myrev cc)) )
        (progn (setf rt (my-rmcircle qu)) 
	       (setf cc (append cc (my-circle qu)))
               (mybfsaa node (myb-paths rt net) rt cc net)
   )))
MYBFSAA

[149]>(mybfsaa 'a '((a)) '() '() min)
hi((A))hi((B A) (C A))hi((C B A))hi((D C B A))
((A B C D))
[150]> (mybfsaa 'a '((a)) '() '() min1)
hi((A))hi((B A) (C A))hi((C B A))hi((D C B A))hi((B D C B A))
((A B C D B))
