(asdf:defsystem "aoc2022"
  :serial t
  :author "Alex Sun"
  :description "Advent of Code 2022"
  :depends-on (:alexandria
               :uiop
               :cl-ppcre
               :split-sequence)
  :components ((:file "src/day1")
               (:file "src/day2")
               (:file "src/day3")
               (:file "src/day4")))
