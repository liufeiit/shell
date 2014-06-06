SELECT CONCAT(
  '*4\r\n$6\r\nSETBIT\r\n$17\r\ninit:offline:chat\r\n$', LENGTH(userId), '\r\n',
  userId, '\r\n',
  '$1\r\n1\r'
)
FROM ruooglenova.nova_user_operation
WHERE operationType = 13
