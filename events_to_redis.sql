SELECT CONCAT(
  "*4\r\n",
  '$', LENGTH(redis_cmd), '\r\n',
  redis_cmd, '\r\n',
  '$', LENGTH(redis_key), '\r\n',
  redis_key, '\r\n',
  '$', LENGTH(offset), '\r\n',
  offset, '\r\n',
  '$', LENGTH(value), '\r\n',
  value, '\r'
)
FROM (
  SELECT
  'SETBIT' as redis_cmd,
  'init:offline:chat' AS redis_key,
  userId AS offset,
  '1' AS value
  FROM ruooglenova.nova_user_operation
  WHERE operationType = 13
) AS t
