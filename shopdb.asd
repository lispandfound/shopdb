;;;; shopdb.asd

(asdf:defsystem #:shopdb
  :description "Describe shopdb here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:hunchentoot
               #:sxql
               #:sqlite
               #:cl-who
               #:cl-ppcre)
  :serial t
  :components ((:file "package")
               (:file "src/shopdb"))
  :in-order-to ((test-op (test-op shopdb-test))))

(defsystem shopdb-test
  :depends-on (:shopdb
               :prove)
  :defsystem-depends-on (:prove-asdf)
  :components
  ((:file "package")
   (:test-file "test/database"))
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run) :prove) c)))
