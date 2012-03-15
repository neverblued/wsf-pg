Web Site Framework database module
==================================

```cl
(defparameter test
  (make-instance 'database-server
                 :database "test-database"))

(defmethod respond ((server (eql test)) request)
  (process-test-queries request))
```
