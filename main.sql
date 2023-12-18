/*
 * Keepcoding. Modelado y SQL. Solución ejercicio alumnos
 * 
 */


-- NOTA: cambiar 'oodhuafv' por vuestro usuario

CREATE SCHEMA practica AUTHORIZATION oodhuafv; 



/* --------------------------------------------- */
/* Grupo Empresarial de coches                   */
/* --------------------------------------------- */

create table practica.carsgroup(
    id SERIAL not null, /* tipo autonumerico*/
    name varchar(200) not null,
    description varchar(512) null
);

alter table practica.carsgroup
add constraint carsgroup_PK primary key (id);


insert into practica.carsgroup (name, description) values('VAN','Audi, seat, VW, Skoda');
insert into practica.carsgroup (name, description) values('RENAULT','Renault, Nissan');


/* --------------------------------------------- */
/* Marcas de coches                              */
/* --------------------------------------------- */

create table practica.carsbrand(
    id_marca SERIAL not null, /* tipo autonumerico*/
    name varchar(200) not null,
    id_group int not null, /*is FK*/
    description varchar(512) null
);

alter table practica.carsbrand
add constraint cars_PK primary key (id_marca);

alter table  practica.carsbrand
add constraint cars_FK foreign key (id_group) references practica.carsgroup(id);



insert into practica.carsbrand(name, id_group, description) values ('VW',1, NULL);
insert into practica.carsbrand(name, id_group) values ('Audi',1);
insert into practica.carsbrand(name, id_group) values ('Seat',1);
insert into practica.carsbrand(name, id_group) values ('Skoda',1);

insert into practica.carsbrand(name, id_group) values ('Renault',2);
insert into practica.carsbrand(name, id_group) values ('Nissan',2);




/* --------------------------------------------- */
/* Modelos de coches                              */
/* --------------------------------------------- */

create table practica.carsModels(
    id_model SERIAL not null, /* tipo autonumerico*/
    name varchar(200) not null,
    id_marca int not null, /*is FK*/
    description varchar(512) null,
    dt_start date not null,
    dt_end date null default '4000-01-01' -- fin por defecto
);

alter table practica.carsModels
add constraint carsModels_PK primary key (id_model);

alter table  practica.carsModels
add constraint carsModels_FK foreign key (id_marca) references practica.carsbrand(id_marca);


insert into practica.carsmodels  (name, id_marca, description, dt_start) values ('Golf', 1, 'El Golf de toda la vida', '1980-01-01');
insert into practica.carsmodels  (name, id_marca, description, dt_start) values ('Passat', 1, '', '1980-01-01');
insert into practica.carsmodels  (name, id_marca, description, dt_start) values ('A6', 2, '', '1980-01-01');
insert into practica.carsmodels  (name, id_marca, description, dt_start) values ('A5', 2, '', '1980-01-01');
insert into practica.carsmodels  (name, id_marca, description, dt_start) values ('A3', 2, '', '1980-01-01');
insert into practica.carsmodels  (name, id_marca, description, dt_start) values ('A2', 2, '', '2000-01-01');
insert into practica.carsmodels  (name, id_marca, description, dt_start) values ('A1', 2, '', '2010-01-01');
insert into practica.carsmodels  (name, id_marca, description, dt_start) values ('Scenic', 5, '', '1995-01-01');
insert into practica.carsmodels  (name, id_marca, description, dt_start) values ('Laguna', 5, '', '1995-01-01');
insert into practica.carsmodels  (name, id_marca, description, dt_start) values ('Xtrail', 6, '', '1995-01-01');
insert into practica.carsmodels  (name, id_marca, description, dt_start) values ('Micra', 6, '', '1995-01-01');
insert into practica.carsmodels  (name, id_marca, description, dt_start) values ('Quasqui', 6, '', '2005-01-01');






/* --------------------------------------------- */
/* Colores de coches                              */
/* --------------------------------------------- */

create table practica.carcolors(
    id SERIAL not null, /* tipo autonumerico*/
    name varchar(200) not null
);

alter table practica.carcolors
add constraint carcolors_PK primary key (id);

insert into practica.carcolors (name) values ('Blanco');
insert into practica.carcolors (name) values ('Negro');
insert into practica.carcolors (name) values ('Rojo');
insert into practica.carcolors (name) values ('Azul');
insert into practica.carcolors (name) values ('Verde');


/* --------------------------------------------- */
/* Empresas de seguros                           */
/* --------------------------------------------- */

create table practica.aseguradoras(
    id SERIAL not null, /* tipo autonumerico*/
    name varchar(200) not null
);

alter table practica.aseguradoras
add constraint aseguradoras_PK primary key (id);


insert into practica.aseguradoras (name) values ('Axa');
insert into practica.aseguradoras (name) values ('Mutua Madrileña');
insert into practica.aseguradoras (name) values ('Mapfre');





/* --------------------------------------------- */
/* tipos de monedas                              */
/* --------------------------------------------- */

create table practica.currency(
    id varchar(10) not null, 
    name varchar(200) not null
);

alter table practica.currency
add constraint currency_PK primary key (id);


insert into practica.currency (id, name) values ('EUR', 'Euro');
insert into practica.currency (id, name) values ('DOL', 'Dolar');





/* --------------------------------------------- */
/* Coches de la Empresa keepcoding               */
/* --------------------------------------------- */

create table practica.kc_cars(
    id SERIAL not null, /* PK, autonumeric*/
    id_model int not null, --FK . modelo coche
    dt_compra date not null,
    dt_termination date null default '4000-01-01',
    matricula varchar(20) not null,
    id_color int not null, --FK - colores
    tot_kms int null default 0,
    id_aseguradora int not null, -- FK- aseguradoras
    num_poliza_seguro varchar(100) not null,
    description varchar(512) null
);

--PK
alter table practica.kc_cars
add constraint kc_cars_PK primary key (id);

--FK modelo
alter table  practica.kc_cars
add constraint kc_cars_model_FK foreign key (id_model) references practica.carsModels(id_model);

--FK colores
alter table  practica.kc_cars
add constraint kc_cars_color_FK foreign key (id_color) references practica.carcolors(id);

--FK colores
alter table  practica.kc_cars
add constraint kc_cars_aseguradora_FK foreign key (id_aseguradora) references practica.aseguradoras(id);



insert into practica.kc_cars (id_model, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro) values (10, '2022-08-01','2234 LZV', 2, 850,1,'24703894203452439242');
insert into practica.kc_cars (id_model, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro) values (1, '2018-02-14','2234 KHT', 2, 45600,2,'473298749823749818024');
insert into practica.kc_cars (id_model, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro) values (3, '2021-11-01','2322 LTS', 2, 11200,1,'A83274394239498237492');
insert into practica.kc_cars (id_model, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro) values (6, '2022-01-01','1928 LZA', 2, 3452,1,'098274932749237423423');




/* --------------------------------------------- */
/* Revisiones de un coche             */
/* --------------------------------------------- */

create table practica.kc_cars_revisions(
    id_car int not null, --PK multiple
    dt_revision date not null, -- PK multiple
    importe decimal not null,
    id_currency varchar(20) not null,
    kms int not null,
    description varchar(512) null
);

--PK
alter table practica.kc_cars_revisions
add constraint kc_cars_revisions_PK primary key (id_car, dt_revision); --PK multiple

--FK coches de Keepcoding
alter table  practica.kc_cars_revisions
add constraint kc_cars_revisions_FK foreign key (id_car) references practica.kc_cars(id);


insert into practica.kc_cars_revisions values (1, '2022-09-01', 245.5, 'EUR', 1000, 'Primera revision de aceite rodaje');
insert into practica.kc_cars_revisions values (2, '2019-02-20', 456.5, 'EUR', 20000, 'Año 1');
insert into practica.kc_cars_revisions values (2, '2020-02-12', 420.5, 'EUR', 30000, 'Año 2');
insert into practica.kc_cars_revisions values (2, '2021-02-08', 375.5, 'EUR', 45000, 'Año 3');
insert into practica.kc_cars_revisions values (3, '2022-01-01', 520.5, 'EUR', 10500, 'Año 1');
