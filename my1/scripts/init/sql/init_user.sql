-- MySQLのユーザー設定

ALTER USER `root`@`localhost` IDENTIFIED BY 'MyStrongPassword_1234';

CREATE USER IF NOT EXISTS `guest`@`%` IDENTIFIED BY 'MyStrongPassword_1234';
GRANT ALL PRIVILEGES ON *.* TO `guest`@`%` WITH GRANT OPTION;

FLUSH PRIVILEGES;

SELECT "              ";
SELECT user, host, plugin FROM mysql.user;
SELECT "              ";
