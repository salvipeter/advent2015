;;; This assumes that we only need to care about the first group;
;;; the rest will always be dividable into 2 equal groups (or 3 in part 2).

;;; I'm not sure why this should be so,
;;; but otherwise this problem would be prohibitively complex.

(defun fixed-length-sums (list length target)
  (let ((result ()))
    (labels ((rec (elems n k acc)
               (cond ((zerop n)
                      (when (= k length)
                        (push acc result)))
                     ((= k length) nil)
                     ((null elems) nil)
                     (t (when (<= (car elems) n)
                          (rec (cdr elems) (- n (car elems)) (1+ k)
                               (cons (car elems) acc)))
                        (rec (cdr elems) n k acc)))))
      (rec list target 0 ()))
    result))

(defun adv24 (packages places)
  (let* ((target (floor (reduce '+ packages) places))
         (minimals (loop for n upfrom 1
                         for l = (fixed-length-sums packages n target)
                         until l finally (return l))))
    (reduce 'min (mapcar (lambda (x)
                           (reduce '* x))
                         minimals))))

(defparameter *data*
  '(1 3 5 11 13 17 19 23 29 31 37 41 43 47 53 59 67 71 73 79 83 89 97 101 103 107 109 113))
