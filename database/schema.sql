CREATE DATABASE IF NOT EXISTS blazycoin CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE blazycoin;

CREATE TABLE users (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  public_id CHAR(26) NOT NULL UNIQUE,
  email VARCHAR(190) NULL UNIQUE,
  phone VARCHAR(30) NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  referral_code VARCHAR(32) NOT NULL UNIQUE,
  referred_by BIGINT UNSIGNED NULL,
  status ENUM('active','suspended','deleted') NOT NULL DEFAULT 'active',
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_users_referred_by (referred_by),
  CONSTRAINT fk_users_referrer FOREIGN KEY (referred_by) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE wallets (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL UNIQUE,
  balance_microblazy BIGINT UNSIGNED NOT NULL DEFAULT 0,
  lifetime_earned_microblazy BIGINT UNSIGNED NOT NULL DEFAULT 0,
  lifetime_spent_microblazy BIGINT UNSIGNED NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_wallet_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE ledger_transactions (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  transaction_id CHAR(36) NOT NULL UNIQUE,
  user_id BIGINT UNSIGNED NOT NULL,
  type ENUM('game_reward','referral_reward','admin_adjustment','spend','reversal') NOT NULL,
  amount_microblazy BIGINT NOT NULL,
  reference_type VARCHAR(50) NULL,
  reference_id VARCHAR(100) NULL,
  idempotency_key VARCHAR(100) NOT NULL UNIQUE,
  metadata JSON NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_ledger_user_created (user_id, created_at),
  CONSTRAINT fk_ledger_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE game_challenges (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  challenge_id CHAR(36) NOT NULL UNIQUE,
  user_id BIGINT UNSIGNED NOT NULL,
  level SMALLINT UNSIGNED NOT NULL,
  challenge_payload JSON NOT NULL,
  solution_hash CHAR(64) NOT NULL,
  nonce CHAR(64) NOT NULL,
  status ENUM('issued','completed','expired','rejected') NOT NULL DEFAULT 'issued',
  issued_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  completed_at DATETIME NULL,
  INDEX idx_challenges_user_status (user_id, status),
  CONSTRAINT fk_challenge_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE reward_pool (
  id TINYINT UNSIGNED PRIMARY KEY,
  available_microblazy BIGINT UNSIGNED NOT NULL DEFAULT 0,
  total_funded_microblazy BIGINT UNSIGNED NOT NULL DEFAULT 0,
  total_distributed_microblazy BIGINT UNSIGNED NOT NULL DEFAULT 0,
  daily_cap_microblazy BIGINT UNSIGNED NOT NULL DEFAULT 0,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO reward_pool (id) VALUES (1);

CREATE TABLE referral_events (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  referrer_user_id BIGINT UNSIGNED NOT NULL,
  referred_user_id BIGINT UNSIGNED NOT NULL UNIQUE,
  status ENUM('pending','qualified','rewarded','rejected') NOT NULL DEFAULT 'pending',
  reward_microblazy BIGINT UNSIGNED NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  qualified_at DATETIME NULL,
  rewarded_at DATETIME NULL,
  CONSTRAINT fk_referral_referrer FOREIGN KEY (referrer_user_id) REFERENCES users(id) ON DELETE RESTRICT,
  CONSTRAINT fk_referral_referred FOREIGN KEY (referred_user_id) REFERENCES users(id) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE security_events (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED NULL,
  event_type VARCHAR(80) NOT NULL,
  severity ENUM('info','warning','critical') NOT NULL DEFAULT 'info',
  ip_hash CHAR(64) NULL,
  device_hash CHAR(64) NULL,
  metadata JSON NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_security_user_created (user_id, created_at),
  INDEX idx_security_type_created (event_type, created_at),
  CONSTRAINT fk_security_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB;
