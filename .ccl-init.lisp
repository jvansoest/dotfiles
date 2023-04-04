;;; loading Quicklisp
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

;;; loading Babel
(load "/Users/jeroenvansoest/ehai-babel/libraries/asdf")
(load "/Users/jeroenvansoest/ehai-babel/init-babel")




