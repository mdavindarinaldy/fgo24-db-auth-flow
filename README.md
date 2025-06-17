# Auth-FLOW

This project was made by Muhammad Davinda Rinaldy in Training Program held by Kodacademy to make ERD of authentication flow, using mermaid tool and make query (PostgreSQL) to create table and modifies it.

## Entity Relationship Diagram (ERD)

```mermaid
erDiagram
    direction LR
    login {
        varchar id_login PK
        varchar email
        varchar password
    }
    user_accounts {
        varchar id_users PK
        varchar name
        varchar email
        varchar password
        varchar phone_number
        varchar id_register FK
    }
    session {
        varchar id_session PK
        varchar token
        bool status
        varchar id_login FK
    }

    login }o--|| session : make
    session ||--o{ user_accounts : access
```
