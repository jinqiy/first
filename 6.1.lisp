;;;orignal
(defun tokens ( str  test start )
  (let ((p1 (position-if test str :start start )))
    (if p1
      (let ((p2 (position-if #'(lambda (c)
                                (not (funcall test c)))
                             str :start p1)))
       (cons (subseq str p1 p2)
             (if p2
               (tokens str test p2)
               nil)))
   nil)))
(defun constituent (c)
  (and (graphic-char-p c)
    (not (char= c #\ ))))
;;;test
;;;>(tokens "ab12 3cde.f" #'alpha-char-p 0)
;;;("ab" "cde" "f")

;;; default parameters
(defun my-tokens (str &optional (test #'constituent) (start 0))
  (let ((p1 (position-if test str :start start )))
    (if p1
      (let ((p2 (position-if #'(lambda (c)
                                (not (funcall test c)))
                             str :start p1)))
       (cons (subseq str p1 p2)
             (if p2
               (tokens str test p2)
               nil)))
   nil)))

> (my-tokens "abcdef gh")                                                                                           
("abcdef" "gh")
> (my-tokens "ab12 3cde.f" #'alpha-char-p 0)                                                                        
("ab" "cde" "f")
> (my-tokens "ab12 3cde.f" #'constituent 0)
("ab12" "3cde.f")
