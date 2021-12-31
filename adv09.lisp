(defun locations (distances)
  (remove-duplicates
   (append (mapcar 'first distances)
           (mapcar 'second distances))))

;;; CL-USER> (length (locations *data*))
;;; 8

;;; We can check all permutations...

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

(defun weight (route distances)
  (if (null (rest route))
      0
      (+ (third (car (or (member (list (first route) (second route)) distances
                                 :key 'butlast :test 'equal)
                         (member (list (second route) (first route)) distances
                                 :key 'butlast :test 'equal))))
         (weight (rest route) distances))))

(defun adv09 (distances)
  (loop for route in (permutations (locations distances))
        minimize (weight route distances)))

(defun adv09b (distances)
  (loop for route in (permutations (locations distances))
        maximize (weight route distances)))

(defparameter *data*
  '((Tristram AlphaCentauri 34) (Tristram Snowdin 100) (Tristram Tambi 63) (Tristram Faerun 108) (Tristram Norrath 111) (Tristram Straylight 89) (Tristram Arbre 132) (AlphaCentauri Snowdin 4) (AlphaCentauri Tambi 79) (AlphaCentauri Faerun 44) (AlphaCentauri Norrath 147) (AlphaCentauri Straylight 133) (AlphaCentauri Arbre 74) (Snowdin Tambi 105) (Snowdin Faerun 95) (Snowdin Norrath 48) (Snowdin Straylight 88) (Snowdin Arbre 7) (Tambi Faerun 68) (Tambi Norrath 134) (Tambi Straylight 107) (Tambi Arbre 40) (Faerun Norrath 11) (Faerun Straylight 66) (Faerun Arbre 144) (Norrath Straylight 115) (Norrath Arbre 135) (Straylight Arbre 127)))
