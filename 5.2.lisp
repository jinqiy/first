mystery
(defun mystery (x y)
(if (null y)
nil
(if (eql (car y) x)
0
(let ((z (mystery x (cdr y))))
(and z (+ z 1))))))


> (defun mystery_cond (x y)
    (cond ((null y) nil)
          ((eql (car y) x) 0)
          (t (let ((z (mystery x (cdr y)))) (and z (+ z 1))))))

> y
(11 11 11 1 2)
> (mystery_cond x y)                                                                                                
3

