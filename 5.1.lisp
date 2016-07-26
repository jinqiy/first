1)
> (setf y (list '1 '2))
(1 2)
> (let ((x (car y)))
    (cons x x))
(1 . 1)

>((lambda (x)  (cons x x)) (car y))
(1 . 1)

2)
> (setf x (list '1 '2))
(1 2)
> (setf z 2)
2
> (let* ((w (car x))
    (y (+ w z)))
    (cons w y))
(1 . 3)

>((lambda (w) ((lambda (y) (cons w y)) (+ w z))) (car x))
(1 . 3)

