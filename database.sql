--
-- Copyright:     (c) 2017, Pierre-Henry Soria. All Rights Reserved.
-- License:       GNU General Public License <https://www.gnu.org/licenses/gpl-3.0.en.html>
--

CREATE TABLE user (
  userId int(11) unsigned NOT NULL AUTO_INCREMENT,
  hash varchar(20) NOT NULL,
  email varchar(120) NOT NULL,
  password varchar(120) NOT NULL,
  fullname varchar(250) NOT NULL,
  isTwoFactorAuth enum('1','0') DEFAULT '0',
  twoFactorAuthSecret varchar(40) DEFAULT NULL,
  UNIQUE KEY (hash),
  UNIQUE KEY (email),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE payment (
  userId int(11) unsigned NOT NULL,
  paymentGateway enum('stripe','paypal') NOT NULL DEFAULT 'stripe',
  publishableKey varchar(40) DEFAULT NULL,
  secretKey varchar(40) DEFAULT NULL,
  businessName varchar(100) NOT NULL,
  itemName varchar(100) NOT NULL,
  currency char(3) NOT NULL DEFAULT 'USD',
  amount decimal(8, 2) NOT NULL DEFAULT '0.00',
  isBitcoin tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;