create database neomind_challenge;

create table SUPPLIER (
	ID bigint unsigned not null auto_increment,
    NAME varchar(255) not null,
    EMAIL varchar(255) not null,
    FEDERAL_CODE varchar(255) not null,
    COMMENT varchar(1000) not null,
    constraint pk_id primary key (id)
);
