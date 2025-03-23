--1. Create master key password
--https://learn.microsoft.com/en-us/sql/t-sql/statements/create-master-key-transact-sql?view=sql-server-ver16


--2. Create database scoped credential
--https://learn.microsoft.com/en-us/sql/t-sql/statements/create-database-scoped-credential-transact-sql?view=sql-server-ver16
CREATE DATABASE SCOPED CREDENTIAL cred_isra
WITH
    IDENTITY = 'Managed Identity'
;

--3. Create external data source
CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://awstoredatalake20250320.dfs.core.windows.net/silver/'
    , CREDENTIAL = cred_isra
);


CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://awstoredatalake20250320.dfs.core.windows.net/gold/'
    , CREDENTIAL = cred_isra
);

--https://learn.microsoft.com/en-us/sql/t-sql/statements/create-external-file-format-transact-sql?view=sql-server-ver16&tabs=delimited
CREATE EXTERNAL FILE FORMAT format_parquet
WITH
    (
        FORMAT_TYPE = 'PARQUET'
        , DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
    );


CREATE EXTERNAL TABLE gold.ext_sales
WITH (
    LOCATION = 'extsales'
    , DATA_SOURCE = source_gold
    , FILE_FORMAT = format_parquet
) AS 
SELECT * FROM gold.sales;