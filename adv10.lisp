;;; Tail-recursive solution (otherwise the stack overflows)
(defun look-say (list)
  (labels ((rec (list acc n k)
             (cond ((null list)
                    (if n (nreverse (cons n (cons k acc))) acc))
                   ((eq (car list) n)
                    (rec (cdr list) acc n (1+ k)))
                   (n
                    (rec (cdr list) (cons n (cons k acc)) (car list) 1))
                   (t
                    (rec (cdr list) acc (car list) 1)))))
    (rec list () nil nil)))

;;; n = 40 for part 1, n = 50 for part 2
(defun adv10 (number-list n)
  (loop repeat (1+ n)
        for list = number-list then (look-say list)
        finally (return (length list))))

(defparameter *data* '(3 1 1 3 3 2 2 1 1 3))
