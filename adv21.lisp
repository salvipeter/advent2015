(defun subsets (list)
  (if (null list)
      '(())
      (let ((rest (subsets (cdr list))))
        (append rest
                (mapcar (lambda (l)
                          (cons (car list) l))
                        rest)))))

(defun product (&rest args)
  (if (null args)
      '(())
      (let ((rest (apply 'product (cdr args))))
        (mapcan (lambda (x)
                  (mapcar (lambda (l)
                            (cons x l))
                          rest))
                (car args)))))

(defun selections (shop)
  "1 weapon, 0-1 armor, 0-n ring"
  (mapcar (lambda (l)
            (remove-if-not 'identity
                           (append (car l) (cdr l))))
          (product (subsets (cdr (assoc 'rings shop)))
                   (cdr (assoc 'weapons shop))
                   (cons nil (cdr (assoc 'armor shop))))))

(defun hit (attacker defender)
  (max 1 (- (second attacker)
            (third defender))))

(defun win (me enemy)
  (< (ceiling (first enemy) (hit me enemy))
     (ceiling (first me) (hit enemy me))))

(defun v+ (&rest u)
  (apply 'mapcar '+ u))

(defun adv21 (shop boss)
  (loop for inventory in (selections shop)
        for (cost damage armor) = (reduce 'v+ (mapcar 'cdr inventory))
        when (win (list 100 damage armor) boss)
          minimize cost))

(defun adv21b (shop boss)
  (loop for inventory in (selections shop)
        for (cost damage armor) = (reduce 'v+ (mapcar 'cdr inventory))
        when (win boss (list 100 damage armor))
          maximize cost))

(defparameter *boss*
  '(109 8 2))

(defparameter *data*
  '((weapons . ((dagger 8 4 0)
                (shortsword 10 5 0)
                (warhammer 25 6 0)
                (longsword 40 7 0)
                (greataxe 74 8 0)))
    (armor . ((leather 13 0 1)
              (chainmail 31 0 2)
              (splintmail 53 0 3)
              (bandedmail 75 0 4)
              (platemail 102 0 5)))
    (rings . ((damage+1 25 1 0)
              (damage+2 50 2 0)
              (damage+3 100 3 0)
              (defense+1 20 0 1)
              (defense+2 40 0 2)
              (defense+3 80 0 3)))))
