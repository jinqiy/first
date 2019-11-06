(defun npara (&rest args)
  (length  args))
NPARA

>(npara 1 2)                                                                                                        
2
> (npara 1)                                                                                                     
1
> (npara )                                                                                                      
0
> (npara 1 2 3 4 5 6)
6
