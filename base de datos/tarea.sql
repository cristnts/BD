create user centro  
identified by MEDICO
default tablespace users
temporary tablespace temp 
QUOTA 2000K on users

grant create session to centro;
grant create table to centro;