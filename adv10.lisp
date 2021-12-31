(defun look-say (list &optional n k)
  (cond ((null list)
         (if n (list k n) ()))
        ((eq (car list) n)
         (look-say (cdr list) n (1+ k)))
        (n
         (cons k (cons n (look-say (cdr list) (car list) 1))))
        (t
         (look-say (cdr list) (car list) 1))))

;;; Needs a large control stack, call with
;;; $ sbcl --control-stack-size 1000
(defun adv10 (number-list n)
  (loop repeat (1+ n)
        for list = number-list then (look-say list)
        finally (return (length list))))

(defparameter *data* '(3 1 1 3 3 2 2 1 1 3))
