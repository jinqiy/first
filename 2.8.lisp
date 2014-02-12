a) 
iterative version
[1]> (defun show-dots(x)
(do ((i 1 (+ i 1)))
  ((> i x) 'done)
  (format t "."))) 
SHOW-DOTS
[2]> (show-dots 1)
.
DONE
[3]> (show-dots 2)
..
DONE
[4]> (show-dots 9)
.........
DONE
[5]> (show-dots 10)
..........
DONE

recursive version
[15]> (defun show-dots-r(x)
(if (= x 0) 'done (progn (format t ".") (show-dots-r(- x 1)))))
SHOW-DOTS-R
[16]> (show-dots-r 3)
...
DONE
[17]> (show-dots-r 1)
.
DONE
[18]> (show-dots-r 10)
..........
DONE

b)
iterative version
[61]> (defun show-a(lst)
(let ((x 0))
  (do ((i 0 (+ i 1)))
    ((> i (length lst)) 'done)
      (if (equal 'a (nth i lst)) 
        (setf x (+ x 1))                   
      )
  )
  x
))
SHOW-A
[62]> (show-a '(a))
1
[63]> (show-a '(a a))
2
[64]> (show-a '(a b c a b a x))
3
[65]> (show-a '(a b c a b a x a))
4

recursive version
[83]> 
(defun show-a-r(lst)                                                                                              
(if (null lst) 0
  (if (equal 'a (car lst))
      (+ 1 (show-a-r (cdr lst))) 
      (show-a-r (cdr lst))
  )
))
SHOW-A-R
[84]> (show-a-r '(a))                                                                                              
1
[85]> (show-a-r '(a a))
2
[86]> (show-a '(a b c a b a x))
3
[87]> (show-a-r '(a b c a b a x a))
4
