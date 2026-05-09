# 🏘️ Community Web Application — Database Design


<p align="center">
  <img src="https://img.shields.io/badge/MS%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white" />
  <img src="https://img.shields.io/badge/SQL-DDL%20%7C%20DML-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Status-Beta%20v1.0-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/License-Academic-green?style=for-the-badge" />
</p>

---

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Database Architecture](#-database-architecture)
- [Schema — Tables](#-schema--tables)
- [DDL Features](#-ddl-features)
- [DML Coverage](#-dml-coverage)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Author](#-author)

---

## 🌐 Project Overview

This project presents a **fully normalized relational database** designed for a community-driven social web application, built entirely on **Microsoft SQL Server**. The database supports core social features including user management, community groups, job postings, freelance gigs, real-time messaging, notifications, and privacy controls.

The design follows industry-standard practices covering **DDL** (schema design, constraints, indexing, views, stored procedures, UDFs, and triggers) and **DML** (data population and comprehensive query techniques).

---

## 🏗️ Database Architecture

The database `communityapp` is structured around **15 core tables** organized into functional domains:

```
communityapp
│
├── 👤 User Domain
│   ├── usertable          — Core user profiles & credentials
│   ├── privacycustomer    — User privacy & visibility settings
│   └── datacontrol        — Audit & data governance log
│
├── 🏘️ Community Domain
│   ├── communities        — Community groups (public/private)
│   └── communities_member — Member roles, ranks & help scores
│
├── 📝 Content Domain
│   ├── post               — User posts (various types)
│   ├── comment            — Post comments
│   └── share              — Post sharing activity
│
├── 💬 Messaging Domain
│   ├── messagesender      — Message send sessions
│   ├── messagereciever    — Message receive sessions
│   └── message            — Message content & metadata
│
├── 💼 Jobs & Gigs Domain
│   ├── community_jobs     — Job listings posted in communities
│   ├── job_applications   — Job application tracking
│   └── community_gigs     — Freelance gig listings
│
└── 🔔 Notification Domain
    └── notification       — In-app notification system
```

---

## 📊 Schema — Tables

| Table | Primary Key | Description |
|---|---|---|
| `usertable` | `us_id` (BIGINT, IDENTITY) | Stores user profile, credentials, and account status |
| `communities` | `community_id` (BIGINT, IDENTITY) | Community groups with type and privacy settings |
| `communities_member` | `(community_id, us_id)` | Composite PK; member roles, ranks, and help scores |
| `post` | `post_id` (BIGINT, IDENTITY) | User posts with type classification |
| `comment` | `(us_id, comment_id)` | Composite PK; threaded comments on posts |
| `share` | `share_id` (BIGINT, IDENTITY) | Post share activity with optional message |
| `messagesender` | `send_id` (BIGINT, IDENTITY) | Sender sessions (direct or group chat) |
| `messagereciever` | `recieve_id` (BIGINT, IDENTITY) | Receiver sessions (direct or group chat) |
| `message` | `(m_created_at, message_id)` — Clustered | Message content between sender and receiver |
| `community_jobs` | `job_id` (BIGINT, IDENTITY) | Job listings linked to a community and employer |
| `job_applications` | `(job_id, application_id)` — Clustered | Applications with status tracking |
| `community_gigs` | `gig_id` (BIGINT, IDENTITY) | Freelance gig listings with pricing |
| `notification` | `notification_id` (BIGINT, IDENTITY) | User notifications with read/unread state |
| `privacycustomer` | `(privacy_id, problem_id, solved_id)` | Privacy configuration per user |
| `datacontrol` | `control_id` (BIGINT, IDENTITY) | Audit log for sensitive data changes |

---

## ⚙️ DDL Features

### Section 01 — Database Creation
Custom `.mdf` and `.ldf` file configuration with defined size, max-size, and growth rate.

### Section 02 — Tables & Constraints
All tables are built with full constraint coverage:
- `PRIMARY KEY` (simple and composite)
- `FOREIGN KEY` (referential integrity across all domains)
- `UNIQUE` (e.g., user email)
- `CHECK` (e.g., age validation: must be ≥ 18)
- `DEFAULT` (e.g., `getdate()`, `'pending'`, `'Remote'`, `'Available'`)
- `NOT NULL` / `NULL` as appropriate

### Section 03 — Schema Alterations
| Operation | Description |
|---|---|
| `ADD COLUMN` | Added `us_social_link` to `usertable` |
| `ALTER COLUMN` | Changed `salary_range` data type to `nvarchar(100)` |
| `ADD CONSTRAINT` | Default `'pending'` for `account_status` |
| `sp_rename` | Renamed `com_connection` → `com_category` |
| `DROP COLUMN` | Removed obsolete `com_job_post` column |

### Section 04 — Indexes

**Clustered Indexes:**
| Index | Table | Key Columns |
|---|---|---|
| `pk_job_app_clustered` | `job_applications` | `(job_id, application_id)` |
| `pk_comment_post_clustered` | `comment` | `(post_id, comment_id)` |
| `pk_message_time_clustered` | `message` | `(m_created_at, message_id)` |

**Non-Clustered Indexes:**
| Index | Table | Key + Include Columns |
|---|---|---|
| `ix_gig_service_price` | `community_gigs` | `(gig_service_type, starting_price)` INCLUDE title, status |
| `ix_user_name_status` | `usertable` | `(us_fname, us_lname, account_status)` |
| `ix_community_type_privacy` | `communities` | `(com_type, com_privacy)` |

### Section 05 — Views

| View | Type | Purpose |
|---|---|---|
| `vw_userdirectory` | Simple | Public user directory (ID, name, email, status) |
| `vw_communitymemberdetails` | JOIN View | Member names, roles, and ranks per community |
| `vw_securejobinfo` | `WITH ENCRYPTION` | Protects salary and job status data |
| `vw_highvaluegigs` | `WITH SCHEMABINDING` | Gigs priced ≥ 10,000 (prevents accidental schema changes) |
| `vw_activeremotejobs` | `WITH CHECK OPTION` | Active remote jobs only; enforces filter on inserts |

### Section 06 — Stored Procedures

| Procedure | Type | Description |
|---|---|---|
| `sp_registeruser` | INSERT with parameters | Registers a new user into the platform |
| `sp_upgradememberrank` | Declare + UPDATE | Promotes member rank based on help count (Legend ≥ 100, Platinum ≥ 50) |
| `sp_getcommunitymembercount` | OUTPUT parameter | Returns member count for a given community |
| `sp_archivejobpost` | UPDATE + DELETE | Deactivates a job and removes its pending applications |
| `sp_sendsecuremessage` | Conditional INSERT | Validates sender before sending a message |

### Section 07 — User-Defined Functions (UDFs)

| Function | Type | Description |
|---|---|---|
| `fn_calculateage` | Scalar | Calculates accurate age from a birth date |
| `fn_gettotalapplicants` | Scalar | Returns total applications for a given job |
| `fn_getgigsbypricerange` | Inline TVF | Filters gigs between a min and max price |
| `fn_getuserposts` | Inline TVF | Returns all posts by a specific user |
| `fn_getcommunitysummary` | Multi-Statement TVF | Returns per-community: member count, active jobs, total help score |

### Section 08 — Triggers

| Trigger | Event | Description |
|---|---|---|
| `trg_aftermessagesent` | AFTER INSERT on `message` | Auto-inserts a `new_message` notification for the receiver |
| `trg_aftersalaryupdate` | AFTER UPDATE on `community_jobs` | Logs salary changes to `datacontrol` audit table |
| `trg_aftercommunitydelete` | AFTER DELETE on `communities` | Cascades deletion of all community memberships |
| `trg_insteadofuserdelete` | INSTEAD OF DELETE on `usertable` | Soft-deletes users by setting `account_status = 'deleted'` |
| `trg_formemberjoin` | FOR INSERT on `communities_member` | Initializes `help_count = 0` for all new members |

---

## 📝 DML Coverage

The `communityapp.dml.sql` file seeds the database with **20 realistic Bangladeshi user profiles** and covers an extensive range of SQL querying techniques:

### Data Operations
- `INSERT` — Bulk inserts across all 15 tables with relational consistency

### Query Techniques
| Category | Techniques Covered |
|---|---|
| **Filtering** | `WHERE`, `BETWEEN`, `LIKE`, `IS NULL`, comparison operators |
| **Set Control** | `ALL`, `DISTINCT`, `TOP`, `PERCENT`, `WITH TIES` |
| **Logical** | `AND`, `OR`, `NOT` |
| **Pagination** | `OFFSET ... FETCH` |
| **Joins** | `INNER`, `LEFT`, `RIGHT`, `FULL OUTER`, `CROSS`, Compound JOINs |
| **Set Operations** | `UNION`, `UNION ALL`, `EXCEPT`, `INTERSECT` |
| **Aggregation** | `GROUP BY`, `HAVING`, `ROLLUP`, `CUBE`, `GROUPING SETS` |
| **Subqueries** | Correlated subqueries, scalar subqueries |
| **CTEs** | Standard CTE, Recursive CTE |
| **Type Conversion** | `CAST`, `CONVERT`, `TRY_CONVERT` |
| **Functions** | String, Numeric, Date functions; `COALESCE`, `ISNULL`, `CASE`, `IIF`, `CHOOSE` |
| **Window Functions** | Ranking (`ROW_NUMBER`, `RANK`, `DENSE_RANK`) and Analytic functions |
| **Error Handling** | `TRY...CATCH` blocks |
| **Merge** | `MERGE` (upsert) statement |

---

## 📁 Project Structure

```
MS SQL Server project/
│
├── communityapp.ddl.sql   # Schema: tables, indexes, views, SPs, UDFs, triggers
├── communityapp.dml.sql   # Data: inserts, selects, updates, deletes, advanced queries
└── case study.pdf         # Project case study and requirements document
```

---

## 🚀 Getting Started

### Prerequisites
- Microsoft SQL Server 2019 or later (`MSSQL17.MSSQLSERVER`)
- SQL Server Management Studio (SSMS) or Azure Data Studio

### Setup Instructions

**1. Run the DDL script first to create the database and schema:**
```sql
-- Open communityapp.ddl.sql in SSMS and execute
-- This will:
--   ✔ Drop and recreate the 'communityapp' database
--   ✔ Create all 15 tables with constraints
--   ✔ Apply schema alterations
--   ✔ Create indexes, views, stored procedures, UDFs, and triggers
```

**2. Run the DML script to populate and query the database:**
```sql
-- Open communityapp.dml.sql in SSMS and execute
-- This will:
--   ✔ Insert seed data across all tables
--   ✔ Execute SELECT, UPDATE, DELETE statements
--   ✔ Demonstrate all advanced SQL query techniques
```

> ⚠️ **Note:** The DDL script uses a hardcoded file path for the `.mdf` and `.ldf` files:
> `C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\`
> Update this path to match your SQL Server installation if it differs.

---

## 👤 Author

| Field | Details |
|---|---|
| **Name** | Atikur Rahman |
| **Student ID** | 1294236 |
| **Batch ID** | WADA/PNTL-M/69/01 |
| **Project** | Community Web Application (Beta v1.0) — Database Design with MS SQL Server |

---

<p align="center">
  Made with ❤️ using <strong>Microsoft SQL Server</strong>
</p>
