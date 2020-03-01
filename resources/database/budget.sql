drop table budget;

create table budget
(
    id INTEGER not null
        primary key autoincrement,
    month INTEGER not null,
    description TEXT not null,
    expense_category INTEGER not null,
    value REAL not null,
    date TEXT not null,
    is_paid INTEGER default 0 not null,
    FOREIGN KEY (expense_category) REFERENCES expense_category(id)
);

