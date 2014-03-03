Because by default, the member compares objects using eql.
If you want get t from the expression, append a keyword argument like this,
> (member '(a) '((a) (b) (c)) :test #'equal)
((A) (B) (C))

