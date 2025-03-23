CREATE VIEW gold.calendar 
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awstoredatalake20250320.dfs.core.windows.net/silver/AdventureWorks_Calendar/'
        , FORMAT = 'PARQUET'
    ) AS QUER1
;

CREATE VIEW gold.customers 
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awstoredatalake20250320.dfs.core.windows.net/silver/AdventureWorks_Customers/'
        , FORMAT = 'PARQUET'
    ) AS QUER1
;


CREATE VIEW gold.products 
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awstoredatalake20250320.dfs.core.windows.net/silver/AdventureWorks_Products/'
        , FORMAT = 'PARQUET'
    ) AS QUER1
;

CREATE VIEW gold.returns 
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awstoredatalake20250320.dfs.core.windows.net/silver/AdventureWorks_Returns/'
        , FORMAT = 'PARQUET'
    ) AS QUER1
;

CREATE VIEW gold.sales 
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awstoredatalake20250320.dfs.core.windows.net/silver/AdventureWorks_Sales_2015_2017/'
        , FORMAT = 'PARQUET'
    ) AS QUER1
;


CREATE VIEW gold.territories 
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awstoredatalake20250320.dfs.core.windows.net/silver/AdventureWorks_Territories/'
        , FORMAT = 'PARQUET'
    ) AS QUER1
;

CREATE VIEW gold.products_subcategories 
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://awstoredatalake20250320.dfs.core.windows.net/silver/Product_Subcategories/'
        , FORMAT = 'PARQUET'
    ) AS QUER1
;