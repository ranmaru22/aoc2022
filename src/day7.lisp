(defpackage #:aoc2022-day7
  (:nicknames #:day7)
  (:use #:cl))

(in-package #:aoc2022-day7)

(defstruct dir (name) (contents))
(defstruct file (name) (size 0))

(defun mkdir (parent dirname)
  (setf (dir-contents parent)
        (cons (make-dir :name dirname) (dir-contents parent))))

(defun touch (parent filename size)
  (setf (dir-contents parent)
        (cons (make-file :name filename :size size) (dir-contents parent))))


(defun read-instructions ()
  (let ((instructions (uiop:read-file-lines "./input/day7.in")))
    (mapcar
     (lambda (instruction)
       (let ((beg (car (ppcre:split "\\s" instruction))))
         (cond
           ((string= beg "$") 'command)
           ((string= beg "dir") 'folder)
           ((every #'digit-char-p beg) 'file)))
       )
     instructions)))
