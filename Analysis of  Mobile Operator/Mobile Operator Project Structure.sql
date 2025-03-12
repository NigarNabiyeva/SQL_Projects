--1. Abonent Məlumatları
create table subscribers
(
  subscribers_id  number(10),
  name              varchar2(60 char),
  surname         varchar2(60 char),
  patronymic        varchar2(60 char),  
  birth_date      date,
  gender          varchar2(20 char),
  registration_date  date default sysdate,
  email              varchar2(200),
  phone_number      varchar2(20),
  status            varchar2(20) default 'ACTIVE',
  changed_date      date
);
-- Constraint   
alter table subscribers 
add constraint pk_subscribers_id primary key(subscribers_id); 
--Comment
comment on table subscribers is 'Abonent Məlumatları';
comment on column subscribers.subscribers_id is 'Hər bir abonent üçün unikal dəyərləri özündə saxlayır.';
comment on column subscribers.name is 'Abonentin adı.';
comment on column subscribers.surname is 'Abonentin soyadı.';
comment on column subscribers.patronymic is 'Abonentin ata adı.';
comment on column subscribers.birth_date is 'Abonentin doğum tarixi.';
comment on column subscribers.gender is 'Abonentin cinsiyyəti(Kişi və ya qadın).';
comment on column subscribers.registration_date is 'Abonentin qeydiyyat tarixi.';
comment on column subscribers.email is 'Abonentin e-poçt ünvanı.';
comment on column subscribers.phone_number is 'Abonentin telefon nömrəsi';
comment on column subscribers.status is 'Abonentin statusunu bildiri yəni aktiv və ya passiv olmasını bildirir. Aktiv - ACTIVE, passiv - PASSIVE.';
comment on column subscribers.changed_date is 'Abonentin statusunun dəyişmə tarixini bildirir.';
--DML(Insert)
insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (1, 'John', 'Doe', 'Smith', to_date('1990-01-01', 'YYYY-MM-DD'), 'Male', 'john.doe@example.com', '555-1234', 'ACTIVE', null);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (2, 'Jane', 'Roe', 'Johnson', to_date('1985-02-02', 'YYYY-MM-DD'), 'Female', 'jane.roe@example.com', '555-2345', 'ACTIVE', null);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (3, 'Alice', 'Johnson', 'Doe', to_date('1992-03-03', 'YYYY-MM-DD'), 'Female', 'alice.johnson@example.com', '555-3456', 'ACTIVE', null);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (4, 'Bob', 'Smith', 'Roe', to_date('1980-04-04', 'YYYY-MM-DD'), 'Male', 'bob.smith@example.com', '555-4567', 'ACTIVE', null);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (5, 'Carol', 'Williams', 'Brown', to_date('1995-05-05', 'YYYY-MM-DD'), 'Female', 'carol.williams@example.com', '555-5678', 'ACTIVE', null);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (6, 'David', 'Brown', 'Johnson', to_date('1988-06-06', 'YYYY-MM-DD'), 'Male', 'david.brown@example.com', '555-6789', 'ACTIVE', null);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (7, 'Emma', 'Davis', 'Smith', to_date('1991-07-07', 'YYYY-MM-DD'), 'Female', 'emma.davis@example.com', '555-7890', 'ACTIVE', null);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (8, 'Frank', 'Miller', 'Williams', to_date('1983-08-08', 'YYYY-MM-DD'), 'Male', 'frank.miller@example.com', '555-8901', 'ACTIVE', null);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (9, 'Grace', 'Wilson', 'Brown', to_date('1996-09-09', 'YYYY-MM-DD'), 'Female', 'grace.wilson@example.com', '555-9012', 'ACTIVE', null);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (10, 'Henry', 'Moore', 'Davis', to_date('1987-10-10', 'YYYY-MM-DD'), 'Male', 'henry.moore@example.com', '555-0123', 'ACTIVE', null);

-- passive records
insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (11, 'Isabella', 'Taylor', 'Wilson', to_date('1993-11-11', 'YYYY-MM-DD'), 'Female', 'isabella.taylor@example.com', '555-1230', 'PASSIVE', sysdate);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (12, 'Jack', 'Anderson', 'Moore', to_date('1989-12-12', 'YYYY-MM-DD'), 'Male', 'jack.anderson@example.com', '555-2340', 'PASSIVE', sysdate);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (13, 'Katherine', 'Thomas', 'Taylor', to_date('1994-01-13', 'YYYY-MM-DD'), 'Female', 'katherine.thomas@example.com', '555-3450', 'PASSIVE', sysdate);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (14, 'Liam', 'Jackson', 'Anderson', to_date('1990-02-14', 'YYYY-MM-DD'), 'Male', 'liam.jackson@example.com', '555-4560', 'PASSIVE', sysdate);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (15, 'Mia', 'White', 'Thomas', to_date('1986-03-15', 'YYYY-MM-DD'), 'Female', 'mia.white@example.com', '555-5670', 'PASSIVE', sysdate);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (16, 'Nathan', 'Harris', 'Jackson', to_date('1982-04-16', 'YYYY-MM-DD'), 'Male', 'nathan.harris@example.com', '555-6780', 'ACTIVE', null);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (17, 'Olivia', 'Martin', 'White', to_date('1998-05-17', 'YYYY-MM-DD'), 'Female', 'olivia.martin@example.com', '555-7891', 'ACTIVE', null);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (18, 'Patrick', 'Thompson', 'Harris', to_date('1979-06-18', 'YYYY-MM-DD'), 'Male', 'patrick.thompson@example.com', '555-8902', 'ACTIVE', null);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (19, 'Quinn', 'Garcia', 'Martin', to_date('1997-07-19', 'YYYY-MM-DD'), 'Female', 'quinn.garcia@example.com', '555-9013', 'ACTIVE', null);

insert into subscribers (subscribers_id, name, surname, patronymic, birth_date, gender, email, phone_number, status, changed_date)
values (20, 'Ryan', 'Martinez', 'Thompson', to_date('1990-08-20', 'YYYY-MM-DD'), 'Male', 'ryan.martinez@example.com', '555-0124', 'ACTIVE', null);
commit;   
-- 2. Ünvan tipləri haqqında məlumatlar saxlanılır.   
create table address_type
(
  type_id      number,
  type_name    varchar2(250 char),
  insert_date  date default sysdate,
  status       varchar2(20) default 'ACTIVE',
  changed_date date
);
-- Constraint     
alter table address_type 
add constraint pk_type_id primary key(type_id);
-- Comment   
comment on table address_type is 'Ünvan tipləri haqqında məlumatlar saxlanılır.';
comment on column address_type.type_id is 'Hər sətir üçün unikal dəyərləri özündə saxlayır';
comment on column address_type.type_name is 'Ünvan tipləri haqqında informasiyanı özündə saxlayır.';
comment on column address_type.insert_date is 'Sətirin cədvələ yazılma tarixini bildirir.';
comment on column address_type.status is 'Sətrin statusunu bildirir.';
comment on column address_type.changed_date is 'Sətrin statusunun dəyişmə tarixini bildirir.';
-- DML(Insert)  
insert into address_type(type_id,type_name) values(1,'Qeydiyyatda olduğu ünvan'); 
insert into address_type(type_id,type_name) values(2,'Daimi qeydiyyatda olduğu ünvan');
insert into address_type(type_id,type_name) values(3,'Faktiki yaşadığı ünvan');
    
-- 3. Abonent ünvanları haqqında məlumatlar saxlanılır.   
create table address
(
  subscribers_id number(10),
  address_name   varchar2(2000 char),
  type_id        number,
  insert_date    date default sysdate,
  status         varchar2(20) default 'ACTIVE',
  changed_date   date
);   
-- Constraint
alter table address 
add constraint fk_subscribers_id foreign key(subscribers_id) references subscribers(subscribers_id);

alter table address 
add constraint fk_address_type_id foreign key(type_id) references address_type(type_id);
--Comment 
comment on table address is 'Abonent ünvanları haqqında məlumatlar saxlanılır.';
comment on column address.subscribers_id is 'subscribers cədvəlinin subscribers_id sütunundakı dəyərləri alır.';
comment on column address.address_name is 'Abonentlərin ünvanları haqqında informasiya saxlanılır.';
comment on column address.type_id is 'address_type cədvəlinin type_id sütunundakı dəyərləri alır.';
comment on column address.insert_date is 'Sətirin cədvələ yazılma tarixini bildirir.';
comment on column address.status is 'Sətrin statusunu bildirir.';
comment on column address.changed_date is 'Sətrin statusunun dəyişmə tarixini bildirir.';
-- DML(Insert)
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (1, '123 Main St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (1, '456 Oak Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (1, '789 Pine Dr', 3, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (2, '101 Maple St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (2, '202 Elm Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (2, '303 Birch Dr', 3, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (3, '404 Cedar St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (3, '505 Walnut Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (3, '606 Spruce Dr', 3, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (4, '707 Fir St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (4, '808 Aspen Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (4, '909 Poplar Dr', 3, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (5, '111 Chestnut St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (5, '222 Hickory Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (5, '333 Redwood Dr', 3, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (6, '444 Willow St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (6, '555 Alder Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (6, '666 Cypress Dr', 3, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (7, '777 Palm St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (7, '888 Magnolia Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (7, '999 Sequoia Dr', 3, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (8, '123 Acacia St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (8, '456 Ash Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (8, '789 Basswood Dr', 3, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (9, '101 Banyan St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (9, '202 Beech Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (9, '303 Cedar Dr', 3, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (10, '404 Dogwood St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (10, '505 Elm Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (10, '606 Fig Dr', 3, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (11, '707 Ginkgo St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (11, '808 Hemlock Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (12, '909 Ironwood St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (12, '111 Juniper Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (13, '222 Larch St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (13, '333 Laurel Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (14, '444 Linden St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (14, '555 Locust Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (15, '666 Maple St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (15, '777 Mulberry Ave', 2, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (16, '888 Oak St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (17, '999 Palm Ave', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (18, '123 Pine St', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (19, '456 Redwood Ave', 1, 'ACTIVE', null);
insert into address (subscribers_id, address_name, type_id, status, changed_date)
values (20, '789 Spruce St', 1, 'ACTIVE', null);
-- 4. Tariflər haqqında informasiyanı özündə saxlayır. 
 create table tariff_informations
(
  tariff_id            number,
  tariff_name           varchar2(1000 char),
  call_price           number,
  message_price        number,
  internet_price       number,
  monthly_subscription number,
  insert_date          date default sysdate,
  status               varchar2(20) default 'ACTIVE',
  activation_date      date,
  deactivation_date    date
);
-- Constraint      
alter table tariff_informations 
add constraint pk_tarrif_id primary key(tariff_id); 
-- Comment
comment on table  tariff_informations is 'Tariflər haqqında informasiyanı özündə saxlayır.';
comment on column tariff_informations.tariff_id is 'hər tarif üçün unikal dəyəri özündə saxlayır.';
comment on column tariff_informations.tariff_name is 'Tarifin adı';
comment on column tariff_informations.call_price is 'Zəngin qiyməti (manatla, dəqiqə ilə).';
comment on column tariff_informations.message_price is 'Mesajın qiyməti (manatla, SMS).';
comment on column tariff_informations.internet_price is 'İnternetin qiyməti (manatla, MB).';
comment on column tariff_informations.monthly_subscription is 'Aylıq abunəlik haqqı (manatla).';
comment on column tariff_informations.insert_date is 'Sətirin cədvələ yazılma tarixini bildirir.';
comment on column tariff_informations.status is 'Sətrin statusunu bildirir.';
comment on column tariff_informations.activation_date is 'Xidmətin aktivləşdiyi tarix';
comment on column tariff_informations.deactivation_date is 'Xidmətin deaktivləşdiyi tarix';
-- DML(Insert)
insert into tariff_informations (tariff_id, tariff_name, call_price, message_price, internet_price, monthly_subscription, status, activation_date, deactivation_date)
values (1000, 'Basic Plan', 0.05, 0.02, 0.01, 10, 'ACTIVE', sysdate, null);

insert into tariff_informations (tariff_id, tariff_name, call_price, message_price, internet_price, monthly_subscription, status, activation_date, deactivation_date)
values (1001, 'Standard Plan', 0.04, 0.015, 0.008, 15, 'ACTIVE', sysdate, null);
 
insert into tariff_informations (tariff_id, tariff_name, call_price, message_price, internet_price, monthly_subscription, status, activation_date, deactivation_date)
values (1002, 'Premium Plan', 0.03, 0.01, 0.005, 20, 'ACTIVE', sysdate, null);
 
insert into tariff_informations (tariff_id, tariff_name, call_price, message_price, internet_price, monthly_subscription, status, activation_date, deactivation_date)
values (1003, 'Unlimited Plan', 0, 0, 0, 30, 'ACTIVE', sysdate, null);
 
insert into tariff_informations (tariff_id, tariff_name, call_price, message_price, internet_price, monthly_subscription, status, activation_date, deactivation_date)
values (1004, 'Economy Plan', 0.06, 0.025, 0.015, 5, 'PASSIVE', sysdate, sysdate);
 
insert into tariff_informations (tariff_id, tariff_name, call_price, message_price, internet_price, monthly_subscription, status, activation_date, deactivation_date)
values (1005, 'Family Plan', 0.04, 0.02, 0.01, 12, 'PASSIVE', sysdate, sysdate);
 
insert into tariff_informations (tariff_id, tariff_name, call_price, message_price, internet_price, monthly_subscription, status, activation_date, deactivation_date)
values (1006, 'Youth Plan', 0.05, 0.03, 0.02, 8, 'PASSIVE', sysdate, sysdate);
 
insert into tariff_informations (tariff_id, tariff_name, call_price, message_price, internet_price, monthly_subscription, status, activation_date, deactivation_date)
values (1007, 'Business Plan', 0.02, 0.01, 0.005, 25, 'ACTIVE', sysdate, null);

        
-- 5. Zəngin növü haqqında informasiyanı özündə saxlayır.          
create table call_type
(
  call_type_id number,
  name         varchar2(500 char),
  insert_date  date default sysdate,
  status       varchar2(20) default 'ACTIVE', 
  changed_date date
);
-- Constraint      
alter table call_type 
add constraint pk_call_type_id primary key(call_type_id);
-- Comment 
comment on table call_type is 'Zəngin növü haqqında informasiyanı özündə saxlayır.'; 
comment on column call_type.call_type_id is 'Zəngin növünün id -si.';
comment on column call_type.name is 'Zəngin növünün adı.'; 
comment on column call_type.insert_date is 'Sətirin cədvələ yazılma tarixini bildirir.';
comment on column call_type.status is 'Sətrin statusunu bildirir.';
comment on column call_type.changed_date is 'Sətrin statusunun dəyişmə tarixini bildirir.';
-- DML(Insert)
insert into call_type(call_type_id, name) values(1,'Daxili');
insert into call_type(call_type_id, name) values(2,'Xarici');
insert into call_type(call_type_id, name) values(3,'Beynəlxalq');

-- 6. Xidmətlər haqqında informasiyanı özündə saxlayır.   
create table services
(
  service_id        number,
  service_name      varchar2(500 char),
  description       varchar2(500 char),
  activation_date   date,
  deactivation_date date,
  insert_date       date default sysdate,
  tariff_id         number
);       
-- Constraint      
alter table services 
add constraint pk_service_id primary key(service_id);  
      
alter table services 
add constraint fk_tariff_id foreign key(tariff_id) references tariff_informations(tariff_id); 
-- Comment       
comment on table services is 'Xidmətlər haqqında informasiyanı özündə saxlayır.'; 
comment on column services.service_id is 'Hər sətir üçün unikal identifikatoru bildirir.'; 
comment on column services.service_name is 'Xidmətin adı';
comment on column services.description is 'Xidmətin təsviri';
comment on column services.activation_date is 'Xidmətin aktivləşdiyi tarix';
comment on column services.deactivation_date is 'Xidmətin deaktivləşdiyi tarix';
comment on column services.insert_date is 'Sətirin cədvələ yazılma tarixini bildirir.';
comment on column services.tariff_id is 'tariff_informations cədvəlinin tariff_id sütununun dəyərlərini alır.';

--DML(Insert)
insert into services (service_id, service_name, description, activation_date, deactivation_date, tariff_id)
values (1, 'Service A', 'Description for Service A', sysdate, null, 1000);

insert into services (service_id, service_name, description, activation_date, deactivation_date, tariff_id)
values (2, 'Service B', 'Description for Service B', sysdate, null, 1000);

insert into services (service_id, service_name, description, activation_date, deactivation_date, tariff_id)
values (3, 'Service C', 'Description for Service C', sysdate, null, 1000);

insert into services (service_id, service_name, description, activation_date, deactivation_date, tariff_id)
values (4, 'Service D', 'Description for Service D', sysdate, null, 1000);

insert into services (service_id, service_name, description, activation_date, deactivation_date, tariff_id)
values (5, 'Service E', 'Description for Service E', sysdate, null, 1000);

insert into services (service_id, service_name, description, activation_date, deactivation_date, tariff_id)
values (6, 'Service F', 'Description for Service F', sysdate, null, 1001);

insert into services (service_id, service_name, description, activation_date, deactivation_date, tariff_id)
values (7, 'Service G', 'Description for Service G', sysdate, null, 1001);

insert into services (service_id, service_name, description, activation_date, deactivation_date, tariff_id)
values (8, 'Service H', 'Description for Service H', sysdate, null, 1001);

insert into services (service_id, service_name, description, activation_date, deactivation_date, tariff_id)
values (9, 'Service I', 'Description for Service I', sysdate, null, 1001);
 
insert into services (service_id, service_name, description, activation_date, deactivation_date, tariff_id)
values (10, 'Service J', 'Description for Service J', sysdate, null, 1004);

insert into services (service_id, service_name, description, activation_date, deactivation_date, tariff_id)
values (11, 'Service K', 'Description for Service K', sysdate, null, 1004);

      
-- 7. Zənglər haqqında informasiyanı özündə saxlayır. 
create table calls
(
  call_id        number, 
  caller_id      number(10),
  call_date      date default sysdate,
  call_duration  number,
  receiver_phone varchar2(20),
  call_type_id   number,
  service_id     number,
  call_type      varchar2(100 char)
);
-- Constraint        
alter table calls 
add constraint pk_call_id primary key(call_id); 

alter table calls 
add constraint fk_caller_id foreign key(caller_id) references subscribers(subscribers_id); 

alter table calls 
add constraint fk_service_id foreign key(service_id) references services(service_id); 

alter table calls 
add constraint fk_call_type_id foreign key(call_type_id) references call_type(call_type_id); 

-- Comment 
comment on table calls is 'Zənglər haqqında informasiyanı özündə saxlayır.'; 
comment on column calls.call_id is 'Hər sətir üçün unikal identifikatoru bildirir.';
comment on column calls.caller_id is 'Zəng edən abonentin ID-si(subscribers cədvəlinin subscribers_id sütunun dəyərlərini alır).';
comment on column calls.call_date is 'Zəngin tarixi və vaxtı';
comment on column calls.call_duration is 'Zəngin müddəti (saniyə ilə)';
comment on column calls.receiver_phone is 'Zəng edilən telefon nömrəsi';
comment on column calls.call_type_id is 'call_type cədvəlinin call_type_id sütunun dəyərlərini alır';
comment on column calls.call_type is 'Zəng tipi (gələn, gedən və s.)';

-- DML(Insert)   
insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (1, 1, sysdate, 5, (select phone_number from subscribers where subscribers_id = 3), 1, 1,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (2, 1, sysdate, 10, (select phone_number from subscribers where subscribers_id = 3), 1, 2,'Receive');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (3, 1, sysdate, 15, (select phone_number from subscribers where subscribers_id = 3), 1, 3,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (4, 1, sysdate, 20, (select phone_number from subscribers where subscribers_id = 3), 1, 4,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (5, 1, sysdate, 25, (select phone_number from subscribers where subscribers_id = 3), 2, 5,'Send');
--
insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (6, 1, sysdate, 30, '123-456-7817', 1, 6,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (7, 1, sysdate, 35, '123-456-7816', 1, 7,'Receive');
 
insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (8, 11, sysdate, 5, '123-456-7811', 1, 8,'Receive');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (9, 11, sysdate, 10, (select phone_number from subscribers where subscribers_id = 5), 2, 9,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (10, 11, sysdate, 15, (select phone_number from subscribers where subscribers_id = 4), 2, 10,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (11, 11, sysdate, 20, '123-456-7819', 2, 11,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (12, 11, sysdate, 25, (select phone_number from subscribers where subscribers_id = 19), 1, 1,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (13, 11, sysdate, 30, (select phone_number from subscribers where subscribers_id = 17), 3, 1,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (14, 14, sysdate, 35, (select phone_number from subscribers where subscribers_id = 10), 3, 2,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (15, 14, sysdate, 40, (select phone_number from subscribers where subscribers_id = 10), 3, 3,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (16, 13, sysdate, 45, (select phone_number from subscribers where subscribers_id = 11), 1, 4,'Send');
--
insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (17, 4, sysdate, 5, (select phone_number from subscribers where subscribers_id = 3), 1, 5,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (18, 4, sysdate, 10, (select phone_number from subscribers where subscribers_id = 15), 2, 6,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (19, 4, sysdate, 15, (select phone_number from subscribers where subscribers_id = 15), 3, 7,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (20, 4, sysdate, 20, (select phone_number from subscribers where subscribers_id = 17), 1, 8,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (21, 4, sysdate, 25, (select phone_number from subscribers where subscribers_id = 18), 1, 9,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (22, 4, sysdate, 30, (select phone_number from subscribers where subscribers_id = 19), 1, 10,'Receive');
-- 
insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (23, 19, sysdate, 5, (select phone_number from subscribers where subscribers_id = 15), 1, 11,'Receive');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (24, 19, sysdate, 10, (select phone_number from subscribers where subscribers_id = 7), 2, 1,'Receive');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (25, 19, sysdate, 15, (select phone_number from subscribers where subscribers_id = 9), 3, 1,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (26, 19, sysdate, 20, (select phone_number from subscribers where subscribers_id = 6), 2, 2,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (27, 19, sysdate, 25, (select phone_number from subscribers where subscribers_id = 18), 3, 3,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (28, 19, sysdate, 30, (select phone_number from subscribers where subscribers_id = 13), 1, 4,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (29, 17, sysdate, 35, (select phone_number from subscribers where subscribers_id = 20), 2, 5,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (30, 14, sysdate, 40, (select phone_number from subscribers where subscribers_id = 19), 2, 6,'Send');
--
insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (31, 6, sysdate, 5, (select phone_number from subscribers where subscribers_id = 11), 1, 7,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (32, 6, sysdate, 10, (select phone_number from subscribers where subscribers_id = 11), 2, 8,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (33, 6, sysdate, 15, (select phone_number from subscribers where subscribers_id = 11), 3, 9,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (34, 6, sysdate, 20, (select phone_number from subscribers where subscribers_id = 13), 1, 10,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (35, 6, sysdate, 25, (select phone_number from subscribers where subscribers_id = 17), 1, 11,'Send');
-- 
insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (36, 13, sysdate, 5, (select phone_number from subscribers where subscribers_id = 7), 1, 1,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (37, 13, sysdate, 10, (select phone_number from subscribers where subscribers_id = 4), 2, 1,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (38, 13, sysdate, 15, (select phone_number from subscribers where subscribers_id = 4), 3, 2,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (39, 13, sysdate, 20, (select phone_number from subscribers where subscribers_id = 4), 2, 3,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (40, 13, sysdate, 25, (select phone_number from subscribers where subscribers_id = 3), 3, 4,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (41, 14, sysdate, 30, (select phone_number from subscribers where subscribers_id = 2), 3, 5,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (42, 15, sysdate, 35, (select phone_number from subscribers where subscribers_id = 1), 2, 6,'Send');
-- 
insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (43, 12, sysdate, 5, (select phone_number from subscribers where subscribers_id = 16), 1, 7,'Receive');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (44, 12, sysdate, 10, (select phone_number from subscribers where subscribers_id = 16), 2, 8,'Receive');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (45, 12, sysdate, 15, (select phone_number from subscribers where subscribers_id = 17), 3, 9,'Receive');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (46, 12, sysdate, 20, (select phone_number from subscribers where subscribers_id = 17), 2, 10,'Receive');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (47, 12, sysdate, 25, (select phone_number from subscribers where subscribers_id = 19), 1, 11,'Receive');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (48, 9, sysdate, 30, (select phone_number from subscribers where subscribers_id = 19), 1, 1,'Receive');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (49, 9, sysdate, 35, (select phone_number from subscribers where subscribers_id = 20), 1, 1,'Receive');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (50, 9, sysdate, 40, (select phone_number from subscribers where subscribers_id = 20), 2, 2,'Receive');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (51, 9, sysdate, 45, (select phone_number from subscribers where subscribers_id = 20), 1, 3,'Send');
-- 
insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (52, 8, sysdate, 5, (select phone_number from subscribers where subscribers_id = 19), 1, 4,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (53, 8, sysdate, 10, (select phone_number from subscribers where subscribers_id = 19), 2, 5,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (54, 8, sysdate, 15, (select phone_number from subscribers where subscribers_id = 18), 3, 6,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (55, 8, sysdate, 20, (select phone_number from subscribers where subscribers_id = 17), 1, 7,'Send');
-- 
insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (56, 13, sysdate, 5, (select phone_number from subscribers where subscribers_id = 4), 1, 8,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (57, 13, sysdate, 10, (select phone_number from subscribers where subscribers_id = 3), 2, 9,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (58, 13, sysdate, 15, (select phone_number from subscribers where subscribers_id = 3), 3, 10,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (59, 13, sysdate, 20, (select phone_number from subscribers where subscribers_id = 15), 1, 11,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (60, 5, sysdate, 25, (select phone_number from subscribers where subscribers_id = 13), 1, 1,'Send');

insert into calls (call_id, caller_id, call_date, call_duration, receiver_phone, call_type_id, service_id,call_type)
values (61, 5, sysdate, 30, (select phone_number from subscribers where subscribers_id = 12), 3, 1,'Send');



-- 8. SMS tipləri haqqında informasiyanı özündə saxlayır.
create table sms_types
(
  sms_type_id  number,
  name         varchar2(500 char),
  status       varchar2(20) default 'ACTIVE', 
  insert_date  date default sysdate,
  changed_date date    
);
-- Constraint      
alter table sms_types 
add constraint pk_table_id primary key(sms_type_id);
           
comment on table sms_types is 'SMS tipləri haqqında informasiyanı özündə saxlayır.'; 
comment on column sms_types.name is 'SMS tiplərinin adı.';         
comment on column sms_types.status is 'Sətrin statusunu bildirir.';  
comment on column sms_types.insert_date is 'Sətirin cədvələ yazılma tarixini bildirir.'; 
comment on column sms_types.changed_date is 'Sətrin statusunun dəyişmə tarixini bildirir.'; 

insert into sms_types(sms_type_id,name) values(1,'Standart SMS');   
insert into sms_types(sms_type_id,name) values(2,'Premium SMS');
insert into sms_types(sms_type_id,name) values(3,'Sistem Mesajları');
insert into sms_types(sms_type_id,name) values(4,'OTP SMS');
      
-- 9. SMS Qeydiyyatları
create table sms_informations      
(
  sms_id         number,
  sender_id      number,
  sms_date       date default sysdate,  
  receiver_phone varchar2(20),
  sms_content    varchar2(4000 char),
  sms_type_id    number,
  insert_date    date default sysdate,
  service_id     number
);
      
alter table sms_informations
add constraint pk_sms_id primary key(sms_id);

alter table sms_informations 
add constraint fk_sender_id foreign key(sender_id) references subscribers(subscribers_id); 

alter table sms_informations 
add constraint fk_sms_type_id foreign key(sms_type_id) references sms_types(sms_type_id);

alter table sms_informations 
add constraint fk_serv_id foreign key(service_id) references services(service_id);
      
comment on table sms_informations is 'SMS Qeydiyyatları'; 
comment on column sms_informations.sms_id is 'Hər sətir üçün unikal identifikatoru bildirir.';
comment on column sms_informations.sender_id is 'SMS göndərən abonentin ID-si(subscribers cədvəlinin subscribers_id sütunun dəyərini alır).';
comment on column sms_informations.sms_date is 'SMS tarixi və vaxtı';
comment on column sms_informations.receiver_phone is 'Mesaj göndərilən telefon nömrəsi';
comment on column sms_informations.sms_content is 'Mesajın mətn məzmunu.';
comment on column sms_informations.sms_type_id is 'Mesaj tipi (SMS, MMS və s.).';
comment on column sms_informations.service_id is 'Hansı xidmətə qoşulduğunu bildirir(services cədvəlinin service_id sütunun dəyərini alır).';
-- 
insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (1, 6, sysdate, '555-1234', 'Hello, this is a test SMS.', 1, sysdate, 2);
 
insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (2, 6, sysdate, '555-1234', 'Hi, this is the second test SMS.', 1, sysdate, 2);
 
insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (3, 6, sysdate, '555-1230', 'Greetings, this is the third test SMS.', 1, sysdate, 2);
 
insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (4, 6, sysdate, '444-444', 'Hello, this is the fourth test SMS.', 1, sysdate, 2);

-- 5-ci insert bəyanatı
insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (5, 6, sysdate, '333-333', 'Hi, this is the fifth test SMS.', 1, sysdate, 2);
 
insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (6, 6, sysdate, '555-555', 'Hello, this is the sixth test SMS.', 1, sysdate, 2);
 
insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (7, 6, sysdate, '555-5670', 'Greetings, this is the seventh test SMS.', 1, sysdate, 2);
 
insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (8, 6, sysdate, '555-5670', 'Hello, this is the eighth test SMS.', 1, sysdate, 2);
 
insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (9, 6, sysdate, '555-5670', 'Hi, this is the ninth test SMS.', 1, sysdate, 2);
----
insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (10, 7, sysdate, '555-1234', 'Hello, this is a test SMS.', 2, sysdate, 1);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (11, 8, sysdate, '555-2345', 'Hi, this is the second test SMS.', 3, sysdate, 2);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (12, 9, sysdate, '555-3456', 'Greetings, this is the third test SMS.', 2, sysdate, 3);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (13, 10, sysdate, '555-4567', 'Hello, this is the fourth test SMS.', 3, sysdate, 4);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (14, 11, sysdate, '555-5678', 'Hi, this is the fifth test SMS.', 2, sysdate, 1);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (15, 12, sysdate, '555-6789', 'Hello, this is the sixth test SMS.', 3, sysdate, 2);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (16, 13, sysdate, '555-7890', 'Greetings, this is the seventh test SMS.', 2, sysdate, 3);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (17, 14, sysdate, '555-8901', 'Hello, this is the eighth test SMS.', 3, sysdate, 4);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (18, 15, sysdate, '555-9012', 'Hi, this is the ninth test SMS.', 2, sysdate, 1);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (19, 16, sysdate, '555-0123', 'Hello, this is the tenth test SMS.', 3, sysdate, 2);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (20, 17, sysdate, '555-1230', 'Hi, this is the eleventh test SMS.', 2, sysdate, 3);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (21, 18, sysdate, '555-2340', 'Greetings, this is the twelfth test SMS.', 3, sysdate, 4);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (22, 19, sysdate, '555-3450', 'Hello, this is the thirteenth test SMS.', 2, sysdate, 1);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (23, 20, sysdate, '555-4560', 'Hi, this is the fourteenth test SMS.', 3, sysdate, 2);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (24, 7, sysdate, '555-5670', 'Hello, this is the fifteenth test SMS.', 2, sysdate, 3);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (25, 8, sysdate, '555-6780', 'Greetings, this is the sixteenth test SMS.', 3, sysdate, 4);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (26, 9, sysdate, '555-7891', 'Hello, this is the seventeenth test SMS.', 2, sysdate, 1);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (27, 10, sysdate, '555-8902', 'Hi, this is the eighteenth test SMS.', 3, sysdate, 2);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (28, 11, sysdate, '555-9013', 'Hello, this is the nineteenth test SMS.', 2, sysdate, 3);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (29, 12, sysdate, '555-0124', 'Greetings, this is the twentieth test SMS.', 3, sysdate, 4);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (30, 13, sysdate, '555-1234', 'Hello, this is the twenty-first test SMS.', 2, sysdate, 1);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (31, 14, sysdate, '555-2345', 'Hi, this is the twenty-second test SMS.', 3, sysdate, 2);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (32, 15, sysdate, '555-3456', 'Greetings, this is the twenty-third test SMS.', 2, sysdate, 3);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (33, 16, sysdate, '555-4567', 'Hello, this is the twenty-fourth test SMS.', 3, sysdate, 4);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (34, 17, sysdate, '555-5678', 'Hi, this is the twenty-fifth test SMS.', 2, sysdate, 1);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (35, 18, sysdate, '555-6789', 'Hello, this is the twenty-sixth test SMS.', 3, sysdate, 2);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (36, 19, sysdate, '555-7890', 'Greetings, this is the twenty-seventh test SMS.', 2, sysdate, 3);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (37, 20, sysdate, '555-8901', 'Hello, this is the twenty-eighth test SMS.', 3, sysdate, 4);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (38, 7, sysdate, '555-9012', 'Hi, this is the twenty-ninth test SMS.', 2, sysdate, 1);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (39, 8, sysdate, '555-0123', 'Hello, this is the thirtieth test SMS.', 3, sysdate, 2);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (40, 9, sysdate, '555-1230', 'Hi, this is the thirty-first test SMS.', 2, sysdate, 3);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (41, 10, sysdate, '555-2340', 'Greetings, this is the thirty-second test SMS.', 3, sysdate, 4);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (42, 11, sysdate, '555-3450', 'Hello, this is the thirty-third test SMS.', 2, sysdate, 1);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (43, 12, sysdate, '555-4560', 'Hi, this is the thirty-fourth test SMS.', 3, sysdate, 2);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (44, 13, sysdate, '555-5670', 'Greetings, this is the thirty-fifth test SMS.', 2, sysdate, 3);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (45, 14, sysdate, '555-6780', 'Hello, this is the thirty-sixth test SMS.', 3, sysdate, 4);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (46, 15, sysdate, '555-7891', 'Hi, this is the thirty-seventh test SMS.', 2, sysdate, 1);

insert into sms_informations (sms_id, sender_id, sms_date, receiver_phone, sms_content, sms_type_id, insert_date, service_id)
values (47, 16, sysdate, '555-8902', 'Hello, this is the thirty-eighth test SMS.', 3, sysdate, 2);
   
-- 10. Ödəniş üsulu haqqında informasiyanı özündə saxlayır(nağd, kredit kartı, bank köçürməsi və s.)
create table payment_method_type
(
  payment_type_id  number,
  name             varchar2(500 char),
  insert_date      date default sysdate,
  status           varchar2(20) default 'ACTIVE',   
  changed_date     date  
);      
       
alter table payment_method_type 
add constraint pk_payment_type_id primary key(payment_type_id); 

insert into payment_method_type(payment_type_id,name) values(1,'Nağd'); 
insert into payment_method_type(payment_type_id,name) values(2,'Kredit kartı'); 
insert into payment_method_type(payment_type_id,name) values(3,'Bank köçürməsi'); 
insert into payment_method_type(payment_type_id,name) values(4,'Cari hesabdan köçürmə'); 

comment on table payment_method_type is 'Ödəniş üsulu haqqında informasiyanı özündə saxlayır(nağd, kredit kartı, bank köçürməsi və s.)';  
comment on column payment_method_type.payment_type_id is 'Hər sətir üçün unikal identifikatoru bildirir.'; 
comment on column payment_method_type.name is 'Ödəniş üsulunun adı';
comment on column payment_method_type.insert_date is 'Sətirin cədvələ yazılma tarixini bildirir.';
comment on column payment_method_type.status is 'Sətrin statusunu bildirir.';
comment on column payment_method_type.changed_date is 'Sətrin statusunun dəyişmə tarixini bildirir.';
       
-- 11. Ödənişlər haqqında informasiyanı özündə saxlayır.
create table payments
(
  payment_id      number, 
  subscribers_id  number, 
  amount          number, 
  payment_type_id number, 
  payment_date    date default sysdate 
);
-- Constraint       
alter table payments 
add constraint pk_payment_id primary key(payment_id); 
       
alter table payments 
add constraint fk_payments_subscriber_id foreign key(subscribers_id) references subscribers(subscribers_id);  
-- Comments
comment on table payments is 'Ödənişlər haqqında informasiyanı özündə saxlayır.';
comment on column payments.payment_id is 'Hər sətir üçün unikal identifikatoru bildirir.';
comment on column payments.subscribers_id is 'Zəng edən abonentin ID-si(subscribers cədvəlinin subscribers_id sütunun dəyərlərini alır).';
comment on column payments.amount is 'Ödəniş məbləği';
comment on column payments.payment_type_id is 'Ödəniş üsulu payment_method_type cədvəlinin payment_type_id sütundakı dəyərləri alır'; 
comment on column payments.payment_date is 'Ödəniş tarixi';  

-- DML(Insert)
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (1, 1, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (2, 2, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (3, 3, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (4, 4, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (5, 5, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (6, 6, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (7, 7, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (8, 8, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (9, 9, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (10, 10, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (11, 11, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (12, 12, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (13, 13, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (14, 14, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (15, 15, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (16, 16, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (17, 17, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (18, 18, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (19, 19, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (20, 20, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (21, 1, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (22, 2, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (23, 3, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (24, 4, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (25, 5, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (26, 6, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (27, 7, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (28, 8, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (29, 9, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (30, 10, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (31, 11, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (32, 12, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (33, 13, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (34, 14, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (35, 15, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (36, 16, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (37, 17, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (38, 18, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (39, 19, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (40, 20, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (41, 1, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (42, 2, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (43, 3, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (44, 4, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (45, 5, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (46, 6, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (47, 7, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (48, 8, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (49, 9, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (50, 10, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (51, 11, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (52, 12, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (53, 13, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (54, 14, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (55, 15, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (56, 16, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (57, 17, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (58, 18, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (59, 19, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (60, 20, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (61, 1, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (62, 2, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (63, 3, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (64, 4, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (65, 5, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (66, 6, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (67, 7, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (68, 8, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (69, 9, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (70, 10, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (71, 11, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (72, 12, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (73, 13, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (74, 14, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (75, 15, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (76, 16, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (77, 17, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (78, 18, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (79, 19, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (80, 20, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (81, 1, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (82, 2, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (83, 3, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (84, 4, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (85, 5, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (86, 6, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (87, 7, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (88, 8, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (89, 9, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (90, 10, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (91, 11, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (92, 12, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (93, 13, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (94, 14, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (95, 15, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (96, 16, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (97, 17, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (98, 18, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (99, 19, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (100, 20, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (101, 1, 100, 3);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (102, 2, 100, 4);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (103, 3, 100, 1);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (104, 4, 100, 2);
insert into payments (payment_id, subscribers_id, amount, payment_type_id) values (105, 5, 100, 1);
   
-- 12. Şikayətlər və Dəstək Sorğularının növləri haqıında informasiyanı özündə saxlayır
create table complaint_type 
(
  complaint_type_id   number,
  complaint_type_name varchar2(250 char),
  status              varchar2(20) default 'ACTIVE', 
  insert_date         date default sysdate,
  changed_date        date 
);
-- Constraint
alter table complaint_type 
add constraint pk_complaint_type_id primary key(complaint_type_id);
-- DML(Insert)      
insert into complaint_type(complaint_type_id,complaint_type_name) 
values(10,'Xidmət Keyfiyyəti ilə Bağlı Şikayətlər');
/*
Zəif Şəbəkə Çəkilişi: İstifadəçilər zəif şəbəkə siqnalı, tez-tez əlaqənin kəsilməsi və zəif internet sürəti kimi problemlərlə 
                    qarşılaşa bilərlər.
Səs Keyfiyyəti Problemləri: Zənglər zamanı səsin kəsilməsi, uğursuz zənglər və zəif səs keyfiyyəti ilə bağlı şikayətlər.
SMS və MMS Göndərmə Problemləri: SMS və MMS-lərin göndərilməməsi və ya gecikməsi ilə bağlı şikayətlər.
*/  
--
insert into complaint_type(complaint_type_id,complaint_type_name) 
values(20,'Hesablama və Ödəniş Sorğuları');
/*
Yanlış Hesablama və Faturalama: İstifadəçilər yanlış hesablama, lazımsız ödənişlər və ya gözlənilməz xərclər barədə şikayət edə 
                             bilərlər.
Ödəniş Problemləri: Ödənişlərin sistemdə əks olunmaması və ya ödəniş zamanı yaranan texniki problemlər.
*/  
--
insert into complaint_type(complaint_type_id,complaint_type_name) 
values(30,'Müştəri Xidmətləri və Dəstək Sorğuları');
/*
Müştəri Xidmətlərinin Keyfiyyəti: Müştəri xidməti nümayəndələrinin davranışı, məlumatlılığı və problemin həllindəki effektivliyi ilə
                               bağlı şikayətlər.
Dəstək Biletlərinin Gecikməsi: Şikayət və ya dəstək biletinin gec cavablandırılması və ya həll edilməməsi.
*/  
insert into complaint_type(complaint_type_id,complaint_type_name) 
values(40,'Məhsul və Xidmətlər ilə Bağlı Sorğular');
/*
Yeni Xidmətlər və Təkliflər: Yeni xidmətlər, tarif planları və kampaniyalar haqqında məlumat sorğuları.
Xidmətlərin Aktivləşdirilməsi və Deaktivləşdirilməsi: Mövcud xidmətlərin aktivləşdirilməsi və deaktivləşdirilməsi ilə bağlı sorğular.
*/  
insert into complaint_type(complaint_type_id,complaint_type_name) 
values(50,'Texniki Dəstək Sorğuları');   
/*
SIM Kart Problemləri: SIM kartın işləməməsi, itirilməsi və ya dəyişdirilməsi ilə bağlı sorğular.
Mobil Telefon və Cihaz Problemləri: Telefonun və ya digər cihazların işləməməsi, proqram təminatı problemləri və yeniləmələrlə bağlı 
                                dəstək sorğuları.
*/  
insert into complaint_type(complaint_type_id,complaint_type_name) 
values(60,'Beynəlxalq Xidmətlər və Roaming');  
/*
Roaming Problemləri: Roaming xidmətlərinin aktivləşdirilməsi, tariflər və şəbəkə ilə bağlı problemlər.
Beynəlxalq Zənglər və SMS-lər: Beynəlxalq zənglərin və SMS-lərin yüksək qiymətləri və ya çatdırılma problemləri.
*/    
--
insert into complaint_type(complaint_type_id,complaint_type_name) 
values(70,'Şəxsi Məlumatların Mühafizəsi və Təhlükəsizlik');  
/*
Şəxsi Məlumatların Oğurlanması və İstifadəsi: Şəxsi məlumatların təhlükəsizliyinin təmin olunmaması və ya məlumatların oğurlanması ilə
                                          bağlı şikayətlər.
Spam Zənglər və SMS-lər: Reklam zəngləri və spam SMS-lərin qarşısının alınması ilə bağlı sorğular.
*/     
--   
comment on table complaint_type is 'Şikayətlər və Dəstək Sorğularının növləri haqıında informasiyanı özündə saxlayır';
comment on column complaint_type.complaint_type_id is 'Hər sətir üçün unikal identifikatoru bildirir.';
comment on column complaint_type.complaint_type_name is 'Şikayət və Dəstək Sorğularının növlərinin adları.';
comment on column complaint_type.status is 'Sətrin statusunu bildirir.';
comment on column complaint_type.insert_date is 'Sətirin cədvələ yazılma tarixini bildirir.';
comment on column complaint_type.changed_date is 'Sətrin statusunun dəyişmə tarixini bildirir.';


-- 13. Şikayətlər və Dəstək Sorğuları haqqında informasiyanı özündə saxlayır. 
create table complaints_and_support_requests   
(
   complaint_id      number,
   subscribers_id    number,
   complaint_type_id number,  
   description       varchar2(250 char),
   status            varchar2(100) default 'UNSOLVED',
   submission_date   date,  
   resolution_date   date,
   insert_date       date default sysdate
);       
-- Constraint
alter table complaints_and_support_requests
add constraint pk_complaint_id primary key(complaint_id); 
 
alter table complaints_and_support_requests 
add constraint fk_subscribers_id_support foreign key(subscribers_id) references subscribers(subscribers_id); 
 
alter table complaints_and_support_requests 
add constraint fk_complaint_type_id foreign key(complaint_type_id) references complaint_type(complaint_type_id); 
-- Comment 
comment on table complaints_and_support_requests is 'Şikayətlər və Dəstək Sorğuları haqqında informasiyanı özündə saxlayır.'; 
comment on column complaints_and_support_requests.complaint_id is 'Unikal şikayət identifikatoru';
comment on column complaints_and_support_requests.subscribers_id is 'Şikayət edən abunəçi identifikatoru(subscribers cədvəlinin subscriber_id sütunundakı dəyərləri alır)'; 
comment on column complaints_and_support_requests.complaint_type_id is 'Şikayətin növü'; 
comment on column complaints_and_support_requests.description is 'Şikayətin təsviri'; 
comment on column complaints_and_support_requests.status is 'Şikayətin statusu (həll olunub, araşdırmada və s.)'; 
comment on column complaints_and_support_requests.submission_date is 'Şikayətin təqdim edilmə tarixi'; 
comment on column complaints_and_support_requests.resolution_date is 'Şikayətin həll edilmə tarixi'; 
comment on column complaints_and_support_requests.insert_date is 'Sətirin cədvələ yazılma tarixini bildirir.';
-- DML(Insert)
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (1, 1, 10, 'Issue with billing', 'UNSOLVED', to_date('2024-01-01', 'YYYY-MM-DD'), null);
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (2, 2, 20, 'Service interruption', 'UNSOLVED', to_date('2024-01-02', 'YYYY-MM-DD'), null);
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (3, 3, 30, 'Unable to login', 'UNSOLVED', to_date('2024-01-03', 'YYYY-MM-DD'), null);
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (4, 4, 40, 'Slow internet speed', 'UNSOLVED', to_date('2024-01-04', 'YYYY-MM-DD'), null);
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (5, 5, 50, 'Incorrect charges', 'UNSOLVED', to_date('2024-01-05', 'YYYY-MM-DD'), null);
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (6, 6, 60, 'Service not activated', 'UNSOLVED', to_date('2024-01-06', 'YYYY-MM-DD'), null);
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (7, 7, 70, 'Frequent disconnections', 'UNSOLVED', to_date('2024-01-07', 'YYYY-MM-DD'), null);
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (8, 8, 10, 'Billing issue','SOLVED', to_date('2024-01-08', 'YYYY-MM-DD'), to_date('2024-01-10', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (9, 9, 20, 'Connection problem','SOLVED', to_date('2024-01-09', 'YYYY-MM-DD'), to_date('2024-01-11', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (10, 1, 30, 'Login issues','SOLVED', to_date('2024-01-10', 'YYYY-MM-DD'), to_date('2024-01-12', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (11, 2, 40, 'Speed issues','SOLVED', to_date('2024-01-11', 'YYYY-MM-DD'), to_date('2024-01-13', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (12, 3, 50, 'Overcharged','SOLVED', to_date('2024-01-12', 'YYYY-MM-DD'), to_date('2024-01-14', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (13, 4, 60, 'Activation problem','SOLVED', to_date('2024-01-13', 'YYYY-MM-DD'), to_date('2024-01-15', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (14, 5, 70, 'Disconnection issue','SOLVED', to_date('2024-01-14', 'YYYY-MM-DD'), to_date('2024-01-16', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (15, 6, 10, 'Payment issues','SOLVED', to_date('2024-01-15', 'YYYY-MM-DD'), to_date('2024-01-17', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (16, 7, 20, 'Technical issues','SOLVED', to_date('2024-01-16', 'YYYY-MM-DD'), to_date('2024-01-18', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (18, 9, 40, 'Speed fluctuations','SOLVED', to_date('2024-01-18', 'YYYY-MM-DD'), to_date('2024-01-20', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (19, 1, 50, 'Billing discrepancy','SOLVED', to_date('2024-01-19', 'YYYY-MM-DD'), to_date('2024-01-21', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (20, 2, 60, 'Service downtime','SOLVED', to_date('2024-01-20', 'YYYY-MM-DD'), to_date('2024-01-22', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (21, 3, 70, 'Connection drops','SOLVED', to_date('2024-01-21', 'YYYY-MM-DD'), to_date('2024-01-23', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (22, 4, 10, 'Unresolved issue','SOLVED', to_date('2024-01-22', 'YYYY-MM-DD'), to_date('2024-01-24', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (23, 5, 20, 'Slow response','SOLVED', to_date('2024-01-23', 'YYYY-MM-DD'), to_date('2024-01-25', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (24, 6, 30, 'Billing error','SOLVED', to_date('2024-01-24', 'YYYY-MM-DD'), to_date('2024-01-26', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (25, 7, 40, 'Technical fault','SOLVED', to_date('2024-01-25', 'YYYY-MM-DD'), to_date('2024-01-27', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (26, 8, 50, 'Account issue','SOLVED', to_date('2024-01-26', 'YYYY-MM-DD'), to_date('2024-01-28', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (27, 9, 60, 'Service error','SOLVED', to_date('2024-01-27', 'YYYY-MM-DD'), to_date('2024-01-29', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (28, 1, 70, 'Network issue','SOLVED', to_date('2024-01-28', 'YYYY-MM-DD'), to_date('2024-01-30', 'YYYY-MM-DD'));
insert into complaints_and_support_requests (complaint_id, subscribers_id, complaint_type_id, description, status, submission_date, resolution_date) values (29, 2, 10, 'Overcharge','SOLVED', to_date('2024-01-29', 'YYYY-MM-DD'), to_date('2024-01-31', 'YYYY-MM-DD'));

-- 14. Texniki Məlumatlar  
create table technical_data 
(
  device_id           number,
  subscribers_id      number,
  device_type         varchar2(250 char),
  imei_number         varchar2(250 char),
  operating_system    varchar2(250 char),
  network_type        varchar2(250 char),
  connection_history  date default sysdate
);
      
alter table technical_data 
add constraint pk_device_id primary key(device_id);
--
alter table technical_data 
add constraint fk_subscribers_id_technical_data foreign key(subscribers_id) references subscribers(subscribers_id); 
--
comment on table technical_data is 'Texniki Məlumatlar';
comment on column technical_data.device_id is 'Unikal cihaz identifikatoru';
comment on column technical_data.subscribers_id is 'Cihazdan istifadə edən abunəçi identifikatoru(subscribers cədvəlinin subscriber_id sütunundakı dəyərləri alır)';
comment on column technical_data.device_type is 'Cihazın növü (telefon, modem və s.)';
comment on column technical_data.imei_number is 'Cihazın IMEI nömrəsi';
comment on column technical_data.operating_system is 'Cihazın əməliyyat sistemi';
comment on column technical_data.network_type is 'Şəbəkə növü (3G, 4G, 5G və s.)';
comment on column technical_data.connection_history is 'Cihazın şəbəkə bağlantı tarix';
--  
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (1, 1, 'PHONE', 'IMEI1234567890', 'IOS', null);
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (2, 2, 'PHONE', 'IMEI1234567891', 'Android', null);
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (3, 3, 'PHONE', 'IMEI1234567892', 'IOS', null);
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (4, 4, 'PHONE', 'IMEI1234567893', 'Android', null);
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (5, 5, 'PHONE', 'IMEI1234567894', 'IOS', null);
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (6, 6, 'PHONE', 'IMEI1234567895', 'Android', null);
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (7, 7, 'PHONE', 'IMEI1234567896', 'IOS', null);
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (8, 8, 'PHONE', 'IMEI1234567897', 'Android', null);
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (9, 9, 'PHONE', 'IMEI1234567898', 'IOS', null);
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (10, 1, 'PHONE', 'IMEI1234567899', 'Android', null);
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (11, 2, 'PHONE', 'IMEI1234567800', 'IOS', null);
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (12, 3, 'PHONE', 'IMEI1234567801', 'Android', null);
 
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (13, 10, 'MODEM', 'IMEI1234567810', 'Modem', '3G');
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (14, 11, 'MODEM', 'IMEI1234567811', 'Modem', '4G');
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (15, 12, 'MODEM', 'IMEI1234567812', 'Modem', '5G');
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (16, 13, 'MODEM', 'IMEI1234567813', 'Modem', '3G');
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (17, 14, 'MODEM', 'IMEI1234567814', 'Modem', '4G');
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (18, 10, 'MODEM', 'IMEI1234567815', 'Modem', '5G');
insert into technical_data (device_id, subscribers_id, device_type, imei_number, operating_system, network_type) values (19, 11, 'MODEM', 'IMEI1234567816', 'Modem', '3G');
commit;
 
