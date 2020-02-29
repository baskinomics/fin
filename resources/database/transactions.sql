CREATE TABLE transactions
(
    id           INTEGER NOT NULL PRIMARY KEY,
    account      INTEGER NOT NULL,
    posting_date TEXT    NOT NULL,
    description  TEXT    NOT NULL,
    value        REAL    NOT NULL
);
