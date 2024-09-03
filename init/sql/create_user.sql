-- ログインユーザとして使うsigmaを作成する --
SELECT CURRENT_USER();
CREATE USER 'sigma'@'%' IDENTIFIED BY 'password';
-- localhost以外からもアクセス可能にする
--NOTE: CREATE USERとuser名とhost名を同一にして権限付与する必要がある。
GRANT ALL PRIVILEGES ON *.* TO 'sigma'@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'sigma'@'%'

