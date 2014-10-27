#!/bin/bash

mysql -u nova -p'!QAZ3edc%TGB' -h mysql_slave ruooglenova < paid_users.sql |sort -n >user_paid_in_1004
