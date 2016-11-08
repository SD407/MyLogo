CREATE DATABASE `mylogo` /*!40100 DEFAULT CHARACTER SET utf8 */;


CREATE TABLE `persistent_logins` (
  `series` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `users_user_role` (
  `user_id` bigint(20) NOT NULL,
  `user_role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`user_role_id`),
  KEY `FK_USER_ROLE` (`user_role_id`),
  CONSTRAINT `FK_USERS` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_USER_ROLE` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `commissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_name` varchar(30) NOT NULL,
  `order_details` varchar(250) NOT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_name` (`order_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


CREATE TABLE `users_user_commissions` (
  `user_id` bigint(20) NOT NULL,
  `user_commission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`user_commission_id`),
  KEY `FK_USER_COMMISSION` (`user_commission_id`),
  CONSTRAINT `FK_COM_USERS` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_USER_COMMISSION` FOREIGN KEY (`user_commission_id`) REFERENCES `commissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO USER_ROLE(role)
VALUES ('USER');
  
INSERT INTO USER_ROLE(role)
VALUES ('ADMIN');
  
INSERT INTO USER_ROLE(role)
VALUES ('DBA');