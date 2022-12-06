(defpackage :aoc2022-day2
  (:use :cl))

(in-package :aoc2022-day2)

(defun get-strategy ()
  (with-open-file (in "./day2.in")
    (do ((line (read-line in nil 'eof) (read-line in nil 'eof))
         (ret nil))
        ((eq line 'eof) ret)

      (let ((opponent (read-from-string (subseq line 0 1)))
            (self (read-from-string (subseq line 2))))
        (push (cons opponent self) ret)))))

;; TODO
