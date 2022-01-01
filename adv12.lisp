;;; Uses JSOWN

(defun sum-numbers (json)
  (if (consp json)
      (if (eq (car json) :obj)
          (loop for x in (cdr json) sum (sum-numbers (cdr x)))
          (loop for x in json sum (sum-numbers x)))
      (if (numberp json)
          json
          0)))

(defun adv12 (filename)
  (sum-numbers
   (jsown:parse
    (with-open-file (s filename)
      (read-line s)))))

(defun sum-not-red (json)
  (if (consp json)
      (if (eq (car json) :obj)
          (if (rassoc "red" (cdr json) :test 'equal)
              0
              (loop for x in (cdr json) sum (sum-not-red (cdr x))))
          (loop for x in json sum (sum-not-red x)))
      (if (numberp json)
          json
          0)))

(defun adv12b (filename)
  (sum-not-red
   (jsown:parse
    (with-open-file (s filename)
      (read-line s)))))
