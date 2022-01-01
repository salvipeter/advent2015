(defun distance (reindeer time)
  (destructuring-bind (name speed duration rest)
      reindeer
    (declare (ignore name))
    (+ (* speed duration (floor time (+ duration rest)))
       (* speed (min duration (mod time (+ duration rest)))))))

(defun adv14 (reindeers &optional (time 2503))
  (loop for deer in reindeers
        maximize (distance deer time)))

(defun adv14b (reindeers &optional (limit 2503))
  (let ((score (mapcar (lambda (r) (cons (car r) 0)) reindeers)))
    (loop for time from 1 to limit
          for dists = (mapcar (lambda (r) (distance r time)) reindeers)
          for max = (reduce #'max dists)
          do (loop for deer in reindeers
                   for dist in dists
                   when (= dist max) do
                     (incf (cdr (assoc (car deer) score)))))
    (reduce #'max (mapcar 'cdr score))))

(defparameter *data*
  '((Vixen 19 7 124) (Rudolph 3 15 28) (Donner 19 9 164) (Blitzen 19 9 158) (Comet 13 7 82) (Cupid 25 6 145) (Dasher 14 3 38) (Dancer 3 16 37) (Prancer 25 6 143)))
