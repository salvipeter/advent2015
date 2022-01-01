;;; SAME & PAIRS from Day 5

(defun same (str)
  (char= (char str 0) (char str 1)))

(defun pairs (str)
  (loop for i from 1 below (length str)
        collect (subseq str (1- i) (1+ i))))

(defun has-doubles (list n &optional seen)
  (or (zerop n)
      (and (not (null list))
           (if (and (same (car list))
                    (not (member (car list) seen :test 'equal)))
               (has-doubles (cdr list) (1- n)
                            (cons (car list) seen))
               (has-doubles (cdr list) n seen)))))

(defun next-char (char)
  (code-char (1+ (char-code char))))

(defun has-straight (str n)
  (labels ((rec (i c k)
             (or (= k n)
                 (and (< i (length str))
                      (let ((next (char str i)))
                        (if (and c (eq next (next-char c)))
                            (rec (1+ i) next (1+ k))
                            (rec (1+ i) next 1)))))))
    (rec 0 nil 0)))

(defun ambiguous (str)
  (some (lambda (c) (find c str)) "iol"))

;;; Disgusting
(defun next-string (str)
  (labels ((rec (list)
             (if (char= (car list) #\z)
                 (cons #\a (rec (cdr list)))
                 (cons (next-char (car list)) (cdr list)))))
    (map 'string #'identity
         (reverse (rec (reverse (map 'list #'identity str)))))))

(defun adv11 (init)
  (loop for str = init then (next-string str)
        until (and (has-straight str 3)
                   (not (ambiguous str))
                   (has-doubles (pairs str) 2))
        finally (return str)))

(defun adv11b (init)
  (adv11 (next-string (adv11 init))))

(defparameter *data* "cqjxjnds")
