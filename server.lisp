;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(in-package #:wsf)

(defgeneric server-database (database-server))

(defclass database-server ()
  ((database :initarg :database :accessor server-database :initform nil)))

(defmethod respond ((server database-server) request)
  (aif (server-database server)
       (with-database it (call-next-method))
       (call-next-method)))
