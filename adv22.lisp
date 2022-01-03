(defparameter *spells*
  '((magic-missile . 53) (drain . 73)
    (shield . 113) (poison . 173) (recharge . 229)))

(defun update (alist item delta)
  (let ((new (copy-tree alist)))
    (if (eq item 'spells)
        (push delta (cdr (assoc item new)))
        (incf (cdr (assoc item new)) delta))
    new))

;;; Monolithic spaghetti
(defun adv22 (init hardp)
  (let (min)
    (labels ((cast-spell (spell state)
               (ecase spell
                 (magic-missile (update state 'boss-hp -4))
                 (drain (update (update state 'boss-hp -2) 'my-hp 2))
                 (shield (unless (> (cdr (assoc 'shield state)) 0)
                           (update state 'shield 6)))
                 (poison (unless (> (cdr (assoc 'poison state)) 0)
                           (update state 'poison 6)))
                 (recharge (unless (> (cdr (assoc 'recharge state)) 0)
                             (update state 'recharge 5)))))
             (rec (state playerp)
               (let ((protected nil))
                 (when (and hardp playerp)
                   (setf state (update state 'my-hp -1)))
                 (when (> (cdr (assoc 'poison state)) 0)
                   (setf state (update (update state 'poison -1) 'boss-hp -3)))
                 (when (> (cdr (assoc 'recharge state)) 0)
                   (setf state (update (update state 'recharge -1) 'mana 101)))
                 (when (> (cdr (assoc 'shield state)) 0)
                   (setf state (update state 'shield -1)
                         protected t))
                 (cond ((and min (>= (cdr (assoc 'cost state)) min)) nil)
                       ((and playerp (<= (cdr (assoc 'my-hp state)) 0)) nil)
                       ((<= (cdr (assoc 'boss-hp state)) 0)
                        (let ((cost (cdr (assoc 'cost state))))
                          (when (or (null min) (< cost min))
                            (format t "~a : ~a~%" (reverse (cdr (assoc 'spells state))) cost)
                            (setf min cost))))
                       (playerp
                        (loop with mana = (cdr (assoc 'mana state))
                              for (spell . cost) in *spells*
                              when (<= cost mana) do
                                (let ((next (cast-spell
                                             spell (update
                                                    (update
                                                     (update state 'cost cost)
                                                     'mana (- cost))
                                                    'spells spell))))
                                  (when next
                                    (rec next nil)))))
                       (t (rec (update state 'my-hp (if protected -1 -8)) t))))))
      (rec init t))
    min))

(defparameter *data*
  '((boss-hp . 55) (my-hp . 50) (mana . 500) (poison . 0) (recharge . 0) (shield . 0) (cost . 0)  (spells . ())))
