(defun triangle (n)
  (floor (* n (1+ n)) 2))

(defun index (row col)
  (+ (triangle (1- row)) 1
     (- (triangle (+ row col -1))
        (triangle row))))

(defun adv25 (position)
  (loop repeat (apply 'index position)
        for code = 20151125
          then (mod (* code 252533) 33554393)
        finally (return code)))

(defparameter *data* '(2947 3029))
