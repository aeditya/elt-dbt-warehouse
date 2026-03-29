Welcome to E-commerce Data Warehouse Project 

# Overview

Bulit an end to end data warehouse using dbt and snowflake on UK retail dataset

# Architecture
RAW ---->  STAGING  -----> DIMENSIONS ---->  FACT 

# Key-Features
- Star Schema Modeling
- Incremental Fact Table
- Surrogate Keys 
- Data Quality Testing
- dbt Lineage Graph 

# Fact Table Grain 
  Invoice Number + Product 

# Challenges Solved 

- Duplicate records due to source data behaviour 
- Join explosion due to non-unique dimensions
- Incorrect incremental behavioue due to wrong grain  


# Tech Stack
- dbt cloud 
- snowflake
- GitHub 

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
