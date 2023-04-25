
;;;; build-image.lisp
;;;; build a customised sbcl image
;;;;
;;;; you can modify the package list by changing the *base-packages*
;;;; global variable. this is useful for building a custom binary with
;;;; your commonly used libraries already present (at the expense of
;;;; some memory) but will cut down on load times.

(in-package "CL-USER")

(load-all-patches)


;; list of packages to install - it's at the top so it's easier to change
(defparameter *base-packages* '(flexi-streams))

;;; load quicklisp and quickload the libraries to be baked in
;;; taken from quicklisp's addition to my .sbclrc
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(defun load-packages (package-list)
  (dolist (package (mapcar #'string package-list))
    (ql:quickload package)))

(format t "building LispWorks image")

(load-packages *base-packages*)

(format t "saving image...~%")

(save-image "~/lw-console"
            :console t
            :multiprocessing t
            :environment nil)
