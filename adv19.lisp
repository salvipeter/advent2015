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

(defparameter *rules*
  '(("Al" . "ThF") ("Al" . "ThRnFAr") ("B" . "BCa") ("B" . "TiB") ("B" . "TiRnFAr") ("Ca" . "CaCa") ("Ca" . "PB") ("Ca" . "PRnFAr") ("Ca" . "SiRnFYFAr") ("Ca" . "SiRnMgAr") ("Ca" . "SiTh") ("F" . "CaF") ("F" . "PMg") ("F" . "SiAl") ("H" . "CRnAlAr") ("H" . "CRnFYFYFAr") ("H" . "CRnFYMgAr") ("H" . "CRnMgYFAr") ("H" . "HCa") ("H" . "NRnFYFAr") ("H" . "NRnMgAr") ("H" . "NTh") ("H" . "OB") ("H" . "ORnFAr") ("Mg" . "BF") ("Mg" . "TiMg") ("N" . "CRnFAr") ("N" . "HSi") ("O" . "CRnFYFAr") ("O" . "CRnMgAr") ("O" . "HP") ("O" . "NRnFAr") ("O" . "OTi") ("P" . "CaP") ("P" . "PTi") ("P" . "SiRnFAr") ("Si" . "CaSi") ("Th" . "ThCa") ("Ti" . "BP") ("Ti" . "TiTi") ("e" . "HF") ("e" . "NAl") ("e" . "OMg")))

(defparameter *data*
  "ORnPBPMgArCaCaCaSiThCaCaSiThCaCaPBSiRnFArRnFArCaCaSiThCaCaSiThCaCaCaCaCaCaSiRnFYFArSiRnMgArCaSiRnPTiTiBFYPBFArSiRnCaSiRnTiRnFArSiAlArPTiBPTiRnCaSiAlArCaPTiTiBPMgYFArPTiRnFArSiRnCaCaFArRnCaFArCaSiRnSiRnMgArFYCaSiRnMgArCaCaSiThPRnFArPBCaSiRnMgArCaCaSiThCaSiRnTiMgArFArSiThSiThCaCaSiRnMgArCaCaSiRnFArTiBPTiRnCaSiAlArCaPTiRnFArPBPBCaCaSiThCaPBSiThPRnFArSiThCaSiThCaSiThCaPTiBSiRnFYFArCaCaPRnFArPBCaCaPBSiRnTiRnFArCaPRnFArSiRnCaCaCaSiThCaRnCaFArYCaSiRnFArBCaCaCaSiThFArPBFArCaSiRnFArRnCaCaCaFArSiRnFArTiRnPMgArF")
