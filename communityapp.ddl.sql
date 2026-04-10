/*


			Project Name : COMMUNITY WEB APPLICATION (beta version 1.0) DATABASE DESIGN WITH MS SQL SERVER.
			Student Name : ATIKUR RAHMAN.
			Student ID   : 1294236.
			Batch ID     : WADA/PNTL-M/69/01 .





 ================== Table of Contents: DDL Statement ======================


		    <<<=====>>> section 01: Creating  my community web appliction database;
			<<<=====>>> section 02: Creating standard table based on normalization with Constraint (primary,unique,foreign,check,null)
			<<<=====>>> section 03: Alter / Drop /Add column ,constraint of Table
			<<<=====>>> section 04: Create index (clustered and nonclustered)
			<<<=====>>> section 05: Create view (simple,with encryption,schemabinding and check option)
			<<<=====>>> section 06: Create stored procedure (parameter calling,insert,delete and update)
			<<<=====>>> section 07: Create user defined function or UDF (scaller ,inline tablevalue ,multitable value functon)
			<<<=====>>> section 08: Trigger (for/after and instead of trigger)


*/

--============= section 01: creating  my community web appliction database=============



use master;
go

if DB_ID('communityapp') is not null
drop database communityapp;
go
create database communityapp
on 
(
name = 'communityappmdf',
filename='C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\communityapp.mdf',
size  = 25 mb,
maxsize = 50 mb,
filegrowth = 10%
)
log on 
(
name = 'communityapplog',
filename='C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\communityapp.ldf',
size  = 25 mb,
maxsize = 50 mb,
filegrowth = 10%
);
go
use communityapp;
go


--============> section 02: creating standard table based on normalization with Constraint (primary,unique,foreign,check,null)====================



create table usertable
(
us_id bigint primary key identity (1,1) ,
us_fname nvarchar(30) not null,
us_lname nvarchar(30) not null,
us_profile nvarchar (500) not null,
us_dt_birth date not null CHECK (DATEDIFF(year, us_dt_birth, GETDATE()) >= 18),
us_gender nvarchar(20) not null,
us_email  nvarchar(50) not null unique,
us_password nvarchar(250) not null,
us_phone nvarchar (30) not null,
us_bio  nvarchar (300) null,
created_at datetime default getdate(),
account_status nvarchar(30),

);
go 



create table communities
(
community_id bigint primary key identity (1,1),
com_name nvarchar(50) not null,
com_type nvarchar (50) not null,
com_bio nvarchar (max) null,
com_profile image null,
com_connection nvarchar(50) null,
com_job_post nvarchar (max) null,
com_gig_show nvarchar (max) null,
com_privacy nvarchar (30)null 

);
go 



create table post
(
post_id bigint primary key identity (1,1),
us_id  bigint not null references usertable(us_id),
content nvarchar(max) null,
post_type nvarchar(50) not null,
createdpost_at datetime default getdate(),
updatedpost_at datetime default getdate(),

);
go



create table messagesender
(
send_id bigint primary key identity (1,1),
us_id  bigint not null references usertable(us_id),
is_group_chat bit default 0,
s_created_at datetime default getdate(),
s_updated_at datetime default getdate(),
s_delete_at datetime default getdate()

);
go



create table messagereciever
(
recieve_id bigint primary key identity (1,1) ,
us_id  bigint not null references usertable(us_id),
is_group_chat bit default 0,
r_created_at datetime default getdate(),
r_updated_at datetime default getdate(),
r_delete_at datetime default getdate()

);
go 



create table community_jobs
(
job_id bigint primary key identity (1,1),
community_id bigint not null references communities(community_id),
employer_id  bigint not null references usertable(us_id),
job_title nvarchar(100)not null,
job_description nvarchar(max) not null,
job_location nvarchar(100) default 'Remote', 
job_type nvarchar(50)not null, 
salary_range nvarchar(50) null,
is_active bit default 1,
created_at datetime default getdate(),
closing_date date null
);
go


create table  community_gigs
(
gig_id bigint primary key identity (1,1),
us_id bigint  not null  references usertable(us_id),
community_id bigint not null references communities(community_id),
gig_title nvarchar(150) not null,
gig_service_type nvarchar(50) not null,
gig_description nvarchar(1000) not null,
starting_price decimal(10, 2) null, 
portfolio_link nvarchar(500) null,
gig_status nvarchar(20) default 'Available',
created_at datetime default getdate()
);
go



create table communities_member
(
community_id bigint references communities (community_id),
us_id  bigint not null references usertable(us_id),
member_role nvarchar(50) not null,
help_count int default 0,
member_rank nvarchar(30),
member_join_at datetime default getdate(),
primary key (community_id, us_id)
);
go



create table comment
(
comment_id bigint not null,
us_id  bigint not null references usertable(us_id),
post_id bigint not null references post(post_id),
comment_content nvarchar(max) null,
comment_at datetime default getdate(),
primary key (us_id,comment_id)
);
go



create table share
(
share_id bigint primary key identity (1,1),
post_id bigint not null references post(post_id),
us_id  bigint not null references usertable(us_id),
share_content nvarchar(max)null,
share_at datetime default getdate()
);
go 



create table [message]
(
message_id bigint primary key identity (1,1),
sender_id bigint not null references messagesender(send_id),
reciever_id bigint not null references messagereciever(recieve_id),
message_content nvarchar(max) null,
m_created_at datetime default getdate(),
m_delete_at datetime default getdate()
);
go



create table job_applications
(
application_id bigint primary key identity (1,1),
job_id bigint not null references community_jobs(job_id),
applicant_id bigint not null references usertable(us_id),
cover_letter nvarchar(max) null,
applied_at datetime default getdate(),
app_status nvarchar(30) default 'Pending' 
);
go


create table [notification]
(
notification_id bigint primary key identity (1,1),
us_id  bigint not null references usertable(us_id),
notification_type nvarchar(50) null,
is_read_notification bit default 1,
n_created_at datetime default getdate()
);
go



create table privacycustomer
(
privacy_id bigint not null,
problem_id bigint not null,
solved_id bigint not null,
us_id  bigint not null references usertable(us_id),
visibility_account bit default 1,
primary key (privacy_id ,problem_id,solved_id)
);
go



create table datacontrol
(
control_id bigint primary key identity(1,1),
control_type nvarchar (50) not null,
us_id  bigint not null references usertable(us_id),
data_ctrl_start_at  datetime default getdate(),
data_ctrl_end_at  datetime default getdate(),

);
go


--===============> section 03: Alter / Drop /Add column ,constraint of Table =======================




---1. Adding a Social Media Handle to Users


alter table usertable
add us_social_link nvarchar(255) null;
go


--2. changing the data type for salary


alter table community_jobs
alter column salary_range nvarchar(100);
go


--3. adding a default value to account status


alter table usertable
add constraint df_account_status
default 'pending' for account_status;
go

--4. renaming a column for clarity

exec sp_rename 'communities.com_connection', 'com_category', 'column';
go


--5. dropping an unnecessary column
alter table communities
drop column com_job_post;
go



--=========> section 04: create index=======================



-- clustered index 



-- 1. clustered index on job_applications

alter table job_applications drop constraint pk__job_appl__3213e83f06d8702c; -- use your specific constraint name if different
alter table job_applications add constraint pk_job_app_clustered primary key clustered (job_id, application_id);
go

-- 2. clustered index on comment

alter table comment drop constraint pk__comment__029517173b236162;
alter table comment add constraint pk_comment_post_clustered primary key clustered (post_id, comment_id);
go

-- 3. clustered index on [message]

alter table [message] drop constraint pk__message__0bb354c935472eb8;
alter table [message] add constraint pk_message_time_clustered primary key clustered (m_created_at, message_id);
go


-- Non-Clustered Indexes



-- 1. non-clustered index on community_gigs


create index ix_gig_service_price on community_gigs(gig_service_type, starting_price)
include (gig_title, gig_status);
go

-- 2. non-clustered index on usertable


create index ix_user_name_status on usertable(us_fname, us_lname, account_status);
go


-- 3. non-clustered index on communities

create index ix_community_type_privacy on communities(com_type, com_privacy);
go





--=========> section 05: create view (simple,with encryption,schemabinding and check option)============




---1. simple view: basic user directory


create view vw_userdirectory as
select 
    us_id, 
    us_fname, 
    us_lname, 
    us_email, 
    account_status
from usertable;
go


--2. join view: community membership details


create view vw_communitymemberdetails as
select 
    c.com_name, 
    c.com_type, 
    u.us_fname + ' ' + u.us_lname as member_name, 
    m.member_role, 
    m.member_rank
from communities c
join communities_member m on c.community_id = m.community_id
join usertable u on m.us_id = u.us_id;
go


--3. view with encryption: secure job salary info


create view vw_securejobinfo
with encryption
as
select 
    job_id, 
    job_title, 
    salary_range, 
    is_active
from community_jobs;
go


--4. view with schemabinding: high-value gigs


create view vw_highvaluegigs
with schemabinding
as
select 
    gig_id, 
    gig_title, 
    starting_price, 
    gig_status
from dbo.community_gigs
where starting_price >= 10000;
go

--5. view with check option: active remote jobs


create view vw_activeremotejobs as
select 
    job_id, 
    job_title, 
    job_location, 
    is_active
from community_jobs
where job_location = 'remote' and is_active = 1
with check option;
go





--============> section 06: Create stored procedure (parameter calling,insert,delete and so on)=========




--1. parameter calling & inserting: user registration

create proc sp_registeruser
    @fname nvarchar(30),
    @lname nvarchar(30),
    @profile nvarchar(500),
    @dob date,
    @gender nvarchar(20),
    @email nvarchar(50),
    @password nvarchar(250),
    @phone nvarchar(30)
as
begin
    insert into usertable (us_fname, us_lname, us_profile, us_dt_birth, us_gender, us_email, us_password, us_phone, account_status)
    values (@fname, @lname, @profile, @dob, @gender, @email, @password, @phone, 'active');
end;
go


--2. declaring variables & updating: promote member rank


create proc sp_upgradememberrank
    @userid bigint,
    @communityid bigint
as
begin
    declare @currenthelp int;

    -- fetching current help count into the declared variable
    select @currenthelp = help_count 
    from communities_member 
    where us_id = @userid and community_id = @communityid;

    -- conditional update based on the variable value
    if @currenthelp >= 100
    begin
        update communities_member
        set member_rank = 'legend'
        where us_id = @userid and community_id = @communityid;
    end
    else if @currenthelp >= 50
    begin
        update communities_member
        set member_rank = 'platinum'
        where us_id = @userid and community_id = @communityid;
    end
end;
go


--3. output parameters: get community stats


create proc sp_getcommunitymembercount
    @communityid bigint,
    @membercount int output
as
begin
    select @membercount = count(*) 
    from communities_member 
    where community_id = @communityid;
end;
go


--4. logic with updating & deleting: close job post


create proc sp_archivejobpost
    @jobid bigint
as
begin
    -- updating the job status
    update community_jobs 
    set is_active = 0 
    where job_id = @jobid;

    -- deleting pending applications associated with this job
    delete from job_applications 
    where job_id = @jobid and app_status = 'pending';
end;
go


--5. complex inserting: send message with sender check

create proc sp_sendsecuremessage
    @senderid bigint,
    @receiverid bigint,
    @content nvarchar(max)
as
begin
    -- check if the sender is valid in the messagesender table
    if exists (select 1 from messagesender where send_id = @senderid)
    begin
        insert into [message] (sender_id, reciever_id, message_content, m_created_at)
        values (@senderid, @receiverid, @content, getdate());
    end
    else
    begin
        print 'error: invalid sender id';
    end
end;
go



--=====> section 07: Create user defined function or UDF (scaller ,inline tablevalue ,multitable value functon)============




--  1. scalar function: calculate user age

create function fn_calculateage (@birthdate date)
returns int
as
begin
    declare @age int;
    set @age = datediff(year, @birthdate, getdate());
    -- adjust if the birthday hasn't happened yet this year
    if (month(@birthdate) > month(getdate())) or 
       (month(@birthdate) = month(getdate()) and day(@birthdate) > day(getdate()))
    begin
        set @age = @age - 1;
    end
    return @age;
end;
go


--2. scalar function: get total applications for a job

create function fn_gettotalapplicants (@jobid bigint)
returns int
as
begin
    declare @count int;
    select @count = count(*) 
    from job_applications 
    where job_id = @jobid;
    return isnull(@count, 0);
end;
go


--3. inline table-valued function: filter gigs by price range

create function fn_getgigsbypricerange (@minprice decimal(10,2), @maxprice decimal(10,2))
returns table
as
return (
    select gig_title, gig_service_type, starting_price, gig_status
    from community_gigs
    where starting_price between @minprice and @maxprice
);
go


--4. inline table-valued function: user post activity

create function fn_getuserposts (@userid bigint)
returns table
as
return (
    select post_id, content, post_type, createdpost_at
    from post
    where us_id = @userid
);
go


--5. multi-statement table-valued function: community activity report

create function fn_getcommunitysummary ()
returns @summarytable table (
    community_name nvarchar(50),
    member_count int,
    active_jobs int,
    total_help_score int
)
as
begin
    insert into @summarytable
    select 
        c.com_name,
        count(distinct m.us_id),
        count(distinct j.job_id),
        sum(isnull(m.help_count, 0))
    from communities c
    left join communities_member m on c.community_id = m.community_id
    left join community_jobs j on c.community_id = j.community_id and j.is_active = 1
    group by c.com_name;

    return;
end;
go



--==============> section 08: Trigger (for/after,/instead of trigger)=============




--1. after insert trigger: automatic notification for messages

create trigger trg_aftermessagesent
on [message]
after insert
as
begin
    set nocount on;
    insert into notification (us_id, notification_type, is_read_notification, n_created_at)
    select reciever_id, 'new_message', 0, getdate()
    from inserted;
end;
go


--2. after update trigger: audit log for salary changes

create trigger trg_aftersalaryupdate
on community_jobs
after update
as
begin
    set nocount on;
    if update(salary_range)
    begin
        insert into datacontrol (us_id, control_type, data_ctrl_start_at)
        select employer_id, 'salary_update_logged', getdate()
        from inserted;
    end
end;
go



--3. after delete trigger: clean up community membership


create trigger trg_aftercommunitydelete
on communities
after delete
as
begin
    set nocount on;
    delete from communities_member
    where community_id in (select community_id from deleted);
end;
go



--4. instead of delete trigger: soft delete for users
create trigger trg_insteadofuserdelete
on usertable
instead of delete
as
begin
    set nocount on;
    update usertable
    set account_status = 'deleted'
    where us_id in (select us_id from deleted);
end;
go



--5. for (after) insert trigger: initialize help count

create trigger trg_formemberjoin
on communities_member
for insert
as
begin
    set nocount on;
    update communities_member
    set help_count = 0
    where us_id in (select us_id from inserted) 
    and community_id in (select community_id from inserted);
end;
go




---================== End of the DDL STATEMENT ===================================