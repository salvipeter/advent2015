;;; Smallest number s.t. sigma(n) > 3400000
;;; sigma(n) > n * sqrt(n) for all n         <- https://oeis.org/A000203

;;; What we need is a highly abundant number <- https://oeis.org/A002093 (1)
;;; The corresponding record values are here <- https://oeis.org/A034885 (2)

;;; So #202 in (2) is the first one large enough;
;;; the corresponding value in (1) is 786240.

;;; Below is a slow implementation...

(defun factors (n &optional (k 2) (num 0) acc)
  (cond ((= n 1) (if (= num 0) acc (cons (list k num) acc)))
	((= (mod n k) 0) (factors (/ n k) k (1+ num) acc))
	(t (factors n (if (= k 2) 3 (+ k 2)) 0
		    (if (= num 0) acc (cons (list k num) acc))))))

(defun sum-of-divisors (n)
  (reduce '* (loop for div in (factors n)
	           collect (/ (1- (expt (first div) (1+ (second div))))
			      (1- (first div))))))

(defun adv20 (target)
  (loop with limit = (floor target 10)
        for n upfrom (ceiling (expt limit 2/3))
        for d = (sum-of-divisors n)
        while (< d limit)
        finally (return n)))

;;; Second part is trivial :)

(defun presents (n)
  (* 11
     (loop for k from 1 to 50
           when (zerop (mod n k))
             sum (floor n k))))

(defun adv20b (target)
  (loop for n upfrom 1
        for d = (presents n)
        while (< d target)
        finally (return n)))

(defparameter *data* 34000000)
