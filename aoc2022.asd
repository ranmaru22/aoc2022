(asdf:defsystem "aoc2022"
  :serial t
  :author "Alex Sun"
  :description "Advent of Code 2022"
  :depends-on (#:alexandria
               #:uiop
               #:cl-ppcre
               #:str)
  :components ((:file "package")
               (:module "src"
                :components
                ((:file "day1")
                 (:file "day2")
                 (:file "day3")
                 (:file "day4")
                 (:file "day5")
                 (:file "day6")
                 (:file "day7")))))
