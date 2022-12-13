(defpackage #:aoc2022-day2
  (:nicknames #:day2)
  (:use #:cl))

(in-package #:aoc2022-day2)

(defun get-strategy ()
  (with-open-file (in "./input/day2.in")
    (do ((line (read-line in nil 'eof) (read-line in nil 'eof))
         (ret nil))
        ((eq line 'eof) ret)

      (let ((opponent (read-from-string (subseq line 0 1)))
            (self (read-from-string (subseq line 2))))
        (push (cons opponent self) ret)))))

(defun score-move (move)
  (destructuring-bind (opponent . self) move
    (case opponent
      (a (case self
           (x (+ 3 1))
           (y (+ 6 2))
           (z (+ 0 3))))
      (b (case self
           (x (+ 0 1))
           (y (+ 3 2))
           (z (+ 6 3))))
      (c (case self
           (x (+ 6 1))
           (y (+ 0 2))
           (z (+ 3 3)))))))

(defun calculate-move (move)
  (destructuring-bind (opponent . outcome) move
    (case outcome
      ;; Lose
      (x (case opponent
           (a (+ 0 3))
           (b (+ 0 1))
           (c (+ 0 2))))
      ;; Draw
      (y (case opponent
           (a (+ 3 1))
           (b (+ 3 2))
           (c (+ 3 3))))
      ;; Win
      (z (case opponent
           (a (+ 6 2))
           (b (+ 6 3))
           (c (+ 6 1)))))))

(defun part-1 ()
  (reduce #'+ (mapcar #'score-move (get-strategy))))

(defun part-2 ()
  (reduce #'+ (mapcar #'calculate-move (get-strategy))))
