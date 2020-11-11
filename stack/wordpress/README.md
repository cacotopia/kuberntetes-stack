# WordPress

## Install 

### MariaDB数据库外部化

1. 创建数据库，用户并授权

```sql
CREATE DATABASE `wordpress` 
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE USER 'wordpress'@'%' IDENTIFIED BY 'wordpress';

GRANT ALL ON wordpress.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;
```

2. 修改数据库配置

```yml
##
## External Database Configuration
##
## All of these values are only used when mariadb.enabled is set to false
##
externalDatabase:
  ## Database host
  ##
  host: 192.168.8.228

  ## non-root Username for Wordpress Database
  ##
  user: wordpress

  ## Database password
  ##
  password: "wordpress"

  ## Database name
  ##
  database: wordpress

  ## Database port number
  ##
  port: 3306
```

## 安装

```shell
helm install --namespace ${namespace} -f {values-file}.yaml  wordpress wordpress/
```

## 升级

```shell
helm upgrade --namespace ${namespace} -f {values-file}.yaml  wordpress wordpress/
```
