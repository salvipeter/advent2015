;;; Same as Day 9, but with
;;; - different names
;;; - slightly different data structure
;;; - circular two-way weight/happiness
;;; (One person could have a fixed position as an optimization.)

(defun people (relations)
  (remove-duplicates
   (append (mapcar 'caar relations)
           (mapcar 'cdar relations))))

(defun insert (x list)
  (if (null list)
      `((,x))
      (cons (cons x list)
            (mapcar (lambda (l)
                      (cons (car list) l))
                    (insert x (cdr list))))))

(defun permutations (list)
  (if (null list)
      '(())
      (mapcan (lambda (l)
                (insert (car list) l))
              (permutations (cdr list)))))

(defun happiness (seating relations)
  (labels ((delta (a b)
             (+ (cdr (assoc (cons a b) relations :test 'equal))
                (cdr (assoc (cons b a) relations :test 'equal))))
           (rec (seating start)
                (if (null (cdr seating))
                    (delta (first seating) start)
                    (+ (delta (first seating) (second seating))
                       (rec (rest seating) start)))))
    (rec seating (car seating))))

(defun adv13 (relations)
  (loop for seating in (permutations (people relations))
        maximize (happiness seating relations)))

(defun adv13b (relations)
  (let ((withme (append
                 (mapcan (lambda (x)
                           `(((me . ,x) . 0) ((,x . me) . 0)))
                         (people relations))
                 relations)))
    (loop for seating in (permutations (people withme))
          maximize (happiness seating withme))))

(defparameter *data*
  '(((Alice . Bob) . 2) ((Alice . Carol) . 26) ((Alice . David) . -82) ((Alice . Eric) . -75) ((Alice . Frank) . 42) ((Alice . George) . 38) ((Alice . Mallory) . 39) ((Bob . Alice) . 40) ((Bob . Carol) . -61) ((Bob . David) . -15) ((Bob . Eric) . 63) ((Bob . Frank) . 41) ((Bob . George) . 30) ((Bob . Mallory) . 87) ((Carol . Alice) . -35) ((Carol . Bob) . -99) ((Carol . David) . -51) ((Carol . Eric) . 95) ((Carol . Frank) . 90) ((Carol . George) . -16) ((Carol . Mallory) . 94) ((David . Alice) . 36) ((David . Bob) . -18) ((David . Carol) . -65) ((David . Eric) . -18) ((David . Frank) . -22) ((David . George) . 2) ((David . Mallory) . 42) ((Eric . Alice) . -65) ((Eric . Bob) . 24) ((Eric . Carol) . 100) ((Eric . David) . 51) ((Eric . Frank) . 21) ((Eric . George) . 55) ((Eric . Mallory) . -44) ((Frank . Alice) . -48) ((Frank . Bob) . 91) ((Frank . Carol) . 8) ((Frank . David) . -66) ((Frank . Eric) . 97) ((Frank . George) . -9) ((Frank . Mallory) . -92) ((George . Alice) . -44) ((George . Bob) . -25) ((George . Carol) . 17) ((George . David) . 92) ((George . Eric) . -92) ((George . Frank) . 18) ((George . Mallory) . 97) ((Mallory . Alice) . 92) ((Mallory . Bob) . -96) ((Mallory . Carol) . -51) ((Mallory . David) . -81) ((Mallory . Eric) . 31) ((Mallory . Frank) . -73) ((Mallory . George) . -89)))
