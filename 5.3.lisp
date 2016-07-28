>(defun mysqr (x)
 (cond 
      ((<= x 5) nil)
      ( t (* x x))
))
MYSQR
> (mysqr 6)
36
> (mysqr 5)
NIL
> (mysqr 0)
NIL

