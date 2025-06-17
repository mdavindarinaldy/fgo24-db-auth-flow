-- Active: 1750127612684@@127.0.0.1@5432@postgres@public

CREATE TABLE user_accounts (
    id_user_accounts SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(16) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(255)
);

CREATE TABLE login (
    id_login SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE session (
    id_session SERIAL PRIMARY KEY,
    token VARCHAR(255) NOT NULL,
    status BOOLEAN NOT NULL,
    id_login INT NOT NULL,
    id_user_accounts INT NOT NULL
);

ALTER TABLE session 
ADD CONSTRAINT fk_session_login 
FOREIGN KEY (id_login)
REFERENCES login(id_login);

ALTER TABLE session 
ADD CONSTRAINT fk_session_user 
FOREIGN KEY (id_user_accounts)
REFERENCES user_accounts(id_user_accounts);

ALTER TABLE user_accounts
ADD CONSTRAINT fk_user_name
CHECK (char_length(name) >= 3);

INSERT INTO user_accounts(name, password, email, phone_number)
VALUES
('Bahtiar','123','bahtiar@gmail.com','081'),
('Ilham','123','ilham@gmail.com','082'),
('Adan','123','adan@gmail.com','081'),
('Rana','123','rana@gmail.com','083'),
('Hosi','123','hosi@gmail.com','084');
SELECT * FROM user_accounts;

INSERT INTO login(email,password)
VALUES
('bahtiar@gmail.com','123'),
('ilham@gmail.com','123'),
('rana@gmail.com','123');
SELECT * FROM login;

INSERT INTO session(token,status,id_login,id_user_accounts)
VALUES
('t1',true,1,1),
('t2',true,2,2),
('t3',true,3,4);
SELECT * FROM session;

SELECT * FROM users_accounts ua
JOIN session s ON s.id_user_accounts = ua.id_user_accounts;

