--Alumno: Alberto  Junquera  Ramírez
--Bootcamp: Mobile

--TODO METER COCHES NO ACTICOS, esto se hace con fecha de baja, un coche que tiene un valor distinto al valor generico, 4000-01-01 significa que no se ha dado de baja,
-- si tiene fecha de baja, es que no esta en cactivo.

--TODO: delete all the selects

--0)Delete the schema in case that it does exit.
 drop schema if exists  ALBERTO_JR_DDL cascade;

--1) First, the SCHEMA shuld be declared.

create schema ALBERTO_JR_DDL authorization dboslder;


--2) Creation of the tables related with models ("car_models","brands" and "enterprise_groups")

-- --> enterprise_groups

create table alberto_jr_ddl.enterprise_groups(
	enterprise_group_id VARCHAR(50) not null, --PK
	name VARCHAR(516) not null,
	country VARCHAR(200) not null,
	description VARCHAR(516) null

);

alter table alberto_jr_ddl.enterprise_groups
add constraint enterprise_groups_PK primary key (enterprise_group_id);

-- --> loading the enterprise_groups_table

INSERT INTO alberto_jr_ddl.enterprise_groups 
(enterprise_group_id, name, country,description) 
values ('EGST2021','STELLANTIS N.V.','NETHERLANDS','Founded in 2021.');

INSERT INTO alberto_jr_ddl.enterprise_groups
(enterprise_group_id, name, country,description)
values ('EGVW1937','VOLKSWAGEN AG','GERMANY','Founded in 1937,');



-- --> brands table

create table alberto_jr_ddl.car_brands(
	brand_id VARCHAR(50) not null, --PK,
	enterprise_group_id VARCHAR(50)not null, --FK,
	name VARCHAR(516) not null

);


alter table alberto_jr_ddl.car_brands 
add constraint car_brands_PK primary key (brand_id);

alter table alberto_jr_ddl.car_brands 
add constraint enterprise_group_id_FK foreign key (enterprise_group_id)
references alberto_jr_ddl.enterprise_groups(enterprise_group_id);

-- --> loading car_brands table

INSERT INTO alberto_jr_ddl.car_brands
(brand_id,enterprise_group_id,name) 
values('BRSTVP','EGST2021','VIPER SRT');

INSERT INTO alberto_jr_ddl.car_brands 
(brand_id,enterprise_group_id,name) 
values('BRSTAR','EGST2021','ALFA ROMEO');

INSERT INTO alberto_jr_ddl.car_brands 
(brand_id,enterprise_group_id,name) 
values('BRJETT','EGVW1937','JETTA');

INSERT INTO alberto_jr_ddl.car_brands 
(brand_id,enterprise_group_id,name) 
values('BRSEAT','EGVW1937','SEAT');


-- --> car_models

create table alberto_jr_ddl.car_models(
	model_id VARCHAR(50) not null, --PK
	brand_id VARCHAR(50) not null, --FK
	name VARCHAR(50) not null,
	description VARCHAR(500) 
);

alter table alberto_jr_ddl.car_models 
add constraint car_model_PK primary key (model_id);

alter table alberto_jr_ddl.car_models 
add constraint brand_id_FK foreign key (brand_id)
references alberto_jr_ddl.car_brands(brand_id);

-- --> Loading models

INSERT INTO alberto_jr_ddl.car_models
(model_id,brand_id,name,description)
values('MOVIP15','BRSTVP','DODGE VIPER','The Dodge Viper is a sports car...');
INSERT INTO alberto_jr_ddl.car_models
(model_id,brand_id,name,description) 
values('MOCHR19','BRSTVP','CHRYSLER CROSSFIRE','The Chrysler Crossfire is an amazing...');
INSERT INTO alberto_jr_ddl.car_models
(model_id,brand_id,name,description)
values('MOSTL22','BRSTAR','STELVIO','The Stelvio is one of those cars....');
INSERT INTO alberto_jr_ddl.car_models
(model_id,brand_id,name,description)
values('MOTON23','BRSTAR','TONALE','Tonale is a compact crossover SUV ....');
INSERT INTO alberto_jr_ddl.car_models
(model_id,brand_id,name,description)
values('MOJTTVA20','BRJETT','JETTA VA3','This car has a lot of potential....');
INSERT INTO alberto_jr_ddl.car_models
(model_id,brand_id,name,description)
values('MOJTTVA21','BRJETT','JETTA VS5','This model has an improved engine compared with its predecessor....');
INSERT INTO alberto_jr_ddl.car_models
(model_id,brand_id,name,description)
values('MOSERO76','BRSEAT','SEAT RONDA','This model is an untarnished clasic...');
INSERT INTO alberto_jr_ddl.car_models
(model_id,brand_id,name,description)
values('MOSEMK184','BRSEAT','SEAT IBIZA MK1','One of those cars....');


--3) Creation of tables colours, insurance_companies, insurance_policies, inspection_state,  inspections

-- --> car_colors

create table alberto_jr_ddl.car_colors(
	color_id VARCHAR(25) not null, -- PK
	hex_color VARCHAR(6) not null,
	name VARCHAR(50) not null,
	description VARCHAR(200) 
);

alter table alberto_jr_ddl.car_colors 
add constraint car_colors_PK primary key (color_id);


-- --> loading car colors

INSERT INTO alberto_jr_ddl.car_colors
(color_id,hex_color,name,description)
values('RE-001','E90029','SPANISH RED','Deep bright red colour.');
INSERT INTO alberto_jr_ddl.car_colors
(color_id,hex_color,name,description)
values('BL-001','020122','XIKETIC','Deep black colour.');
INSERT INTO alberto_jr_ddl.car_colors
(color_id,hex_color,name,description)
values('OR-001','FF9F1C','ORANGE PEEL','Orange fruit colour.');
INSERT INTO alberto_jr_ddl.car_colors
(color_id,hex_color,name,description) 
values('LU-001','5C80BC','GLAUCOUS','Blue sailor pastel colour.');
INSERT INTO alberto_jr_ddl.car_colors
(color_id,hex_color,name,description) 
values('GE-001','9BC53D','ANDROID GREEN','Bright green colour.');
INSERT INTO alberto_jr_ddl.car_colors
(color_id,hex_color,name,description) 
values('PU-001','5F0F40','TYRIAN PURPLE','Average purple colour.');


-- -->Insurance companies

create table alberto_jr_ddl.insurance_companies(
	insurance_company_id VARCHAR(50) not null, --PK
	name VARCHAR(100) not null
	
	);

alter table alberto_jr_ddl.insurance_companies 
add constraint insurance_companies_PK primary key (insurance_company_id);


-- --> Loading insurance companies table

insert into alberto_jr_ddl.insurance_companies 
(insurance_company_id,name)
values ('MAP-XX23', 'MAPFRE');


insert into alberto_jr_ddl.insurance_companies 
(insurance_company_id,name)
values ('MTT-XX23', 'MTT');


insert into alberto_jr_ddl.insurance_companies 
(insurance_company_id,name)
values ('AXA-XX23', 'AXA');


-- --> insurance_policies table


create table alberto_jr_ddl.insurance_policies(
	insurance_policy_id VARCHAR(50) not null, --PK
	type VARCHAR(100) not null,
	cover_user_car VARCHAR(10) not null,
	description VARCHAR(500)
	);

alter table alberto_jr_ddl.insurance_policies
add constraint insurance_policies_PK primary key (insurance_policy_id);


-- --> loading insurance_policies

INSERT INTO alberto_jr_ddl.insurance_policies
(insurance_policy_id, type, cover_user_car, description)
values('INPO-01','LIABILITY COVERAGE','NO','Includes the basic bodily injury liability and property damage liability.');
INSERT INTO alberto_jr_ddl.insurance_policies
(insurance_policy_id, type, cover_user_car, description) 
values('INPO-02','COMPREHENSIVE COVERAGE','YES','Includes damage to the insuranced car like theft, fire, hail or vansalism.');
INSERT INTO alberto_jr_ddl.insurance_policies
(insurance_policy_id, type, cover_user_car, description)
values('INPO-03','COLLISION COVERAGE','YES','Cover some things in case of a collission such as fences, walls.');
INSERT INTO alberto_jr_ddl.insurance_policies
(insurance_policy_id, type, cover_user_car, description) 
values('INPO-04','PERSONAL INJURY PROTECTION ','NO','Covers the healthcare of the iperson driving the insuranced car.');





-- --> inspection state 

create table alberto_jr_ddl.inspection_states(
	inspection_state_id VARCHAR(50) not null, --PK
	name VARCHAR(50) not null
	
	);

alter table alberto_jr_ddl.inspection_states
add constraint inspection_state_PK primary key (inspection_state_id);


-- --> Loading inspection state

insert into alberto_jr_ddl.inspection_states
(inspection_state_id, name)
values('01','SUCCEDED');


insert into alberto_jr_ddl.inspection_states
(inspection_state_id, name)
values('02','FAILED');

insert into alberto_jr_ddl.inspection_states
(inspection_state_id, name)
values('03','PENDING');

insert into alberto_jr_ddl.inspection_states
(inspection_state_id, name)
values('04','UNKNOWN');



-- --> inspections
create table alberto_jr_ddl.inspections(
	inspection_id VARCHAR(50) not null, --PK
	name VARCHAR(50) not null,
	description VARCHAR(500)
	
	);

alter table alberto_jr_ddl.inspections
add constraint inspections_PK primary key (inspection_id);
-- --> loading inspections


INSERT INTO alberto_jr_ddl.inspections
(inspection_id, name, description) 
values ('IN-FU-01','FULL INSPECTION','A full inspection is done to check everything.');
INSERT INTO alberto_jr_ddl.inspections 
(inspection_id, name, description) 
values ('IN-IN-01','INSURANCE INSPECTION','An inspection required when insuring a vehicle that is 10 years or ....');
INSERT INTO alberto_jr_ddl.inspections
(inspection_id, name, description) 
values ('IN-WE-01','BASIC TIRE WEAR','Basic inspection of the wheel tires.');
INSERT INTO alberto_jr_ddl.inspections 
(inspection_id, name, description)
values ('IN-WE-02','FULL TIRE WEAR','Advances tire wear inspection.');
INSERT INTO alberto_jr_ddl.inspections 
(inspection_id, name, description)
values ('IN-BR-01','BRAKES','Brakes checkup.');




-- --> Currency
create table alberto_jr_ddl.currencies(
	currency_id VARCHAR(50) not null, --PK
	name VARCHAR(100) not null,
	symbol VARCHAR(10) not null
	
	);

alter table alberto_jr_ddl.currencies
add constraint currencies_PK primary key (currency_id);
-- --> loading currency

insert into alberto_jr_ddl.currencies 
(currency_id,name,symbol)
values('EU-123','EURO','€');


insert into alberto_jr_ddl.currencies 
(currency_id,name,symbol)
values('US-234','US DOLLAR','$');


insert into alberto_jr_ddl.currencies 
(currency_id,name,symbol)
values('YE-345','YEN','¥');

-- select * from alberto_jr_ddl.currencies;

--4) multilinked tables: Cars, car_inspections and car_insurance_policy

-- --> CARS

create table alberto_jr_ddl.cars(
	car_id VARCHAR(50) not null, --PK
	model_id VARCHAR(50) not null, --FK
	color_id VARCHAR(25) not null, --FK
	license_plate_number VARCHAR(8) not null,
	total_km FLOAT(10),
	purchased_dt DATE,
	dispose_dt DATE not null default '4000-01-01'
	
);


alter table alberto_jr_ddl.cars 
add constraint cars_PK primary key (car_id);

alter table alberto_jr_ddl.cars 
add constraint model_id_FK foreign key (model_id)
references alberto_jr_ddl.car_models (model_id);

alter table alberto_jr_ddl.cars 
add constraint color_id_FK foreign key (color_id)
references alberto_jr_ddl.car_colors (color_id);

-- --> Loading cars table

INSERT INTO alberto_jr_ddl.cars 
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt)
values('VC-01','MOVIP15','RE-001','9018 JQE','834','2023-01-01');
INSERT INTO alberto_jr_ddl.cars
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt, dispose_dt) 
values('VC-02','MOCHR19','BL-001','7422 BRL','2346','2023-01-02','2023-01-15');
INSERT INTO alberto_jr_ddl.cars 
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt)
values('VC-03','MOSTL22','OR-001','2491 TUT','2972','2023-01-03');
INSERT INTO alberto_jr_ddl.cars
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt,dispose_dt)
values('VC-04','MOTON23','LU-001','1292 NWX','4593','2023-01-04','2023-01-15');
INSERT INTO alberto_jr_ddl.cars
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt,dispose_dt)
values('VC-05','MOJTTVA20','GE-001','8155 LLB','4644','2023-01-05','2023-01-15');
INSERT INTO alberto_jr_ddl.cars
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt)
values('VC-06','MOJTTVA21','PU-001','4564 HWO','2763','2023-01-06');
INSERT INTO alberto_jr_ddl.cars 
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt)
values('VC-07','MOSERO76','RE-001','7701 UDZ','2593','2023-01-07');
INSERT INTO alberto_jr_ddl.cars 
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt)
values('VC-08','MOSEMK184','BL-001','1993 JIO','4697','2023-01-08');
INSERT INTO alberto_jr_ddl.cars
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt)
values('VC-09','MOVIP15','OR-001','2186 HKF','2255','2023-01-09');
INSERT INTO alberto_jr_ddl.cars 
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt,dispose_dt)
values('VC-10','MOCHR19','LU-001','6918 ARP','1450','2023-01-10','2023-01-15');
INSERT INTO alberto_jr_ddl.cars 
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt) 
values('VC-11','MOSTL22','GE-001','6918 ARP','697','2023-01-11');
INSERT INTO alberto_jr_ddl.cars
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt)
values('VC-12','MOTON23','PU-001','1141 GFV','2334','2023-01-12');
INSERT INTO alberto_jr_ddl.cars 
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt,dispose_dt)
values('VC-13','MOJTTVA20','RE-001','6762 NDZ','2824','2023-01-13','2023-01-15');
INSERT INTO alberto_jr_ddl.cars
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt)
values('VC-14','MOJTTVA21','BL-001','0932 ECD','4794','2023-01-14');
INSERT INTO alberto_jr_ddl.cars
(car_id,model_id, color_id,license_plate_number,total_km,purchased_dt)
values('VC-15','MOSERO76','OR-001','7188 FIN','2817','2023-01-15');


-- --> Car inspections

create table alberto_jr_ddl.car_inspections(
	car_id VARCHAR(50) not null, -- PK and FK
	inspection_id VARCHAR(50) not null, -- PK, FK
	inspection_dt DATE not null, -- PK
	inspection_state_id VARCHAR(50) not null, --FK
	inspection_report VARCHAR(500) not null,
	inspection_km FLOAT(10) not null,
	inspection_cost FLOAT(10) not null,
	currency_id VARCHAR(50) --FK
);

alter table alberto_jr_ddl.car_inspections
add constraint cars_inspections_PK primary key (car_id,inspection_id,inspection_dt);

alter table alberto_jr_ddl.car_inspections
add constraint car_inspections_car_id_FK foreign key (car_id)
references alberto_jr_ddl.cars (car_id);

alter table alberto_jr_ddl.car_inspections
add constraint car_inspections_inspection_id_FK foreign key (inspection_id)
references alberto_jr_ddl.inspections (inspection_id);

alter table alberto_jr_ddl.car_inspections
add constraint car_inspections_inspection_state_id_FK foreign key (inspection_state_id)
references alberto_jr_ddl.inspection_states (inspection_state_id);

alter table alberto_jr_ddl.car_inspections
add constraint car_inspections_currency_id_FK foreign key (currency_id)
references alberto_jr_ddl.currencies (currency_id);

-- Loading Car inspections

INSERT INTO alberto_jr_ddl.car_inspections
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id) 
values('VC-01','IN-FU-01','2023-01-01','01','""','584','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections 
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id)
values('VC-02','IN-IN-01','2023-01-02','01','""','2096','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id) 
values('VC-03','IN-WE-01','2023-01-03','01','""','2722','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections 
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id)
values('VC-04','IN-WE-02','2023-01-04','01','""','4343','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id)
values('VC-05','IN-BR-01','2023-01-05','01','""','4394','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id)
values('VC-06','IN-FU-01','2023-01-06','01','The tire of the wheels will expire soon.','2513','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id)
values('VC-07','IN-IN-01','2023-01-07','01','""','2343','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id) 
values('VC-08','IN-WE-01','2023-01-08','01','""','4447','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections 
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id) 
values('VC-09','IN-WE-02','2023-01-09','01','""','2005','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections 
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id)
values('VC-10','IN-BR-01','2023-01-10','01','""','1200','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id) 
values('VC-11','IN-FU-01','2023-01-11','01','""','447','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id) 
values('VC-12','IN-IN-01','2023-01-12','01','Missing some stickers','2084','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections 
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id) 
values('VC-13','IN-WE-01','2023-01-13','01','""','2574','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections 
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id)
values('VC-14','IN-WE-02','2023-01-14','01','""','4544','1000','EU-123');
INSERT INTO alberto_jr_ddl.car_inspections 
(car_id,inspection_id, inspection_dt, inspection_state_id, inspection_report, inspection_km, inspection_cost, currency_id) 
values('VC-15','IN-BR-01','2023-01-15','01','""','2567','1000','EU-123');


-- --> Car insurance_policy

create table alberto_jr_ddl.car_insurance_policy(
	car_id VARCHAR(50) not null, -- PK and FK
	insurance_policy_id VARCHAR(50) not null, -- PK, FK
	insurance_company_id VARCHAR(50) not null, -- PK FK
	insurance_policy_number VARCHAR(50) not null, --PK
	sign_dt DATE not null,
	expiration_dt DATE not null,
	notes VARCHAR(500)
);


alter table alberto_jr_ddl.car_insurance_policy
add constraint car_insurance_policy_PK primary key (car_id,insurance_policy_id,insurance_company_id,insurance_policy_number);

alter table alberto_jr_ddl.car_insurance_policy
add constraint car_insurance_policy_car_id_FK foreign key (car_id)
references alberto_jr_ddl.cars (car_id);

alter table alberto_jr_ddl.car_insurance_policy
add constraint car_insurance_policy_insurance_policy_id_FK foreign key (insurance_policy_id)
references alberto_jr_ddl.insurance_policies (insurance_policy_id);

alter table alberto_jr_ddl.car_insurance_policy
add constraint car_insurance_company_id_FK foreign key (insurance_company_id)
references alberto_jr_ddl.insurance_companies (insurance_company_id);

-- load data for car insurance policy

INSERT INTO alberto_jr_ddl.car_insurance_policy 
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes) 
values ('VC-01','INPO-01','MAP-XX23','VC-01/INPO-01/MAP-XX23','2023-01-01','2024-01-01','First car insuranced');
INSERT INTO alberto_jr_ddl.car_insurance_policy
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes) 
values ('VC-02','INPO-02','MTT-XX23','VC-02/INPO-02/MTT-XX23','2023-01-02','2024-01-02','This car had some problems.');
INSERT INTO alberto_jr_ddl.car_insurance_policy
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes) 
values ('VC-03','INPO-03','AXA-XX23','VC-03/INPO-03/AXA-XX23','2023-01-03','2024-01-03','""');
INSERT INTO alberto_jr_ddl.car_insurance_policy
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes) 
values ('VC-04','INPO-04','MAP-XX23','VC-04/INPO-04/MAP-XX23','2023-01-04','2024-01-04','""');
INSERT INTO alberto_jr_ddl.car_insurance_policy 
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes) 
values ('VC-05','INPO-01','MTT-XX23','VC-05/INPO-01/MTT-XX23','2023-01-05','2024-01-05','""');
INSERT INTO alberto_jr_ddl.car_insurance_policy
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes)
values ('VC-06','INPO-02','AXA-XX23','VC-06/INPO-02/AXA-XX23','2023-01-06','2024-01-06','""');
INSERT INTO alberto_jr_ddl.car_insurance_policy 
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes)
values ('VC-07','INPO-03','MAP-XX23','VC-07/INPO-03/MAP-XX23','2023-01-07','2024-01-07','""');
INSERT INTO alberto_jr_ddl.car_insurance_policy
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes) 
values ('VC-08','INPO-04','MTT-XX23','VC-08/INPO-04/MTT-XX23','2023-01-08','2024-01-08','""');
INSERT INTO alberto_jr_ddl.car_insurance_policy 
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes) 
values ('VC-09','INPO-01','AXA-XX23','VC-09/INPO-01/AXA-XX23','2023-01-09','2024-01-09','""');
INSERT INTO alberto_jr_ddl.car_insurance_policy
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes)
values ('VC-10','INPO-02','MAP-XX23','VC-10/INPO-02/MAP-XX23','2023-01-10','2024-01-10','""');
INSERT INTO alberto_jr_ddl.car_insurance_policy 
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes) 
values ('VC-11','INPO-03','MTT-XX23','VC-11/INPO-03/MTT-XX23','2023-01-11','2024-01-11','""');
INSERT INTO alberto_jr_ddl.car_insurance_policy 
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes) 
values ('VC-12','INPO-04','AXA-XX23','VC-12/INPO-04/AXA-XX23','2023-01-12','2024-01-12','""');
INSERT INTO alberto_jr_ddl.car_insurance_policy 
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes) 
values ('VC-13','INPO-01','MAP-XX23','VC-13/INPO-01/MAP-XX23','2023-01-13','2024-01-13','""');
INSERT INTO alberto_jr_ddl.car_insurance_policy 
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes) 
values ('VC-14','INPO-02','MTT-XX23','VC-14/INPO-02/MTT-XX23','2023-01-14','2024-01-14','""');
INSERT INTO alberto_jr_ddl.car_insurance_policy 
(car_id, insurance_policy_id, insurance_company_id, insurance_policy_number, sign_dt, expiration_dt, notes) 
values ('VC-15','INPO-03','AXA-XX23','VC-15/INPO-03/AXA-XX23','2023-01-15','2024-01-15','The last insuranced car.');








