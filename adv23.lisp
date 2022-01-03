;;; The program first initializes a:
;;;   a <- if a = 1 then 113383 else 2187a + 4591
;;; Then it computes the number of steps for the Collatz series to reach 1.

(defun collatz (n &optional (k 0))
  (cond ((= n 1) k)
        ((evenp n) (collatz (floor n 2) (1+ k)))
        (t (collatz (1+ (* 3 n)) (1+ k)))))

(defun adv23 ()
  (collatz 4591))

(defun adv23b ()
  (collatz 113383))
