## What does this Block do for me?

**(1) Leverage Prebuilt Insights** - Provides insight into Snowflake database usage, long running queries, and other historical metrics.

**(2) Combine Data from Multiple Sources** - Combine Snowflake usage data with other metrics in your organization, (e.g. Redshift performance data) to get a complete view of your information.

**(3) Enterprise Data Platform** - Take advantage of Looker's data platform functionality, including data actions, scheduling, permissions, alerting, parameterization (each user can only see their own data), and more. Get immediate alerts when usage is exceeded, queries exceed a runtime threshold, or any other business criteria.

## Block Info
This Block is built on the ACCOUNT_USAGE share provided by Snowflake. It covers many of the core metrics exposed and should serve as a great jump start for further exploration. Happy modeling!

The schema documentation for Account Usage can be found in [Snowflake's documentation](https://docs.snowflake.net/manuals/LIMITEDACCESS/data-sharing-account-usage.html). Please note that your naming might vary slightly.

## Data Latency
The INFORMATION_SCHEMA views and table functions display data in real-time, whereas the ACCOUNT_USAGE views have some built-in latency, due to the process of extracting the usage data from Snowflake’s internal metadata store. However, the ACCOUNT_USAGE views have been designed to minimize the latency impact, based on the type of data displayed in the views:

#### Runtime:	
Approximately 1 minute for the following views:

- QUERY_HISTORY
- LOGIN_HISTORY

#### Analytic:	
1 hour (or less) for the following views:

-WAREHOUSE_METERING_HISTORY
- STORAGE_USAGE

#### Dictionary:	
1 hour (or less) for the following views:

- COLUMNS
- DATABASES
- FILE_FORMATS
- FUNCTIONS
- REFERENTIAL_CONSTRAINTS
- SCHEMATA
- SEQUENCES
- STAGES
- TABLE_CONSTRAINTS
- TABLE_STORAGE_METRICS
- TABLES
- VIEWS

## Block Structure
### Views
The block contains Looker Views for each of the secure views exposed by the Account Usage share, as well as a view that aggregates user login data into a DT for querying.

### Model File and Joins
Model file joins together the underlying views based on available keys. It provides a starting place for additional custom modeling.

## Implementation Instructions
### Importing the ACCOUNT USAGE Share
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

## Connection Setup
Create a connection to the database created from the ACCOUNT_USAGE share. The database name and schema name entries should correspond to the ones chosen in the previous step.

## Dashboards
The dashboard can be used as is, or customized to your specific requirements. If you've customized the model name, rename the model in each LookML Dashboard element from "snowflake_usage_block" to the model name you've selected. We recommend using a global Find & Replace for this.

## What if I find an error? Suggestions for improvements?
Great! Blocks were designed for continuous improvement through the help of the entire Looker community, and we'd love your input. To log an error or improvement recommentation, simply create a "New Issue" in the corresponding Github repo for this Block. Please be as detailed as possible in your explanation, and we'll address it as quick as we can.
