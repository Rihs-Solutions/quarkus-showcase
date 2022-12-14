-- Entry Table
CREATE TABLE Entry (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  autor VARCHAR(255) NOT NULL,
  content VARCHAR(10000) NOT NULL
);

-- Comment Table
CREATE TABLE Comment (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  entry_id bigint DEFAULT NULL,
  userId VARCHAR(255) NOT NULL,
  comment VARCHAR(1000) NOT NULL,
  date DATETIME NOT NULL,
  CONSTRAINT FK_COMMENT_ENTRY FOREIGN KEY (entry_id) REFERENCES Entry (id)
);

-- UserLikes
CREATE TABLE UserLikes (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  entry_id bigint DEFAULT NULL,
  userId VARCHAR(255) NOT NULL,
  CONSTRAINT FK_LIKES_ENTRY FOREIGN KEY (entry_id) REFERENCES Entry (id)
);