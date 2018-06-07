-- +micrate Up
CREATE TABLE users (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id INT,
  username VARCHAR(255),
  password VARCHAR(255),
  key VARCHAR(255),
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);


-- +micrate Down
DROP TABLE IF EXISTS users;
