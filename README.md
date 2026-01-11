# Cast Vote Records ETL Pipeline

This project ingests a large amount of data from a Cast Vote Record(CVR)  from the 2020 U.S. Election and loads it into a relational MySQL database for structured querying and analysis.

Data source is partitioned parquet filed divided by state and further by county. The pipeline processes these files in batches to handle large datasets efficiently without exceeding memory limits.

## Key Features
 - Reads and processes Parquet-based CVR data in chunks
 - Transforms semi-structured election data into normalized, relational schema
 - Loads data into MySQL with integrity constraints and indexed columns
 - Designed to scale to hundreds of millions of records


 ## Data Source
 Cast Vote Records: A Database of Ballots from the 2020 U.S. Election  
Harvard Dataverse  
https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/PQQ3KV

## Technologies
- Python (pandas, pyarrow)
- MySQL
- SQL