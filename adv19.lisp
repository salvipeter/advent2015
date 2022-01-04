(defun apply-rule (rule str &optional (start 0))
  (let ((i (search (car rule) str :start2 start)))
    (when i
      (cons (concatenate 'string
                         (subseq str 0 i)
                         (cdr rule)
                         (subseq str (+ i (length (car rule)))))
            (apply-rule rule str (1+ i))))))

(defun adv19 (rules str)
  (length
   (remove-duplicates
    (loop for rule in rules
          appending (apply-rule rule str))
    :test 'equal)))

;;; Some interesting observations
;;; - Some elements are constants: C Rn Y Ar
;;; - Of these, C does not appear in the medicine molecule,
;;;   so all rules creating a C can be ignored
;;; - Rn and Ar always appear in the form .Rn...Ar,
;;;   inside can be: Mg, F, or FYF (this is the only way to get an Y)
;;; - Except for .Rn...Ar, each rule adds 1 to the length [!!!]

;;; Idea:
;;; - Count the number of elements
;;; - Do not count Rn and Ar, because they are just like parentheses
;;; - Count Y as -1, so that RnFYFAr would count as 1
;;; - Subtract 1 because the initial molecule was of length 1

(defun adv19b (str)
  (1- (loop for i from 0 below (length str)
            for c = (char str i)
            when (and (upper-case-p c)
                      (char/= c #\R)
                      (or (char/= c #\A)
                          (char/= (char str (1+ i)) #\r)))
              sum (if (char= c #\Y) -1 1))))

(defparameter *rules*
  '(("Al" . "ThF") ("Al" . "ThRnFAr") ("B" . "BCa") ("B" . "TiB") ("B" . "TiRnFAr") ("Ca" . "CaCa") ("Ca" . "PB") ("Ca" . "PRnFAr") ("Ca" . "SiRnFYFAr") ("Ca" . "SiRnMgAr") ("Ca" . "SiTh") ("F" . "CaF") ("F" . "PMg") ("F" . "SiAl") ("H" . "CRnAlAr") ("H" . "CRnFYFYFAr") ("H" . "CRnFYMgAr") ("H" . "CRnMgYFAr") ("H" . "HCa") ("H" . "NRnFYFAr") ("H" . "NRnMgAr") ("H" . "NTh") ("H" . "OB") ("H" . "ORnFAr") ("Mg" . "BF") ("Mg" . "TiMg") ("N" . "CRnFAr") ("N" . "HSi") ("O" . "CRnFYFAr") ("O" . "CRnMgAr") ("O" . "HP") ("O" . "NRnFAr") ("O" . "OTi") ("P" . "CaP") ("P" . "PTi") ("P" . "SiRnFAr") ("Si" . "CaSi") ("Th" . "ThCa") ("Ti" . "BP") ("Ti" . "TiTi") ("e" . "HF") ("e" . "NAl") ("e" . "OMg")))

(defparameter *data*
  "ORnPBPMgArCaCaCaSiThCaCaSiThCaCaPBSiRnFArRnFArCaCaSiThCaCaSiThCaCaCaCaCaCaSiRnFYFArSiRnMgArCaSiRnPTiTiBFYPBFArSiRnCaSiRnTiRnFArSiAlArPTiBPTiRnCaSiAlArCaPTiTiBPMgYFArPTiRnFArSiRnCaCaFArRnCaFArCaSiRnSiRnMgArFYCaSiRnMgArCaCaSiThPRnFArPBCaSiRnMgArCaCaSiThCaSiRnTiMgArFArSiThSiThCaCaSiRnMgArCaCaSiRnFArTiBPTiRnCaSiAlArCaPTiRnFArPBPBCaCaSiThCaPBSiThPRnFArSiThCaSiThCaSiThCaPTiBSiRnFYFArCaCaPRnFArPBCaCaPBSiRnTiRnFArCaPRnFArSiRnCaCaCaSiThCaRnCaFArYCaSiRnFArBCaCaCaSiThFArPBFArCaSiRnFArRnCaCaCaFArSiRnFArTiRnPMgArF")
