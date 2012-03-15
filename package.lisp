;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(defpackage #:wsf-pg
  (:use #:cl #:cl-blackjack
        #:wsf #:postgrace)
  (:export #:database-server
           #:server-database))
