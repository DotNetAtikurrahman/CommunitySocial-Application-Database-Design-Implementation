/*

            Project Name : COMMUNITY WEB APPLICATION (beta version 1.0) DATABASE DESIGN WITH MS SQL SERVER.
			Student Name : ATIKUR RAHMAN.
			Student ID   : 1294236.
			Batch ID     : WADA/PNTL-M/69/01 .



 ================== Table of Contents: DML Statement ======================

          <<<======>>> SECTION 01: Insert data into Tables Using INSERT STATEMENT										
          <<<======>>> SECTION 02: Retrieve data from table using SELECT STATEMENT
          <<<======>>> SECTION 03: Update data from existing table using UPDATE STATEMENT
          <<<======>>> SECTION 04: Delete data from table using  DELETE STATEMENT 							

 =============== What Coverage in my DML statement ================
                	     						
                	     
                	     ==> String Expressions, Concatenate
                         ==> Arithmetic Expressions	
                         ==> ALL, DISTINCT, TOP, PERCENT, WITH TIES
                         ==> Comparison Operator, BETWEEN
                         ==> Logical Operator (AND, OR, NOT)
                         ==> like ,is null
                         ==> Range of Selected Rows (OFFSET FETCH)
                         
                         ==> All types of JOIN
                         ==> Compound Join
				         ==> UNION, UNION ALL, EXCEPT, INTERSECT 

                	     ==> GROUP BY, HAVING					  
				         ==> ROLLUP, CUBE, GROUPING SETS

				         ==> Subqueries	(corelated and scaler )										   
				         ==> CTE, Recursive CTE

    			         ==> CAST, CONVERT, TRY_CONVERT

				         ==> Functions ( String ,Numeric and  Date Function ,COALESCE, ISNULL, CASE, IIF, CHOOSE)				  
				         ==> Ranking Functions	
                         ==> Analytic functions
				         ==> TRY-CATCH block to handle errors	

                         ==> merge row 





*/




use communityapp;
go

--==============SECTION 01: Insert data into Tables Using INSERT STATEMENT	===================

insert into usertable (us_fname, us_lname, us_profile, us_dt_birth, us_gender, us_email, us_password, us_phone, us_bio, account_status)
values 
('arif', 'rahman', 'profiles/user1.jpg', '1995-10-15', 'male', 'arif.rahman@email.com', 'hashed_pass_01', '01711122233', 'software engineer from dhaka', 'active'),
('nusrat', 'jahan', 'profiles/user2.jpg', '1998-05-20', 'female', 'nusrat.jahan@email.com', 'hashed_pass_02', '01822233344', 'graphic designer based in sylhet', 'active'),
('tanvir', 'ahmed', 'profiles/user3.jpg', '1992-12-01', 'male', 'tanvir.ahmed@email.com', 'hashed_pass_03', '01933344455', 'hiring manager at tech corp', 'active'),
('sadia', 'islam', 'profiles/user4.jpg', '1996-03-12', 'female', 'sadia.islam@email.com', 'hashed_pass_04', '01644455566', 'content creator and freelancer', 'active'),
('rakib', 'hossain', 'profiles/user5.jpg', '1994-08-25', 'male', 'rakib.hossain@email.com', 'hashed_pass_05', '01555566677', 'full stack developer from rajshahi', 'active'),
('farhana', 'yasmin', 'profiles/user6.jpg', '1997-01-30', 'female', 'farhana.yasmin@email.com', 'hashed_pass_06', '01366677788', 'ui/ux enthusiast', 'active'),
('mehedi', 'hasan', 'profiles/user7.jpg', '1990-06-14', 'male', 'mehedi.hasan@email.com', 'hashed_pass_07', '01777788899', 'digital marketer in barisal', 'active'),
('kamrul', 'islam', 'profiles/user8.jpg', '1993-11-05', 'male', 'kamrul.islam@email.com', 'hashed_pass_08', '01888899900', 'seo specialist from khulna', 'active'),
('mithila', 'chowdhury', 'profiles/user9.jpg', '2000-04-18', 'female', 'mithila.c@email.com', 'hashed_pass_09', '01999900011', 'student at chittagong university', 'active'),
('shakil', 'khan', 'profiles/user10.jpg', '1991-09-09', 'male', 'shakil.khan@email.com', 'hashed_pass_10', '01610101010', 'professional photographer', 'active'),
('tamanna', 'akter', 'profiles/user11.jpg', '1995-02-14', 'female', 'tamanna.akter@email.com', 'hashed_pass_11', '01511122233', 'freelance writer from dhaka', 'active'),
('nazmul', 'huda', 'profiles/user12.jpg', '1992-07-22', 'male', 'nazmul.huda@email.com', 'hashed_pass_12', '01322233344', 'backend engineer', 'active'),
('sumaiya', 'sharmin', 'profiles/user13.jpg', '1999-10-31', 'female', 'sumaiya.s@email.com', 'hashed_pass_13', '01733344455', 'app developer', 'active'),
('faisal', 'mahmud', 'profiles/user14.jpg', '1994-12-25', 'male', 'faisal.mahmud@email.com', 'hashed_pass_14', '01844455566', 'entrepreneur from cumilla', 'active'),
('labiba', 'sultana', 'profiles/user15.jpg', '1996-05-05', 'female', 'labiba.s@email.com', 'hashed_pass_15', '01955566677', 'social media manager', 'active'),
('joy', 'ghosh', 'profiles/user16.jpg', '1993-02-28', 'male', 'joy.ghosh@email.com', 'hashed_pass_16', '01666677788', 'it consultant in bogura', 'active'),
('anika', 'tabassum', 'profiles/user17.jpg', '1998-08-17', 'female', 'anika.t@email.com', 'hashed_pass_17', '01577788899', 'react developer', 'active'),
('riad', 'morshed', 'profiles/user18.jpg', '1990-01-01', 'male', 'riad.m@email.com', 'hashed_pass_18', '01388899900', 'senior dev from dhaka', 'active'),
('israt', 'jahan', 'profiles/user19.jpg', '1997-03-21', 'female', 'israt.jahan@email.com', 'hashed_pass_19', '01799900011', 'cyber security student', 'active'),
('emon', 'sikder', 'profiles/user20.jpg', '1995-11-11', 'male', 'emon.sikder@email.com', 'hashed_pass_20', '01810101010', 'video editor in dhaka', 'active');
go
insert into post (us_id, content, post_type, createdpost_at)
values 
(1, 'anyone here working with next.js? looking for some advice on a new project.', 'discussion', getdate()),
(2, 'just finished my latest ui/ux project for a local startup. feedback is welcome!', 'portfolio', getdate()),
(3, 'we are hiring! looking for a junior hr assistant for our dhaka office.', 'job_post', getdate()),
(4, 'hey freelancers, how do you handle clients who delay payments? any tips?', 'help_request', getdate()),
(5, 'super excited to announce that i just joined a new tech company in rajshahi!', 'announcement', getdate()),
(6, 'does anyone have resources for learning figma in bengali?', 'question', getdate()),
(7, 'tips for optimizing your linkedin profile for bangladeshi recruiters.', 'educational', getdate()),
(8, 'looking for a reliable seo tool that is affordable for small agencies.', 'query', getdate()),
(9, 'is there any tech meetup happening in chittagong this month?', 'event', getdate()),
(10, 'sharing some of my photography shots from old dhaka. hope you like them!', 'showcase', getdate()),
(11, 'available for freelance content writing projects. dm for portfolio.', 'availability', getdate()),
(12, 'stuck with a bug in my laravel controller. can anyone help me out?', 'help_request', getdate()),
(13, 'the mobile app market in bangladesh is growing so fast. what do you think?', 'discussion', getdate()),
(14, 'starting my own ecommerce business soon. wish me luck, guys!', 'announcement', getdate()),
(15, 'looking for a social media intern for a 3-month remote position.', 'job_post', getdate()),
(16, 'best coworking spaces in bogura? need a place with stable internet.', 'question', getdate()),
(17, 'just pushed my first open source project to github. check it out!', 'portfolio', getdate()),
(18, 'we need to build a stronger developer community in bangladesh.', 'opinion', getdate()),
(19, 'tips for securing your web applications from common attacks.', 'educational', getdate()),
(20, 'anyone interested in a video editing workshop next weekend?', 'event', getdate());
go
insert into comment (comment_id, us_id, post_id, comment_content, comment_at)
values 
(1, 2, 1, 'i suggest checking out the official docs, they are great!', getdate()),
(2, 3, 2, 'this design looks very clean. love the color palette!', getdate()),
(3, 1, 3, 'just sent my cv. hope to hear from you soon.', getdate()),
(4, 5, 4, 'always take a 50% advance before starting the work, bro.', getdate()),
(5, 6, 5, 'congratulations on the new role! party kobe?', getdate()),
(6, 4, 6, 'check out stack learner on youtube, they have great bengali content.', getdate()),
(7, 8, 7, 'very useful tips. i needed this for my job hunt.', getdate()),
(8, 7, 8, 'you can try ubersuggest or ahrefs free version.', getdate()),
(9, 10, 9, 'i heard there is a tech fest happening at cu next week.', getdate()),
(10, 9, 10, 'old dhaka is always beautiful. great shots!', getdate()),
(11, 12, 11, 'could you share your hourly rate for blog writing?', getdate()),
(12, 11, 12, 'show us your route file, maybe the issue is there.', getdate()),
(13, 14, 13, 'absolutely! fintech is booming in bangladesh right now.', getdate()),
(14, 13, 14, 'best of luck with your startup journey!', getdate()),
(15, 16, 15, 'is this internship open for second-year students?', getdate()),
(16, 15, 16, 'check out the hub in bogura town, it has good internet.', getdate()),
(17, 18, 17, 'starred your repo! keep up the good work.', getdate()),
(18, 17, 18, 'true. we need more local community meetups.', getdate()),
(19, 20, 19, 'thanks for sharing. security is often overlooked.', getdate()),
(20, 19, 20, 'i am interested! let me know the location and time.', getdate());
go
insert into share (post_id, us_id, share_content, share_at)
values 
(1, 5, 'sharing this for my dev friends.', getdate()),
(2, 8, 'love this design! everyone should check it out.', getdate()),
(3, 1, 'big opportunity for junior hr folks.', getdate()),
(4, 10, 'very important discussion for freelancers.', getdate()),
(5, 7, 'so happy for him! congrats.', getdate()),
(6, 2, 'found these figma resources helpful.', getdate()),
(7, 15, 'essential tips for job seekers in bangladesh.', getdate()),
(8, 12, 'good tool recommendations here.', getdate()),
(9, 4, 'ctg people, don''t miss this event.', getdate()),
(10, 6, 'old dhaka through a lens. beautiful.', getdate()),
(11, 19, 'if anyone needs a writer, she is great.', getdate()),
(12, 18, 'helping out a fellow developer with this bug.', getdate()),
(13, 14, 'the future of bd fintech is here.', getdate()),
(14, 3, 'supporting a new local business!', getdate()),
(15, 17, 'internship opportunity for students.', getdate()),
(16, 9, 'looking for work spaces? check this.', getdate()),
(17, 20, 'amazing open source work by a local dev.', getdate()),
(18, 11, 'lets grow our community together.', getdate()),
(19, 13, 'everyone should read about app security.', getdate()),
(20, 16, 'sharing this workshop for my editor friends.', getdate());
go
insert into messagesender (us_id, is_group_chat, s_created_at)
values 
(1, 0, getdate()),
(2, 0, getdate()),
(3, 1, getdate()), 
(4, 0, getdate()),
(5, 0, getdate()),
(6, 1, getdate()), 
(7, 0, getdate()),
(8, 0, getdate()),
(9, 0, getdate()),
(10, 0, getdate()),
(11, 0, getdate()),
(12, 0, getdate()),
(13, 1, getdate()), 
(14, 0, getdate()),
(15, 0, getdate()),
(16, 0, getdate()),
(17, 0, getdate()),
(18, 0, getdate()),
(19, 0, getdate()),
(20, 0, getdate());
go
insert into messagereciever (us_id, is_group_chat, r_created_at)
values 
(2, 0, getdate()), 
(1, 0, getdate()), 
(4, 1, getdate()), 
(3, 0, getdate()),
(6, 0, getdate()),
(5, 1, getdate()), 
(8, 0, getdate()),
(7, 0, getdate()),
(10, 0, getdate()),
(9, 0, getdate()),
(12, 0, getdate()),
(11, 0, getdate()),
(14, 1, getdate()), 
(13, 0, getdate()),
(16, 0, getdate()),
(15, 0, getdate()),
(18, 0, getdate()),
(17, 0, getdate()),
(20, 0, getdate()),
(19, 0, getdate());
go
insert into [message] (sender_id, reciever_id, message_content, m_created_at)
values 
(1, 1, 'hey nusrat, did you see my post about next.js?', getdate()),
(2, 2, 'yes arif! i think you should use tailwind with it.', getdate()),
(3, 3, 'welcome to the tech group chat everyone!', getdate()),
(4, 4, 'bro, can you check my latest design?', getdate()),
(5, 5, 'sure, send me the figma link.', getdate()),
(6, 6, 'let''s discuss the project requirements here.', getdate()),
(7, 7, 'hey, are you available for a quick meeting?', getdate()),
(8, 8, 'i will be free after 4pm today.', getdate()),
(9, 9, 'did you apply for the laravel role?', getdate()),
(10, 10, 'not yet, preparing my portfolio first.', getdate()),
(11, 11, 'could you share the contact for that writer?', getdate()),
(12, 12, 'i sent it to your email, please check.', getdate()),
(13, 13, 'this group is for marketing tips only.', getdate()),
(14, 14, 'thanks for the add, happy to be here!', getdate()),
(15, 15, 'are you going to the chittagong meetup?', getdate()),
(16, 16, 'yes, i will be there with my team.', getdate()),
(17, 17, 'i just starred your github repo, great job!', getdate()),
(18, 18, 'thanks man! let me know if you find any bugs.', getdate()),
(19, 19, 'don''t forget to change your database password.', getdate()),
(20, 20, 'got it, security is my top priority now.', getdate());
go
insert into communities (com_name, com_type, com_bio, com_privacy)
values 
('dhaka tech hub', 'technology', 'the biggest community for developers and engineers in dhaka.', 'public'),
('bangladesh freelancers', 'freelancing', 'connect with clients and show your gigs to the world.', 'public'),
('chittagong job board', 'employment', 'finding and posting local job opportunities in ctg.', 'public'),
('creative designers bd', 'design', 'a space for ui/ux and graphic designers to share work.', 'public'),
('sylhet startup community', 'business', 'supporting new entrepreneurs in the sylhet region.', 'private'),
('rajshahi educators', 'education', 'connecting teachers and students for better learning.', 'public'),
('bd women in tech', 'technology', 'empowering women to lead in the bangladeshi tech industry.', 'public'),
('khulna it professionals', 'technology', 'a local networking group for it experts in khulna.', 'public'),
('bangladeshi photographers', 'arts', 'share your captures of our beautiful country.', 'public'),
('barisal agri-tech', 'agriculture', 'discussing modern technology in bangladeshi farming.', 'public'),
('cumilla developers circle', 'technology', 'coding and community for developers in cumilla.', 'public'),
('digital marketing bd', 'marketing', 'tips and tricks for seo, ads, and social media.', 'public'),
('feni job seekers', 'employment', 'helping locals find work in feni and surrounding areas.', 'public'),
('gazipur industrial network', 'business', 'connecting industry leaders and job seekers in gazipur.', 'private'),
('bd gaming community', 'entertainment', 'for developers and players in the bangladeshi game industry.', 'public'),
('python programmers bd', 'technology', 'dedicated to the python programming language and its frameworks.', 'public'),
('remote work bangladesh', 'freelancing', 'find remote jobs from around the world while living in bd.', 'public'),
('health-tech bangladesh', 'healthcare', 'innovation at the intersection of medicine and technology.', 'private'),
('narsingdi textile hub', 'business', 'connecting owners and workers in the textile sector.', 'public'),
('rangpur skill share', 'education', 'a place to learn new skills from experts in rangpur.', 'public');
go
insert into communities_member (community_id, us_id, member_role, help_count, member_rank, member_join_at)
values 
(1, 1, 'admin', 150, 'legend', getdate()),
(1, 2, 'member', 10, 'silver', getdate()),
(2, 2, 'admin', 85, 'gold', getdate()),
(2, 3, 'member', 5, 'bronze', getdate()),
(3, 3, 'moderator', 40, 'gold', getdate()),
(4, 4, 'admin', 12, 'silver', getdate()),
(5, 5, 'admin', 30, 'gold', getdate()),
(6, 6, 'member', 0, 'newbie', getdate()),
(7, 7, 'moderator', 55, 'platinum', getdate()),
(8, 8, 'member', 3, 'bronze', getdate()),
(9, 9, 'admin', 100, 'diamond', getdate()),
(10, 10, 'member', 2, 'newbie', getdate()),
(11, 11, 'admin', 25, 'gold', getdate()),
(12, 12, 'member', 8, 'silver', getdate()),
(13, 13, 'moderator', 15, 'silver', getdate()),
(14, 14, 'member', 1, 'newbie', getdate()),
(15, 15, 'admin', 60, 'platinum', getdate()),
(16, 16, 'member', 7, 'bronze', getdate()),
(17, 17, 'member', 20, 'gold', getdate()),
(18, 18, 'admin', 45, 'platinum', getdate());
go
insert into community_jobs (community_id, employer_id, job_title, job_description, job_location, job_type, salary_range, is_active)
values 
(1, 1, 'senior frontend developer', 'must have 3 years of react experience.', 'dhaka', 'full-time', '80k - 100k', 1),
(1, 3, 'junior sqa engineer', 'manual and automation testing knowledge required.', 'dhaka', 'full-time', '25k - 35k', 1),
(2, 2, 'freelance logo designer', 'need a modern logo for a tech startup.', 'remote', 'contract', '5k - 10k', 1),
(3, 3, 'branch manager', 'manage daily operations of a logistics firm.', 'chittagong', 'full-time', '45k - 60k', 1),
(4, 4, 'ui/ux designer', 'create wireframes and prototypes in figma.', 'remote', 'part-time', '20k - 30k', 1),
(5, 5, 'business development officer', 'experience in sylhet tea industry preferred.', 'sylhet', 'full-time', '30k - 40k', 1),
(7, 7, 'it instructor', 'teach basic coding to young girls.', 'dhaka', 'contract', '15k - 20k', 1),
(8, 8, 'network administrator', 'maintain local server and network security.', 'khulna', 'full-time', '40k - 50k', 1),
(11, 11, 'php laravel developer', 'develop and maintain backend systems.', 'cumilla', 'full-time', '35k - 45k', 1),
(12, 12, 'seo specialist', 'optimize 5 websites for search engines.', 'remote', 'freelance', '10k - 15k', 1),
(13, 13, 'field sales officer', 'visit local shops for product promotion.', 'feni', 'full-time', '18k + commission', 1),
(14, 14, 'factory supervisor', 'oversee garment production line.', 'gazipur', 'full-time', '35k - 50k', 1),
(15, 15, 'game developer (unity)', 'work on a mobile ludo game.', 'remote', 'contract', '40k - 70k', 1),
(16, 16, 'data entry operator', 'input local business data into system.', 'dhaka', 'part-time', '10k - 12k', 1),
(17, 17, 'technical content writer', 'write blogs about cloud computing.', 'remote', 'freelance', '1k per article', 1),
(18, 18, 'medical representative', 'promote pharmaceutical products.', 'dhaka', 'full-time', '22k + ta/da', 1),
(19, 19, 'textile engineer', 'knowledge of fabric dyeing processes.', 'narsingdi', 'full-time', '40k - 55k', 1),
(20, 1, 'python django dev', 'build scalable web applications.', 'remote', 'full-time', '60k - 90k', 1),
(1, 10, 'office assistant', 'handle files and basic computer tasks.', 'dhaka', 'full-time', '15k - 18k', 1),
(2, 2, 'wordpress dev', 'customize themes and plugins.', 'remote', 'freelance', '20k per project', 1);
go
insert into community_gigs (us_id, community_id, gig_title, gig_service_type, gig_description, starting_price, portfolio_link, gig_status, created_at)
values 
(2, 2, 'professional logo design', 'graphics', 'i will design a unique logo for your business.', 2500.00, 'port.folio/nusrat', 'available', getdate()),
(4, 4, 'mobile app ui design', 'design', 'clean and modern ui/ux design for android/ios.', 8000.00, 'behance.net/sadia', 'available', getdate()),
(5, 2, 'full stack web development', 'tech', 'i will build your business website using mern stack.', 15000.00, 'github.com/rakib', 'available', getdate()),
(6, 2, 'figma to html conversion', 'tech', 'pixel perfect figma to bootstrap or tailwind.', 3000.00, 'port.folio/farhana', 'available', getdate()),
(7, 12, 'social media marketing', 'marketing', 'i will manage your facebook and instagram pages.', 5000.00, 'social.me/mehedi', 'available', getdate()),
(8, 12, 'seo audit & ranking', 'marketing', 'get your website on the first page of google.', 12000.00, 'seo.me/kamrul', 'available', getdate()),
(10, 9, 'professional event photography', 'arts', 'available for corporate events and weddings.', 10000.00, 'shakil.photo', 'available', getdate()),
(11, 2, 'bangla content writing', 'writing', 'high quality blog posts and articles in bengali.', 1000.00, 'write.me/tamanna', 'available', getdate()),
(13, 2, 'android app development', 'tech', 'native android apps using java or kotlin.', 20000.00, 'github.com/sumaiya', 'available', getdate()),
(15, 12, 'instagram growth manager', 'marketing', 'i will increase your organic followers.', 4000.00, 'port.folio/labiba', 'available', getdate()),
(17, 1, 'react component development', 'tech', 'i will build reusable react components for you.', 5000.00, 'github.com/anika', 'available', getdate()),
(20, 15, 'video editing for youtube', 'arts', 'i edit vlogs, gaming videos, and documentaries.', 3000.00, 'youtube.com/emon', 'available', getdate()),
(1, 16, 'python automation scripts', 'tech', 'i can automate your boring daily tasks.', 6000.00, 'github.com/arif', 'available', getdate()),
(12, 2, 'api integration services', 'tech', 'integrating third party apis like stripe or sslcommerz.', 7000.00, 'port.folio/nazmul', 'available', getdate()),
(9, 9, 'photo retouching & editing', 'arts', 'professional high-end skin retouching.', 500.00, 'port.folio/mithila', 'available', getdate()),
(14, 2, 'business plan writing', 'business', 'i will write a professional plan for your startup.', 10000.00, 'port.folio/faisal', 'available', getdate()),
(16, 2, 'it consultancy', 'tech', 'advice on your office network and it infrastructure.', 5000.00, 'port.folio/joy', 'available', getdate()),
(19, 2, 'cyber security audit', 'tech', 'i will test your website for common vulnerabilities.', 15000.00, 'safe.me/israt', 'available', getdate()),
(18, 1, 'backend architecture design', 'tech', 'i will design your database and server structure.', 25000.00, 'github.com/riad', 'available', getdate()),
(2, 4, 't-shirt vector design', 'graphics', 'custom vector illustrations for print on demand.', 2000.00, 'port.folio/nusrat2', 'available', getdate());
go
insert into job_applications (job_id, applicant_id, cover_letter, app_status, applied_at)
values 
(1, 5, 'i have 3 years of experience in react and redux. i would love to join your team.', 'pending', getdate()),
(1, 17, 'specialist in frontend optimization and next.js. check my github!', 'interviewing', getdate()),
(2, 6, 'i have a strong background in manual testing and familiar with selenium.', 'pending', getdate()),
(2, 12, 'sqa is my passion. i am looking for my first professional role.', 'rejected', getdate()),
(3, 9, 'based in chittagong and have previous experience in logistics.', 'pending', getdate()),
(4, 2, 'i can deliver high-quality figma designs within your timeframe.', 'interviewing', getdate()),
(5, 14, 'i am a local from sylhet with great networking skills.', 'pending', getdate()),
(6, 4, 'experienced in educational content creation and figma teaching.', 'pending', getdate()),
(8, 1, 'i am looking to move into network administration from dev.', 'pending', getdate()),
(11, 13, 'php laravel is my core strength. check my latest projects.', 'interviewing', getdate()),
(13, 10, 'i know the feni area very well and have experience in field sales.', 'pending', getdate()),
(15, 20, 'i am a gamer and a unity developer. perfect fit for this role.', 'pending', getdate()),
(17, 4, 'i have written several tech blogs for international clients.', 'interviewing', getdate()),
(19, 14, 'i have a diploma in textile engineering and live in narsingdi.', 'pending', getdate()),
(20, 5, 'django is my favorite backend framework. i am ready to start.', 'pending', getdate()),
(1, 13, 'experienced react dev looking for a new challenge in dhaka.', 'rejected', getdate()),
(15, 6, 'unity developer with a focus on mobile game performance.', 'pending', getdate()),
(11, 1, 'expert in php and database management systems.', 'pending', getdate()),
(3, 15, 'previous management experience at a similar firm in ctg.', 'interviewing', getdate()),
(5, 7, 'i have worked with several startup founders in the sylhet region.', 'pending', getdate());
go
insert into privacycustomer (privacy_id, problem_id, solved_id, us_id, visibility_account)
values 
(1, 101, 201, 1, 1),
(2, 102, 202, 2, 0), 
(3, 103, 203, 3, 1),
(4, 104, 204, 4, 1),
(5, 105, 205, 5, 1),
(6, 106, 206, 6, 0), 
(7, 107, 207, 7, 1),
(8, 108, 208, 8, 1),
(9, 109, 209, 9, 1),
(10, 110, 210, 10, 1),
(11, 111, 211, 11, 1),
(12, 112, 212, 12, 0),
(13, 113, 213, 13, 1),
(14, 114, 214, 14, 1),
(15, 115, 215, 15, 1),
(16, 116, 216, 16, 1),
(17, 117, 217, 17, 1),
(18, 118, 218, 18, 0),
(19, 119, 219, 19, 1),
(20, 120, 220, 20, 1);
go
insert into [notification] (us_id, notification_type, is_read_notification, n_created_at)
values 
(1, 'new comment on your post', 0, getdate()),
(2, 'your job application was viewed', 1, getdate()),
(3, 'someone shared your post', 0, getdate()),
(4, 'new job posted in dhaka tech hub', 0, getdate()),
(5, 'community invite: creative bangladesh', 1, getdate()),
(6, 'password changed successfully', 1, getdate()),
(7, 'new message from tanvir', 0, getdate()),
(8, 'your gig was added to favorites', 0, getdate()),
(9, 'weekly community summary available', 1, getdate()),
(10, 'new follower alert', 0, getdate()),
(11, 'interview request for php developer', 0, getdate()),
(12, 'comment liked by nusrat', 1, getdate()),
(13, 'new member joined your community', 0, getdate()),
(14, 'account verification successful', 1, getdate()),
(15, 'your post is trending in sylhet', 0, getdate()),
(16, 'reminder: tech meetup tomorrow', 0, getdate()),
(17, 'new gig request: ui design', 0, getdate()),
(18, 'system update: new privacy features', 1, getdate()),
(19, 'someone mentioned you in a comment', 0, getdate()),
(20, 'application status updated: pending', 1, getdate());
go
insert into datacontrol (control_type, us_id, data_ctrl_start_at, data_ctrl_end_at)
values 
('login_session', 1, getdate(), dateadd(hour, 2, getdate())),
('profile_update', 2, getdate(), getdate()),
('password_reset', 3, getdate(), getdate()),
('login_session', 4, getdate(), dateadd(hour, 1, getdate())),
('data_export_request', 5, getdate(), dateadd(minute, 30, getdate())),
('account_deactivation_check', 6, getdate(), getdate()),
('login_session', 7, getdate(), dateadd(hour, 5, getdate())),
('security_audit', 8, getdate(), getdate()),
('login_session', 9, getdate(), dateadd(hour, 3, getdate())),
('email_change_verification', 10, getdate(), getdate()),
('login_session', 11, getdate(), dateadd(hour, 1, getdate())),
('privacy_settings_change', 12, getdate(), getdate()),
('login_session', 13, getdate(), dateadd(hour, 4, getdate())),
('two_factor_auth_setup', 14, getdate(), getdate()),
('login_session', 15, getdate(), dateadd(hour, 2, getdate())),
('failed_login_attempt', 16, getdate(), getdate()),
('session_timeout', 17, getdate(), getdate()),
('api_key_generation', 18, getdate(), getdate()),
('login_session', 19, getdate(), dateadd(hour, 8, getdate())),
('account_recovery', 20, getdate(), getdate());
go



--==============SECTION 02: Retrieve data using SELECT STATEMENT======================

--1. string expressions & concatenate

select 
    us_fname + ' ' + us_lname as full_name,
    'contact: ' + us_email as contact_info
from usertable;



select 
    job_title + ' (' + job_location + ')' as job_display,
    salary_range
from community_jobs;


select 
    'member: ' + cast(us_id as varchar) + ' is a ' + member_role + ' with rank ' + member_rank as membership_desc
from communities_member;


--2. arithmetic expressions

select 
    gig_title,
    starting_price,
    (starting_price * 0.10) as service_fee,
    (starting_price + (starting_price * 0.10)) as total_price
from community_gigs;

select 
    us_id,
    help_count,
    (help_count * 2) as bonus_score
from communities_member;


select 
    gig_title,
    starting_price as monthly_rate,
    (starting_price / 4) as estimated_weekly_rate
from community_gigs;



--3. all, distinct, top, percent, with ties

select distinct com_type 
from communities;

select top 10 percent 
    gig_title, 
    starting_price 
from community_gigs 
order by starting_price desc;

select top 5 with ties 
    us_id, 
    help_count 
from communities_member 
order by help_count desc;


--4 comparison operator & between

select * from community_gigs 
where starting_price between 5000 and 15000;

select * from job_applications 
where applied_at >= '2024-01-01';


select * from communities_member 
where help_count > 50;


--5. logical operators (and, or, not)

select * from community_jobs 
where is_active = 1 and job_location = 'remote';

select * from community_jobs 
where job_type = 'full-time' or job_type = 'contract';

select * from usertable 
where not account_status = 'suspended';

--6. like & is null
select us_fname, us_bio 
from usertable 
where us_bio like '%developer%';

select com_name 
from communities 
where com_bio is null;

select us_email 
from usertable 
where us_email like '%@email.com';


-- 7 range of selected rows (offset fetch)

select community_id, com_name, com_type
from communities
order by community_id
offset 5 rows fetch next 5 rows only;

select job_id, job_title, created_at
from community_jobs
order by created_at desc
offset 10 rows fetch next 10 rows only;

--8 all types of join

select u.us_fname, u.us_lname, c.com_name, m.member_role
from usertable u
inner join communities_member m on u.us_id = m.us_id
inner join communities c on m.community_id = c.community_id;

select u.us_fname, u.us_email, p.post_id, p.content
from usertable u
left join post p on u.us_id = p.us_id;

select u.us_fname, p.content, p.post_type
from post p
right join usertable u on p.us_id = u.us_id;

select u.us_fname, c.com_name, m.member_role
from usertable u
full outer join communities_member m on u.us_id = m.us_id
full outer join communities c on m.community_id = c.community_id;

select u.us_fname, c.com_name
from usertable u
cross join communities c;

-- 9 compound join 

select m.message_content, s.us_id as sender_user, r.us_id as receiver_user
from [message] m
join messagesender s on m.sender_id = s.send_id 
    and s.is_group_chat = 0
join messagereciever r on m.reciever_id = r.recieve_id 
    and r.is_group_chat = 0;


--10 union , except and intersect 


-- distinct list of emails
select us_email from usertable
union
select cast(us_id as nvarchar) + '@system.com' from privacycustomer;



-- all records including duplicates
select us_id from usertable
union all
select us_id from post;


-- users in the system minus users who have posted
select us_id from usertable
except
select us_id from post;


-- users who are community members
select us_id from communities_member
intersect
-- users who have posted a job
select employer_id from community_jobs;


--11  group by & having

select 
    community_id, 
    count(us_id) as member_count
from communities_member
group by community_id
having count(us_id) > 5;

--12  Rollup, cube and Grouping sets

select 
    gig_service_type, 
    count(gig_id) as total_gigs
from community_gigs
group by rollup (gig_service_type);

select 
    gig_service_type, 
    gig_status, 
    avg(starting_price) as avg_price
from community_gigs
group by cube (gig_service_type, gig_status);

select 
    job_id, 
    app_status, 
    count(application_id) as total_apps
from job_applications
group by grouping sets (
    (job_id), 
    (app_status), 
    () -- this empty parenthesis represents the grand total
);


--13 subqueries 

select us_fname, us_lname
from usertable
where us_id in (
    select us_id 
    from communities_member 
    where help_count > (select avg(help_count) from communities_member)
);

select j.job_title
from community_jobs j
where 5 < (
    select count(*) 
    from job_applications a 
    where a.job_id = j.job_id
);

--14 cte (common table expression)

with highvaluesellers as (
    select us_id, sum(starting_price) as total_revenue
    from community_gigs
    group by us_id
    having sum(starting_price) > 20000
)
select u.us_fname, u.us_email, h.total_revenue
from usertable u
join highvaluesellers h on u.us_id = h.us_id;

--15 recursive cte
with rankhierarchy as (
    -- anchor member: start with the highest rank
    select member_rank, 1 as rank_level
    from communities_member
    where member_rank = 'legend'

    union all

    -- recursive member: move down the hierarchy
    select m.member_rank, rh.rank_level + 1
    from communities_member m
    inner join rankhierarchy rh on (rh.rank_level = 1 and m.member_rank = 'platinum')
    where m.member_rank <> 'legend'
)
select distinct member_rank, rank_level 
from rankhierarchy;

--16 Cast ,Convert and Try convert

select 
    gig_title, 
    '$' + cast(starting_price as nvarchar(20)) as price_label
from community_gigs;

select 
    us_fname, 
    convert(nvarchar(20), us_dt_birth, 101) as formatted_birthday
from usertable;

select 
    job_title, 
    salary_range,
    try_convert(decimal(10,2), salary_range) as numeric_salary
from community_jobs
where try_convert(decimal(10,2), salary_range) > 50000;



-- 17 Functions ( String ,Numeric and  Date Function ,COALESCE, ISNULL, CASE, IIF, CHOOSE)

-- string function 

select 
    -- 1. len: returns the number of characters in the user's bio
    len(us_bio) as bio_length,

    -- 2. upper: converts the last name to all uppercase for formal display
    upper(us_lname) as last_name_upper,

    -- 3. lower: converts the email to lowercase to ensure consistency
    lower(us_email) as email_lowercase,

    -- 4. substring: extracts the first 15 characters of a post for a "preview"
    substring(us_bio, 1, 15) as bio_preview,

    -- 5. replace: replaces the word 'active' with 'verified' in account status
    replace(account_status, 'active', 'verified') as updated_status,

    -- 6. left: gets the first 3 characters of a phone number (area code)
    left(us_phone, 3) as phone_prefix,

    -- 7. right: gets the last 4 digits of a phone number for privacy masking
    right(us_phone, 4) as phone_suffix,

    -- 8. charindex: finds the position of the '@' symbol in an email address
    charindex('@', us_email) as at_symbol_position,

    -- 9. concat: joins first and last name with a space (alternative to +)
    concat(us_fname, ' ', us_lname) as full_name,

    -- 10. replicate: repeats a character (useful for creating visual separators in console reports)
    replicate('*', 5) as separator,

    -- 11. reverse: reverses the characters in the community name
    reverse(com_name) as reversed_com_name,

    -- 12. trim: removes leading and trailing spaces from a gig title
    trim(gig_title) as cleaned_gig_title
from usertable, communities, community_gigs;




 -- numeric  function 

 select 
    -- 1. abs: absolute difference between prices
    abs(starting_price - 500) as price_diff,

    -- 2. ceiling: round up price to nearest whole number
    ceiling(starting_price) as round_up,

    -- 3. floor: round down price to nearest whole number
    floor(starting_price) as round_down,

    -- 4. round: round to 2 decimal places
    round(starting_price, 2) as price_rounded,

    -- 5. power: calculate help score squared
    power(help_count, 2) as help_squared,

    -- 6. sqrt: square root of help score
    sqrt(help_count) as help_root,

    -- 7. rand: generate a random number for lucky draws
    rand() as random_seed

 
  from community_gigs, communities_member;


  select 
    -- 1. getdate(): returns the current system date and time
    getdate() as current_system_time,

    -- 2. sysdatetime(): returns a higher precision date and time than getdate()
    sysdatetime() as high_precision_now,

    -- 3. datename(): returns a string representing the specified part of a date (e.g., the month name)
    datename(month, us_dt_birth) as birth_month_name,

    -- 4. datepart(): returns an integer representing the specified part of a date (e.g., the year)
    datepart(year, us_dt_birth) as birth_year,

    -- 5. day(): shorthand for datepart(day, date), returns the day of the month
    day(us_dt_birth) as day_of_birth,

    -- 6. month(): shorthand for datepart(month, date), returns the month number
    month(us_dt_birth) as month_number,

    -- 7. year(): shorthand for datepart(year, date), returns the year number
    year(us_dt_birth) as year_number,

    -- 8. datediff(): calculates the difference between two dates (e.g., age in years)
    datediff(year, us_dt_birth, getdate()) as calculated_age,

    -- 9. dateadd(): adds an interval to a date (e.g., adding 7 days to a post date to show an "expiry")
    dateadd(day, 7, createdpost_at) as post_expiry_date,

    -- 10. eomonth(): returns the last day of the month for a given date
    eomonth(createdpost_at) as month_end_for_post

from usertable, post;



-- iff 

select 
    us_fname, 
    account_status,
    iif(account_status = 'active', 'access granted', 'access denied') as login_check
from usertable;

--choose 

select 
    us_id,
    choose(cast(help_count as int), 'bronze', 'silver', 'gold', 'platinum') as badge
from communities_member
where help_count between 1 and 4;


-- case

select 
    gig_title,
    starting_price,
    case 
        when starting_price > 15000 then 'premium service'
        when starting_price between 5000 and 15000 then 'standard service'
        else 'budget service'
    end as service_category
from community_gigs;

--isnull and coalesce

select 
   
    isnull(us_bio, 'no bio provided') as bio_status,
    
    coalesce(us_bio, us_profile, 'no info available') as user_info
from usertable;

--18 all rank function 


select 
    row_number() over (order by us_dt_birth asc) as user_sequence,
    us_fname, 
    us_lname, 
    us_dt_birth
from usertable;

select 
    rank() over (order by starting_price desc) as price_rank,
    gig_title, 
    starting_price
from community_gigs;

select 
    dense_rank() over (order by help_count desc) as contribution_rank,
    us_id, 
    help_count
from communities_member;

select 
    ntile(4) over (order by us_id) as user_quartile,
    us_fname, 
    us_email
from usertable;

-- 19 analytic functions

select 
    gig_service_type,
    gig_title,
    starting_price,
    lag(starting_price) over (partition by gig_service_type order by starting_price) as previous_cheaper_price
from community_gigs;

select 
    us_fname, 
    us_dt_birth,
    lead(us_dt_birth) over (order by us_dt_birth) as next_users_birthday
from usertable;

select 
    gig_service_type,
    gig_title,
    starting_price,
    first_value(gig_title) over (partition by gig_service_type order by starting_price) as cheapest_in_category
from community_gigs;

select 
    job_id, 
    applied_at,
    last_value(applied_at) over (partition by job_id order by applied_at 
    rows between unbounded preceding and unbounded following) as latest_app_date
from job_applications;

select 
    us_id, 
    help_count,
    percent_rank() over (order by help_count) as help_percentile
from communities_member;

select 
    gig_title, 
    starting_price,
    cume_dist() over (order by starting_price) as price_distribution
from community_gigs;

select distinct
    percentile_cont(0.5) within group (order by starting_price) over () as median_price_continuous
from community_gigs;

select distinct
    percentile_disc(0.5) within group (order by starting_price) over () as median_price_discrete
from community_gigs;



-- 20 Try catch and erorron handaling 

begin try
    insert into usertable (us_fname, us_lname, us_email, account_status)
    values ('test', 'user', 'duplicate@email.com', 'active');
    
    print 'user registered successfully!';
end try
begin catch
    print 'error occurred during registration:';
    print 'error number: ' + cast(error_number() as nvarchar);
    print 'error message: ' + error_message();
end catch;
go



begin try
    begin transaction;
        -- attempt to update gig status
        update community_gigs 
        set gig_status = 'sold' 
        where gig_id = 999; -- imagine this id doesn't exist or causes a constraint error

        -- attempt to log the action
        insert into datacontrol (us_id, control_type, data_ctrl_start_at)
        values (1, 'gig_purchase', getdate());

    commit transaction;
    print 'transaction committed successfully.';
end try
begin catch
    if @@trancount > 0
        rollback transaction;

    print 'transaction rolled back due to error: ' + error_message();
end catch;
go


begin try
    -- trying to delete a user that has posts (will trigger foreign key error)
    delete from usertable where us_id = 1;
end try
begin catch
    -- throw (error_number, message, state)
    ;throw 50001, 'cannot delete user: this user has active posts or community memberships.', 1;
end catch;
go


create procedure sp_safe_apply_job
    @jobid bigint,
    @applicantid bigint
as
begin
    begin try
        insert into job_applications (job_id, applicant_id, app_status, applied_at)
        values (@jobid, @applicantid, 'pending', getdate());
        
        print 'application submitted.';
    end try
    begin catch
        select 
            error_number() as errornumber,
            error_severity() as severity,
            error_state() as [state],
            error_procedure() as [procedure],
            error_message() as [message];
    end catch
end;
go



-- 21 merge / upsert statement 

merge communities_member as target
using (select 10 as us_id, 2 as community_id, 5 as new_help) as source
on (target.us_id = source.us_id and target.community_id = source.community_id)

--  when the member exists, update their help count
when matched then
    update set target.help_count = target.help_count + source.new_help

--  when the member does not exist, insert a new record
when not matched then
    insert (us_id, community_id, member_role, member_rank, help_count)
    values (source.us_id, source.community_id, 'member', 'bronze', source.new_help);
go



--==============SECTION 03: Update data from existing table using UPDATE STATEMENT ========================

--1  update: profile & status
update usertable
set us_bio = 'senior software engineer | tech lead',
    account_status = 'verified'
where us_id = 1;
go


--2. update with arithmetic: adjusting prices
update community_gigs
set starting_price = starting_price * 1.10
where gig_service_type = 'graphics' and gig_status = 'available';
go

--3. update with logic: bulk status change

update usertable
set account_status = 'suspended'
where us_id in (15, 18, 20);
go

--4. update with join: community rank promotion
update m
set m.member_rank = 'legend'
from communities_member m
inner join communities c on m.community_id = c.community_id
where c.com_name = 'tech enthusiasts' and m.help_count > 100;
go
--5. update with subquery: cleaning data

update community_jobs
set job_location = 'remote'
where job_location is null 
and community_id in (select community_id from communities where com_privacy = 'public');
go







--===============SECTION 04: Delete data from table using  DELETE STATEMENT==============================

-- 1 delete  a specific record
delete from [notification]
where us_id = 20;
go
--2. delete with comparison: cleaning old sessions
delete from datacontrol
where control_type = 'login_session' 
    and data_ctrl_end_at < '2024-01-01';
go
--3. delete with logic: removing inactive applications
delete from job_applications
where app_status in ('rejected', 'withdrawn');
go
-- 4. delete with subquery: removing ghost members
delete from communities_member
where help_count = 0 
    and community_id in (select community_id from communities where com_privacy = 'private');
go
--5. delete with join: clearing posts from deactivated users
delete p
from post p
inner join usertable u on p.us_id = u.us_id
where u.account_status = 'deactivated';


