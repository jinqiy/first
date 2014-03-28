(a) cons  but cons is a primitive function, nothing changed here.
OR, I can try make it a little different. 
[12]>
(defun mycons (x y)
`(,x . ,y))
MYCONS
[95]> (cons 'a 'b)
(A . B)
[101]> (mycons '(a b) 'c)
((A B) . C)
[102]> (mycons '(a b) '(c d))
((A B) C D)

(b) list   also, list is a primitive function, nothing changed here.
OR, a tricky.
[112]> 
(defun mylist (&rest x)
  `(,@x)
)
MYLIST
[113]> (mylist 'a)
(A)
[114]> (mylist 'a 'b)
(A B)
[115]> (mylist 'a 'b 'c)
(A B C)
[116]> (mylist 'a '(b c))
(A (B C))

(c) length(for lists)
kindly changed cdr to car
[1]> 
(defun mlength (lst)
(if (null lst)
  0
  (+ 1 (mlength (car lst)))
)
)
MLENGTH
[2]> (mlength '(1))
1
[3]> (mlength '(1 2 3))
3
[4]> (mlength nil)
0
[5]> (mlength '())
0

(d) member
[7]> 
(defun mmember(ele lst)
  (if (equal ele (cdr lst))
      lst 
      (mmember ele (car lst))
  )
)
MMEMBER
[8]> (mmember 'a '(a b c))
(A B C)
[9]> (mmember 'b '(a b c))
(B C)
[10]> (mmember 'c '(a b c))
(C)
