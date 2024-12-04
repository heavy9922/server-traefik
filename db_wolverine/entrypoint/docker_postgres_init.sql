CREATE USER defaultuser WITH PASSWORD 'defaultuser123';
CREATE USER adminuser WITH PASSWORD 'adminuser123';
CREATE USER historyuser WITH PASSWORD 'historyuser123';
CREATE USER affiliate_dev WITH PASSWORD 'affiliateuser23';
CREATE USER affiliate_qa WITH PASSWORD 'affiliateuser123';
CREATE USER affiliate_release WITH PASSWORD 'affiliateuser123';
CREATE USER affiliate_apis_dev WITH PASSWORD 'affiliateuser123';
CREATE USER adminuser_dev WITH PASSWORD 'adminuser123';
CREATE USER adminuser_qa WITH PASSWORD 'adminuser123';
CREATE USER adminuser_release WITH PASSWORD 'adminuser123';
CREATE USER adminuser_apis_dev WITH PASSWORD 'adminuser123';
CREATE USER historyuser_dev WITH PASSWORD 'historyuser123';
CREATE USER historyuser_qa WITH PASSWORD 'historyuser123';
CREATE USER historyuser_release WITH PASSWORD 'historyuser123';
CREATE USER historyuser_apis_dev WITH PASSWORD 'historyuser123';
CREATE USER inlabet_dev WITH PASSWORD 'inlabetuser123';
CREATE USER inlabet_qa WITH PASSWORD 'inlabetuser123';
CREATE USER inlabet_release WITH PASSWORD 'inlabetuser123';
CREATE USER inlajobs_dev WITH PASSWORD 'inlajobsuser123';
CREATE USER inlajobs_qa WITH PASSWORD 'inlajobsuser123';
CREATE USER inlajobs_release WITH PASSWORD 'inlajobsuser123';
CREATE USER integrations_dev WITH PASSWORD 'integrationsuser123';
CREATE USER integrations_qa WITH PASSWORD 'integrationsuser123';
CREATE USER integrations_release WITH PASSWORD 'integrationsuser123';
CREATE ROLE read_only;


-- db affiliate
CREATE DATABASE inlaze_affiliate_db_dev
    WITH
    OWNER = affiliate_dev;
CREATE DATABASE inlaze_affiliate_db_qa
    WITH
    OWNER = affiliate_qa;
CREATE DATABASE inlaze_affiliate_db_release
    WITH
    OWNER = affiliate_release;
CREATE DATABASE inlaze_affiliate_db_apis_dev
    WITH
    OWNER = affiliate_apis_dev;

-- db admindb     

CREATE DATABASE inlaze_admindb_dev
    WITH
    OWNER = adminuser_dev;
CREATE DATABASE inlaze_admindb_qa
    WITH
    OWNER = adminuser_qa;
CREATE DATABASE inlaze_admindb_release
    WITH
    OWNER = adminuser_release;
CREATE DATABASE inlaze_admindb_apis_dev
    WITH
    OWNER = adminuser_apis_dev;

-- db historydb

CREATE DATABASE inlaze_historydb_dev
    WITH
    OWNER = historyuser_dev;
CREATE DATABASE inlaze_historydb_qa
    WITH
    OWNER = historyuser_qa;
CREATE DATABASE inlaze_historydb_release
    WITH
    OWNER = historyuser_release;
CREATE DATABASE inlaze_historydb_apis-dev
    WITH
    OWNER = historyuser_apis-dev;

-- db inlabet

CREATE DATABASE inlabetdb_dev
    WITH
    OWNER = inlabet_dev;
CREATE DATABASE inlabetdb_qa
    WITH
    OWNER = inlabet_qa;
CREATE DATABASE inlabetdb_release
    WITH
    OWNER = inlabet_release;

-- db inlajobs

CREATE DATABASE inlajobs_inlajobsdb_dev
    WITH
    OWNER = inlajobs_dev;
CREATE DATABASE inlajobs_inlajobsdb_qa
    WITH
    OWNER = inlajobs_qa;
CREATE DATABASE inlajobs_inlajobsdb_release
    WITH
    OWNER = inlajobs_release;

-- db integrations

CREATE DATABASE integrations_dev
    WITH
    OWNER = integrations_dev;
CREATE DATABASE integrations_qa
    WITH
    OWNER = integrations_qa;
CREATE DATABASE integrations_release
    WITH
    OWNER = integrations_release;

GRANT ALL PRIVILEGES ON DATABASE admindb TO adminuser;
GRANT ALL PRIVILEGES ON DATABASE inlaze_admindb_dev TO adminuser_dev;
GRANT ALL PRIVILEGES ON DATABASE inlaze_admindb_qa TO adminuser_qa;
GRANT ALL PRIVILEGES ON DATABASE inlaze_admindb_release TO adminuser_release;
GRANT ALL PRIVILEGES ON DATABASE inlaze_admindb_apis_dev TO adminuser_apis_dev;
GRANT ALL PRIVILEGES ON DATABASE historydb TO historyuser;
GRANT ALL PRIVILEGES ON DATABASE inlaze_historydb_dev TO historyuser_dev;
GRANT ALL PRIVILEGES ON DATABASE inlaze_historydb_qa TO historyuser_qa;
GRANT ALL PRIVILEGES ON DATABASE inlaze_historydb_release TO historyuser_release;
GRANT ALL PRIVILEGES ON DATABASE inlaze_historydb_apis_dev TO historyuser_apis_dev;
GRANT ALL PRIVILEGES ON DATABASE defaultdb TO defaultuser;
GRANT ALL PRIVILEGES ON DATABASE inlaze_affiliate_db_dev TO affiliate_dev;
GRANT ALL PRIVILEGES ON DATABASE inlaze_affiliate_db_qa TO affiliate_qa;
GRANT ALL PRIVILEGES ON DATABASE inlaze_affiliate_db_release TO affiliate_release;
GRANT ALL PRIVILEGES ON DATABASE inlaze_affiliate_db_apis_dev TO affiliate_apis_dev;
GRANT ALL PRIVILEGES ON DATABASE inlabetdb_dev TO inlabet_dev;
GRANT ALL PRIVILEGES ON DATABASE inlabetdb_qa TO inlabet_qa;
GRANT ALL PRIVILEGES ON DATABASE inlabetdb_release TO inlabet_release;
GRANT ALL PRIVILEGES ON DATABASE inlajobs_inlajobsdb_dev TO inlajobs_dev;
GRANT ALL PRIVILEGES ON DATABASE inlajobs_inlajobsdb_qa TO inlajobs_qa;
GRANT ALL PRIVILEGES ON DATABASE inlajobs_inlajobsdb_release TO inlajobs_release;
GRANT ALL PRIVILEGES ON DATABASE integrations_dev TO integrations_dev;
GRANT ALL PRIVILEGES ON DATABASE integrations_qa TO integrations_qa;
GRANT ALL PRIVILEGES ON DATABASE integrations_release TO integrations_release;


ALTER USER adminuser WITH SUPERUSER;
ALTER USER adminuser_dev WITH SUPERUSER;
ALTER USER adminuser_qa WITH SUPERUSER;
ALTER USER adminuser_release WITH SUPERUSER;
ALTER USER adminuser_apis_dev WITH SUPERUSER;

ALTER USER defaultuser WITH SUPERUSER;
ALTER USER affiliate_dev WITH SUPERUSER;
ALTER USER affiliate_qa WITH SUPERUSER;
ALTER USER affiliate_release WITH SUPERUSER;
ALTER USER affiliate_apis_dev WITH SUPERUSER;

ALTER USER historyuser WITH SUPERUSER;
ALTER USER historyuser_dev WITH SUPERUSER;
ALTER USER historyuser_qa WITH SUPERUSER;
ALTER USER historyuser_release WITH SUPERUSER;
ALTER USER historyuser_apis_dev WITH SUPERUSER;

ALTER USER inlajobs_dev WITH SUPERUSER;
ALTER USER inlajobs_qa WITH SUPERUSER;
ALTER USER inlajobs_release WITH SUPERUSER;

ALTER USER inlabet_dev WITH SUPERUSER;
ALTER USER inlabet_qa WITH SUPERUSER;
ALTER USER inlabet_release WITH SUPERUSER;

ALTER USER integrations_dev WITH SUPERUSER;
ALTER USER integrations_dev WITH SUPERUSER;
ALTER USER integrations_dev WITH SUPERUSER;


ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO read_only;

