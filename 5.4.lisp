'''orignal:
>
(defconstant month
#(0 31 59 90 120 151 181 212 243 273 304 334 365))
> 
(defun month-num (m y)
  (+ (svref month (- m 1))
  (if (and (> m 2) (leap? y)) 1 0 )))
MONTH-NUM
> 
(defun leap? (y)
  (and (zerop (mod y 4))
     (or (zerop (mod y 400))
     (not (zerop (mod y 100))))))
LEAP?

> (month-num 2 2001)
31

'''replaced svref by case:
> 
(defun month-num-case (m y)
  (+ (case m
      (1 0) (2 31) (3 59) (4 90) (5 120) (6 151) (7 181) (8 212) (9 243) (10 273) (11 304) (12 334)
      (t 999))
    (if (and (> m 2) (leap? y)) 1 0 )))
MONTH-NUM-CASE
> (month-num-case 4 2001)                                                                                           
90
> (month-num-case 4 2000)                                                                                           
91


