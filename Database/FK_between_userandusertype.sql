ALTER TABLE users
ADD CONSTRAINT FK_user_type_id FOREIGN KEY (user_type_id)
    REFERENCES user_type(user_type_id);