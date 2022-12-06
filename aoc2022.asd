(asdf:defsystem "aoc2022"
  :serial t
  :author "Alex Sun"
  :description "Advent of Code 2022"
  :depends-on (:alexandria
               :uiop
               :split-sequence)
  :components ((:file "src/day1")))
