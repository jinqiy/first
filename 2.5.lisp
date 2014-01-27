a) return nil 

[36]> (defun enigma (x)
  (and (not (null x))
  (or (null (car x))
  (enigma (cdr x))))))
ENIGMA
[37]> (enigma '(a b c d e))
NIL
[38]> (enigma '(a b))
NIL

b) get the location of element x in list y

[39]> (defun mystery (x y)
(if (null y)
nil
(if (eql (car y) x)
 0
 (let ((z (mystery x (cdr y))))
  (and z (+ z 1))))))
MYSTERY
[42]> (mystery 'd '(a b c d e f))
3
[43]> (mystery 'a '(a b c d e f))
0
