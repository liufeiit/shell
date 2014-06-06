SELECT CONCAT(
  '*4\r\n$4\r\nHSET\r\n$24\r\nrandom:match:total:times\r\n$', LENGTH(userId), '\r\n',
  userId, '\r\n$', LENGTH(operationNumeric), '\r\n',
  operationNumeric, '\r'
)
FROM ruooglenova.nova_user_operation
WHERE operationType = 14
