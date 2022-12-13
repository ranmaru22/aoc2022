(defpackage #:aoc2022-day5
  (:nicknames #:day5)
  (:use #:cl))

(in-package #:aoc2022-day5)

(defun read-stacks (stacks-str)
  (destructuring-bind (xs ys zs as bs cs ds es)
      (loop :for line :in (butlast (str:lines stacks-str))
            :collect
            (loop :for char :in (cdr (coerce line 'list)) :by #'cddddr
                  :collect char))

    ;; This is so ugly ...
    (loop :for x :in xs
          :for y :in ys
          :for z :in zs
          :for a :in as
          :for b :in bs
          :for c :in cs
          :for d :in ds
          :for e :in es
          :collect (remove-if-not #'alpha-char-p (list x y z a b c d e)))))

(defun read-moves (moves-str)
  (loop :for line :in (str:lines moves-str)
        :collect (ppcre:register-groups-bind (num from to)
                     ("^move (\\d+) from (\\d+) to (\\d+)$" line :sharedp t)
                   (mapcar #'parse-integer (list num from to)))))

(defun read-input ()
  (destructuring-bind (stacks moves)
      (ppcre:split "\\n\\n" (uiop:read-file-string "./input/day5.in"))
    (list (read-stacks stacks) (read-moves moves))))

(defun move-crate (stacks from to)
  (let ((crate (car (nth (1- from) stacks))))
    (setf (nth (1- from) stacks) (cdr (nth (1- from) stacks)))
    (setf (nth (1- to) stacks) (cons crate (nth (1- to) stacks)))
    stacks))

(defun move-substack (stacks num from to)
  (let ((left (subseq (nth (1- from) stacks) 0 num))
        (right (nthcdr num (nth (1- from) stacks))))
    (setf (nth (1- from) stacks) right)
    (setf (nth (1- to) stacks) (append left (nth (1- to) stacks)))
    stacks))

(defun part-1 ()
  (let ((result (destructuring-bind (stacks moves) (read-input)
                  (loop :for (num from to) :in moves
                        :doing (dotimes (_ num) (move-crate stacks from to))
                        :finally (return stacks)))))
    (coerce (mapcar #'car result) 'string)))

(defun part-2 ()
  (let ((result (destructuring-bind (stacks moves) (read-input)
                  (loop :for (num from to) :in moves
                        :do (move-substack stacks num from to)
                        :finally (return stacks)))))
    (coerce (mapcar #'car result) 'string)))
