SELECT CONCAT(
  '*4\r\n$4\r\nHSET\r\n$',16+LENGTH(userId),'\r\nbuy:private:msg:',userId,'\r\n$', LENGTH(touserId), '\r\n',
  touserId, '\r\n$', LENGTH(operationNumeric), '\r\n',
  operationNumeric, '\r'
)
FROM ruooglenova.nova_user_operation
WHERE operationType = 23
