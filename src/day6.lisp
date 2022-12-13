(defpackage #:aoc2022-day6
  (:nicknames #:day6)
  (:use #:cl))

(in-package #:aoc2022-day6)

(defun unique-p (str)
  (eql (length str) (length (remove-duplicates str))))

(defun find-marker (stream len)
  (loop :for i :from len :to (length stream)
        :if (unique-p (subseq stream (- i len) i))
          :return i))

(defun part-1 ()
  (let ((stream (uiop:read-file-string "./input/day6.in")))
    (find-marker stream 4)))

(defun part-2 ()
  (let ((stream (uiop:read-file-string "./input/day6.in")))
    (find-marker stream 14)))
