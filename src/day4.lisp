(defpackage #:aoc2022-day4
  (:nicknames #:day4)
  (:use #:cl #:cl-ppcre))

(in-package #:aoc2022-day4)

(defun get-pairs (line)
  (ppcre:register-groups-bind (x1 x2 y1 y2)
      ("(\\d+)-(\\d+),(\\d+)-(\\d+)" line :sharedp t)
    (mapcar #'parse-integer
            (list x1 x2 y1 y2))))

(defun read-pairs ()
  (with-open-file (in "./input/day4.in")
    (do ((line (read-line in nil 'eof) (read-line in nil 'eof))
         (ret))
        ((eq line 'eof) ret)
      (push (get-pairs line) ret))))

(defun part-1 ()
  (loop :for (x1 x2 y1 y2) :in (read-pairs)
        :with total := 0
        :when (or (and (>= y1 x1)
                       (<= y2 x2))
                  (and (>= x1 y1)
                       (<= x2 y2)))
          :do (incf total)
        :finally (return total)))

(defun part-2 ()
  (loop :for (x1 x2 y1 y2) :in (read-pairs)
        :with total := 0
        :when (and (<= x1 y2)
                   (<= y1 x2))
          :do (incf total)
        :finally (return total)))
