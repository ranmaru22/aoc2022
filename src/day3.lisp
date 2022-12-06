(defpackage :aoc2022-day3
  (:use :cl))

(in-package :aoc2022-day3)

(defun read-items ()
  (with-open-file (in "./day3.in")
    (do ((line (read-line in nil 'eof) (read-line in nil 'eof))
         (ret nil))
        ((eq line 'eof) ret)
      (push line ret))))

(defun compartmentalize (sack)
  (let ((pivot (floor (length sack) 2)))
    (list (subseq sack 0 pivot) (subseq sack pivot))))

(defun prioritize (item)
  (- (char-int item) (if (lower-case-p item) 96 38)))

(defun find-duplicates (items)
  (destructuring-bind (left right) (compartmentalize items)
    (mapcar #'prioritize
            (remove-duplicates
             (loop :for char :across left
                   :when (find char right)
                     :collect char)))))

(defun find-bagde (items)
  (mapcar #'prioritize
          (loop :for (first second third) :on items :by #'cdddr :while third
                :nconc (remove-duplicates
                        (loop :for char :across first
                              :when (and (find char second) (find char third))
                                :collect char)))))

(defun part-1 ()
  (reduce #'+ (mapcan #'find-duplicates (read-items))))

(defun part-2 ()
  (reduce #'+ (find-bagde (read-items))))
