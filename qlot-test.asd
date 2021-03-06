#|
  This file is a part of qlot project.
  Copyright (c) 2014 Eitaro Fukamachi (e.arrows@gmail.com)
|#

(in-package :cl-user)
(defpackage qlot-test-asd
  (:use :cl :asdf))
(in-package :qlot-test-asd)

(defsystem qlot-test
  :author "Eitaro Fukamachi"
  :license "MIT"
  :depends-on (:qlot
               :qlot-install
               :uiop
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "parser")
                 (:test-file "server")
                 (:test-file "qlot"))))

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove.asdf) c)))
