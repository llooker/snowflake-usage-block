## What does this Block do for me?

**(1) Reduce Costs and Optimize Performance** - Gain a holistic view across your datawarehouse and optimize across the board. Identify your longest running queries, most costly queries, troublesome users, and more, to uncover the most impactful cost-saving and performance-enhancing opportunities.  

**(2) Monitor Cost and Usage Data** - Provide comprehensive insights around your Snowflake deployment and usage across all your tables, databases and users. See how these metrics trend over time and compare to prior periods to ensure you're scaling effectively.

**(3) Compare Performance Across Databases** - If you're using another database, in addition to Snowflake, and want to understand the cost and performance implications for your workloads across your cloud environments, compare the Snowflake results from this Block with the results from other databases, such as Redshift ([Block here](https://looker.com/platform/blocks/source/redshift-optimization-by-aws)) or BigQuery([Block here](https://looker.com/platform/blocks/source/google-cloud-billing-by-datatonic)). 

**(4) Enterprise Data Platform** - Take advantage of Looker's data platform functionality, including data actions, scheduling, permissions, alerting, parameterization (each user can only see their own data), and more. Get immediate alerts when usage is exceeded, queries exceed a runtime threshold, or any other business criteria.

## Snowflake Account Usage Data Structure
* Snowflake's Account Usage dataset comes complete with several tables (called "views"), such as databases, functions, query history, and much more. Colectively these tables give a comprehensive overview of Snowflake operations, execution steps, and processing time.

## Block Structure
* This Block is built on the ACCOUNT_USAGE share provided by Snowflake (using their [Sharehouse](https://www.snowflake.net/data-sharehouse/) offering). 
* Each Snowflake table is represented as it's own view in Looker. The Model file of this Block joins together the underlying views based on available keys. It provides a starting place for additional custom modeling.
This Block covers all of the core metrics that come with the dataset, as well as additional value-add analysis, and should serve as a great jump start for further exploration. 
* The schema documentation for Account Usage can be found in [Snowflake's documentation](https://docs.snowflake.net/manuals/LIMITEDACCESS/data-sharing-account-usage.html). Please note that your naming might vary slightly.

## Additional Info

#### Data Latency
* The INFORMATION_SCHEMA views and table functions display data in real-time, whereas the ACCOUNT_USAGE views have some built-in latency, due to the process of extracting the usage data from Snowflake’s internal metadata store. However, the ACCOUNT_USAGE views have been designed to minimize the latency impact, based on the type of data displayed in the views:

#### Runtime:	
* Approximately 1 minute for the following views: ``QUERY_HISTORY``, ``LOGIN_HISTORY``

#### Analytic:	
* 1 hour (or less) for the following views: ``WAREHOUSE_METERING_HISTORY``, ``STORAGE_USAGE``

#### Dictionary:	
* 1 hour (or less) for the following Columns: ``DATABASES``, ``FILE_FORMATS``, ``FUNCTIONS``, ``REFERENTIAL_CONSTRAINTS``, ``SCHEMATA``, ``SEQUENCES``, ``STAGES``, ``TABLE_CONSTRAINTS``, ``TABLE_STORAGE_METRICS``,``TABLES``, and ``VIEWS``

## Implementation Instructions

#### Importing the ACCOUNT USAGE Share
To import the ACCOUNT_USAGE share, an account administrator must create a local, read-only database from the share. For example:

```
use role accountadmin;

show shares; -- this should return snowflake.account_usage

create database snowflake_account_usage from share snowflake.account_usage;

grant imported privileges on database snowflake_account_usage to role <preferred_role>;

use role <preferred_role>;

use schema snowflake_account_usage.account_usage;

show views;
```

#### Connection Setup
Create a connection to the database created from the ACCOUNT_USAGE share. The database name and schema name entries should correspond to the ones chosen in the previous step.

#### Dashboards
The dashboard can be used as is, or customized to your specific requirements. If you've customized the model name, rename the model in each LookML Dashboard element from "snowflake_usage_block" to the model name you've selected. We recommend using a global Find & Replace for this.

## What if I find an error? Suggestions for improvements?
Great! Blocks were designed for continuous improvement through the help of the entire Looker community, and we'd love your input. To log an error or improvement recommentation, simply create a "New Issue" in the corresponding Github repo for this Block. Please be as detailed as possible in your explanation, and we'll address it as quick as we can.
