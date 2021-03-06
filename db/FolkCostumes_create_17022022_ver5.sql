-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-02-17 07:20:41.503

-- tables
-- Table: contact
CREATE TABLE contact (
    id serial  NOT NULL,
    firstName varchar(50)  NOT NULL,
    lastName varchar(50)  NOT NULL,
    email varchar(50)  NULL,
    telephone varchar(15)  NULL,
    birth_date date  NOT NULL,
    address varchar(50)  NOT NULL,
    user_id int  NOT NULL,
    CONSTRAINT contact_pk PRIMARY KEY (id)
);

-- Table: costume
CREATE TABLE costume (
    id serial  NOT NULL,
    name varchar(50)  NOT NULL,
    CONSTRAINT costume_set_pk PRIMARY KEY (id)
);

-- Table: element
CREATE TABLE element (
    id serial  NOT NULL,
    element_type_id int  NOT NULL,
    element_name varchar(50)  NOT NULL,
    description varchar(250)  NOT NULL,
    CONSTRAINT set_element_pk PRIMARY KEY (id)
);

-- Table: element_in_costume
CREATE TABLE element_in_costume (
    id serial  NOT NULL,
    costume_id int  NOT NULL,
    element_id int  NOT NULL,
    CONSTRAINT element_in_costume_pk PRIMARY KEY (id)
);

-- Table: element_type
CREATE TABLE element_type (
    id serial  NOT NULL,
    element_type varchar(50)  NOT NULL,
    CONSTRAINT costume_set_element_type_pk PRIMARY KEY (id)
);

-- Table: group
CREATE TABLE "group" (
    id serial  NOT NULL,
    group_name varchar(50)  NOT NULL,
    CONSTRAINT group_pk PRIMARY KEY (id)
);

-- Table: location
CREATE TABLE location (
    id serial  NOT NULL,
    location varchar(50)  NOT NULL,
    CONSTRAINT location_pk PRIMARY KEY (id)
);

-- Table: location_balance
CREATE TABLE location_balance (
    id serial  NOT NULL,
    location_id int  NOT NULL,
    element_id int  NOT NULL,
    user_id int  NOT NULL,
    quantity int  NOT NULL,
    CONSTRAINT location_balance_pk PRIMARY KEY (id)
);

-- Table: location_log
CREATE TABLE location_log (
    id serial  NOT NULL,
    element_id int  NOT NULL,
    location_id int  NOT NULL,
    user_id int  NOT NULL,
    quantity int  NOT NULL,
    balance int  NOT NULL,
    transaction_time date  NOT NULL,
    CONSTRAINT location_log_pk PRIMARY KEY (id)
);

-- Table: role_in_group
CREATE TABLE role_in_group (
    id serial  NOT NULL,
    role_type_id int  NOT NULL,
    group_id int  NOT NULL,
    user_id int  NOT NULL,
    CONSTRAINT role_in_group_pk PRIMARY KEY (id)
);

-- Table: role_type
CREATE TABLE role_type (
    id serial  NOT NULL,
    name varchar(20)  NOT NULL,
    CONSTRAINT role_type_pk PRIMARY KEY (id)
);

-- Table: user
CREATE TABLE "user" (
    id serial  NOT NULL,
    username varchar(10)  NOT NULL,
    password varchar(10)  NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: contact_user (table: contact)
ALTER TABLE contact ADD CONSTRAINT contact_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: element_element_type (table: element)
ALTER TABLE element ADD CONSTRAINT element_element_type
    FOREIGN KEY (element_type_id)
    REFERENCES element_type (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: element_in_costume_costume (table: element_in_costume)
ALTER TABLE element_in_costume ADD CONSTRAINT element_in_costume_costume
    FOREIGN KEY (costume_id)
    REFERENCES costume (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: element_in_costume_element (table: element_in_costume)
ALTER TABLE element_in_costume ADD CONSTRAINT element_in_costume_element
    FOREIGN KEY (element_id)
    REFERENCES element (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: inventory_balance_element (table: location_balance)
ALTER TABLE location_balance ADD CONSTRAINT inventory_balance_element
    FOREIGN KEY (element_id)
    REFERENCES element (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: location_balance_location (table: location_balance)
ALTER TABLE location_balance ADD CONSTRAINT location_balance_location
    FOREIGN KEY (location_id)
    REFERENCES location (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: location_balance_user (table: location_balance)
ALTER TABLE location_balance ADD CONSTRAINT location_balance_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: location_log_element (table: location_log)
ALTER TABLE location_log ADD CONSTRAINT location_log_element
    FOREIGN KEY (element_id)
    REFERENCES element (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: location_log_location (table: location_log)
ALTER TABLE location_log ADD CONSTRAINT location_log_location
    FOREIGN KEY (location_id)
    REFERENCES location (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: location_log_user (table: location_log)
ALTER TABLE location_log ADD CONSTRAINT location_log_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: role_in_group_group (table: role_in_group)
ALTER TABLE role_in_group ADD CONSTRAINT role_in_group_group
    FOREIGN KEY (group_id)
    REFERENCES "group" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: role_in_group_role_type (table: role_in_group)
ALTER TABLE role_in_group ADD CONSTRAINT role_in_group_role_type
    FOREIGN KEY (role_type_id)
    REFERENCES role_type (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: role_in_group_user (table: role_in_group)
ALTER TABLE role_in_group ADD CONSTRAINT role_in_group_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

