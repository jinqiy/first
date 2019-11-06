;;;orignal
(defun bin-search (obj vec)
  (let ((len (length vec)))
    (and (not (zerop len))
      (finder obj vec 0 (- len 1)))))

(defun finder (obj vec start end)
  (let ((range (- end start)))
    (if (zerop range)
      (if (eql obj (aref vec start))
        obj
        nil)
    (let ((mid (+ start (round (/ range 2)))))
      (let ((obj2 (aref vec mid)))
        (if (< obj obj2)
           (finder obj vec start (- mid 1))
           (if (> obj obj2)
             (finder obj vec (+ mid 1) end)
             obj)))))))

> (bin-search 3 #(0 1 2 3 4 5 6 7 8 9))
3
;;;takes :key, :test, :start, :end arguments with the usual meanings and defaults.
(defun bin-search2 (obj vec)                                                     
  (let ((len (length vec)))
    (and (not (zerop len))
      (finder2 obj vec 0 (- len 1)))))
(defun finder2 (&optional (obj 3) (vec nil)  (start 0) (end (- (length test) 1)))
   (let ((range (- end start)))
     (if (zerop range)
        (if (eql obj (aref vec start))
            obj
            nil)
        (let ((mid (+ start (round (/ range 2)))))
          (let ((obj2 (aref vec mid)))
             (if (< obj obj2)
                 (finder2 obj vec start (- mid 1))
                 (if (> obj obj2)
                   (finder2 obj vec (+ mid 1) end)
                     obj)))))))

> (bin-search2 3 #(0 1 2 3 4 5 6 7 8 9))
3
