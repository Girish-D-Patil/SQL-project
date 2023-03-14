create database project;
use project;
show tables;
desc covid;
select*from covid;

/* state with max cases*/
select state , total_cases from covid  order by  total_cases desc limit 1;

/* state with mini cases*/
select state , total_cases from covid  order by  total_cases  limit 1;

/*total number of deaths in india*/
select sum(deaths) from covid;

/*dropping column */
alter table covid drop population;

/*adding column*/
alter table covid add population bigint;

/*adding values into population column*/
update covid set population = 399001 where state="Andaman_and_Nicobar";
update covid set population = 91702488 where state="Andhra_pradesh";
update covid set population =  1711947 where state="Arunachal_Pradesh";
update covid set population =  35998752 where state="Assam";
update covid set population = 128500364 where state="Bihar";
update covid set population = 1158040 where state="Chandigarh";
update covid set population = 32199722 where state="Chhattisgarh";
update covid set population = 453008 where state="Dadra_and_Nagar_Haveli_and_Daman_and_Diu";
update covid set population = 1521992 where state="Goa";
update covid set population = 70400153 where state="Gujarat";
update covid set population = 28900667 where state="Haryana";
update covid set population = 7503010 where state="Himachal_Pradesh";
update covid set population =14999397  where state="j&k";
update covid set population = 40100376 where state="Jharkhand";
update covid set population = 69599762 where state="Karnataka";
update covid set population =  34698876 where state="Kerala";
update covid set population =  66001 where state="Lakshadweep";
update covid set population =  85002417 where state="Madhya_Pradesh";
update covid set population = 124904071 where state="Maharashtra";
update covid set population = 3436948 where state="Manipur";
update covid set population = 3772103 where state="Meghalaya";
update covid set population = 1308967 where state="Mizoram";
update covid set population =2073074  where state="Nagaland";

update covid set population = 47099270 where state="Odisha";
update covid set population = 1646050 where state="Puducherry";
update covid set population = 30501026 where state="Punjab";

update covid set population = 79502477 where state="Rajasthan";
update covid set population = 658019 where state="Sikkim";
update covid set population = 83697770 where state="Tamil_Nadu";
update covid set population = 38157311 where state="Telengana";
update covid set population = 4184959 where state="Tripura";
update covid set population = 231502578 where state="Uttar_Pradesh";
update covid set population =  11700099 where state="Uttarakhand";
update covid set population =  100896618 where state="West_Bengal";
update covid set population =  19301096 where state="delhi";


/* average of death ratio */
select avg(death_ratio) from covid;

/* states with more than avg death ratio*/
select state from covid where death_ratio > 1.5;

/* total no. of active cases*/
select sum(active) from covid;

/* dropping row */
delete from covid where state="Ladakh";

/* cases per 100 people*/
select  total_cases/population as per_capita_cases from covid;

create view cases_per_100_people as
select state, (total_cases/population)*100 as cases_per_100_people from covid;


select* from cases_per_100_people;

/*to find out covid hotspot states */ 
/* to be categorized as red zone */
select state, cases_per_100_people from cases_per_100_people where cases_per_100_people>10;



create table covid_test ( state varchar(50), tests bigint );
show tables;

select*from covid_test;
select*from covid ;

insert into covid_test values ("Andaman_and_Nicobar",156760 );
insert into covid_test values ("Andhra_Pradesh",18656980);
insert into covid_test values ("Arunachal_Pradesh", 1171140);
insert into covid_test values ("Assam", 24161680);
insert into covid_test values ("Bihar",48215020 );
insert into covid_test values ("Chandigarh",770060 );
insert into covid_test values ("Chhattisgarh", 13428330);
insert into covid_test values ("Dadra_and_Nagar_Haveli_and_Daman_and_Diu",187980 );
insert into covid_test values ("Delhi", 28653030);
insert into covid_test values ("Goa",1423080 );
insert into covid_test values ("Gujarat",30280130 );
insert into covid_test values ("Haryana",1275560 );
insert into covid_test values ("Himachal_Pradesh",3574450 );
insert into covid_test values ("j&k", 15675780);
insert into covid_test values ("Jharkhand",15451790);
insert into covid_test values ("Karnataka", 49411110);
insert into covid_test values ("Kerala",36802640 );
insert into covid_test values ("Lakshadweep",15070 );
insert into covid_test values ("Madhya_Pradesh",19509180 );
insert into covid_test values ("Maharashtra", 61020460);
insert into covid_test values ("Manipur", 1341590);
insert into covid_test values ("Meghalaya",111980 );
insert into covid_test values ("Mizoram",1213420 );
insert into covid_test values ("Nagaland", 386390);
insert into covid_test values ("Odisha", 21061160);
insert into covid_test values ("Puducherry", 1872780);
insert into covid_test values ("Punjab",15008920 );
insert into covid_test values ("Rajasthan",14617380);
insert into covid_test values ("Sikkim",255390);
insert into covid_test values ("Tamil_Nadu", 49411820);
insert into covid_test values ("Telengana",27022160 );
insert into covid_test values ("Tripura", 1944490);
insert into covid_test values ("Uttar_Pradesh",81382990 );
insert into covid_test values ("Uttarakhand",7625360 );
insert into covid_test values ("West_Bengal",18677180 );

select * from covid inner join covid_test on covid.state = covid_test.state;
select * from covid natural join covid_test;
select * from covid left outer join covid_test on covid.state = covid_test.state;
select * from covid right outer join covid_test on covid.state = covid_test.state;
select * from covid left outer join covid_test on covid.state = covid_test.state union
select * from covid left outer join covid_test on covid.state = covid_test.state;
select * from covid cross join covid_test;
