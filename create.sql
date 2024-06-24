create table "user"
(
    fname   text not null,
    lname   text not null,
    id      uuid not null
        constraint user_pk
            primary key,
    pswd    text not null,
    email   text not null,
    rating  double precision,
    socials text,
    phone   text not null,
    address text not null
);

alter table "user"
    owner to postgres;

create unique index user_id_uindex
    on "user" (id);

create table email
(
    id        uuid not null
        constraint email_pk
            primary key,
    sender    uuid not null
        constraint fk_email_sender
            references "user",
    recipient uuid not null
        constraint fk_email_recipient
            references "user",
    subject   text not null,
    body      text not null
);

alter table email
    owner to postgres;

create index idx_email_sender
    on email (sender);

create index idx_email_recipient
    on email (recipient);

create table cleaning
(
    id            uuid not null
        constraint cleaning_pk
            primary key,
    status        integer,
    startdatetime text not null,
    enddatetime   text not null,
    cleaner       uuid not null
        constraint fk_cleaning_cleaner
            references "user",
    consumer      uuid not null
        constraint fk_cleaning_consumer
            references "user",
    ctype         uuid not null
);

alter table cleaning
    owner to postgres;

create index idx_cleaning_cleaner
    on cleaning (cleaner);

create index idx_cleaning_consumer
    on cleaning (consumer);

create table company
(
    managers       uuid not null
        constraint fk_company_managers
            references "user",
    workers        uuid not null
        constraint fk_company_workers
            references "user",
    administrators uuid not null
        constraint fk_company_admins
            references "user",
    name           text not null,
    ico            text not null
        constraint company_pk
            primary key,
    services       uuid not null
);

alter table company
    owner to postgres;

create unique index company_ico_uindex
    on company (ico);

create index idx_company_managers
    on company (managers);

create index idx_company_workers
    on company (workers);

