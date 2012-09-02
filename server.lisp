;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(in-package #:wsf-pg)

(defgeneric server-database
    (database-server))

(defclass database-server ()
  ((database :initarg :database :accessor server-database :initform nil)))

(defmethod respond :around
    ((server database-server) request)
  (aif (server-database server)
       (with-database it (call-next-method))
       (call-next-method)))

(defmacro with-server-database
    (&body body)
  `(aif (server-database *server*)
        (with-database it ,@body)
        (error "Server ~a database is null" *server*)))

(defclass database-server-system
    (lisp-server) ())

(defun password-pathname (system)
  (join (asdf:system-source-directory system)
        "/../../.postgres.pwd"))

(defmethod postgrace::password ()
  (let ((pathname (password-pathname (server-system *server*))))
    (unless (probe-file pathname)
      (error "Файл с паролем к БД '~a' не найден." pathname))
    (values (pathname-content pathname))))
