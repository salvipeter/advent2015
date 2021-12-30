;;; Uses the MD5 library, which gives the results in octets

(defun zero-prefix (str k)
  (let ((md5 (md5:md5sum-string str)))
    (dotimes (i (floor k 2))
      (when (/= (elt md5 i) 0)
        (return-from zero-prefix nil)))
    (or (evenp k)
        (= (logand (elt md5 (floor k 2)) #xf0) 0))))

(defun adv04 (key k)
  (loop for n upfrom 1
        until (zero-prefix (format nil "~a~a" key n) k)
        finally (return n)))

(defparameter *data* "iwrupvqb")
