(defun v+ (&rest u)
  (apply 'mapcar '+ u))

(defun v* (u &rest scale)
  (mapcar (lambda (x) (apply '* x scale)) u))

(defun score (ingredients amounts)
  (let* ((multiplied (mapcar 'v* (mapcar 'cdr ingredients) amounts))
         (summed (mapcar (lambda (x)
                           (max x 0))
                         (reduce 'v+ multiplied))))
    (reduce '* (butlast summed))))

(defun sums (n k)
  "All lists of K elements that sum up to N."
  (cond ((and (zerop n) (zerop k)) '(()))
        ((zerop k) nil)
        ((zerop n) (list (make-list k :initial-element 0)))
        (t (loop for i from 0 to n
                 appending (mapcar (lambda (list)
                                     (cons i list))
                                   (sums (- n i) (1- k)))))))

(defun adv15 (ingredients)
  (loop for amounts in (sums 100 (length ingredients))
        maximizing (score ingredients amounts)))

(defun score2 (ingredients amounts)
  (let* ((multiplied (mapcar 'v* (mapcar 'cdr ingredients) amounts))
         (summed (mapcar (lambda (x)
                           (max x 0))
                         (reduce 'v+ multiplied))))
    (if (= (fifth summed) 500)
        (reduce '* (butlast summed))
        0)))

(defun adv15b (ingredients)
  (loop for amounts in (sums 100 (length ingredients))
        maximizing (score2 ingredients amounts)))

(defparameter *data* '((sprinkles 5 -1 0 0 5) (peanut-butter -1 3 0 0 1) (frosting 0 -1 4 0 6) (sugar -1 0 0 2 8)))
