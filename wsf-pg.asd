;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(defpackage #:wsf-pg-system
  (:use #:common-lisp #:asdf))

(in-package #:wsf-pg-system)

(defsystem "wsf-pg"
  :description "Web Site Framework postgres module"
  :version "0.1"
  :author "Дмитрий Пинский <demetrius@neverblued.info>"
  :depends-on (#:wsf #:postgrace)
  :serial t
  :components ((:file "package")
               (:file "server")))
