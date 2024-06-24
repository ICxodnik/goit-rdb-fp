use pandemic;

create table infectious_cases
(
    Id                   int       primary key auto_increment ,
    Entity               varchar(50) not null,
    Code                 varchar(10) null,
    Year                 YEAR        not null,
    Number_yaws          int         null,
    Polio_cases          int         null,
    Cases_guinea_worm    int         null,
    Number_rabies        real        null,
    Number_malaria       real        null,
    Number_hiv           real        null,
    Number_tuberculosis  real        null,
    Number_smallpox      real        null,
    Number_cholera_cases int         null
);