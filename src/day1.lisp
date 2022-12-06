(defpackage :aoc2022-day1
  (:use :cl))

(in-package :aoc2022-day1)

(defun get-calories-list ()
  (with-open-file (in "./day1.in")
    (mapcar
     (lambda (elf) (reduce #'+ elf))

     (do ((line (read-line in nil 'eof) (read-line in nil 'eof))
          (cur nil)
          (ret nil))
         ((eq line 'eof) ret)

       (if (string/= line "")
           (push (parse-integer line) cur)
           (progn
             (push cur ret)
             (setf cur nil)))))))

(defun part-1 ()
  (apply #'max (get-calories-list)))

(defun part-2 ()
  (reduce #'+
         (subseq
          (sort (get-calories-list) #'>)
          0 3)))
