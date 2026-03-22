## Storage Systems
We use a polyglot persistence strategy — which simply means using the right type of database for each job, rather than forcing everything into one system.

OLTP Database (PostgreSQL/MySQL): This handles all the live, day-to-day patient records in the EHR system. It's built for fast, reliable transactions — the kind that happen constantly in a busy hospital environment.
Data Lake (AWS S3/Azure Data Lake): This is where raw data extracted from the OLTP system gets stored. It acts as the main data source for training the ML model that predicts patient readmission risk.
Data Warehouse (Snowflake/BigQuery): This stores clean, structured, historical data that has already been processed through the ETL pipeline. It's what powers the monthly management reports and business intelligence queries.
Vector Database (Pinecone/pgvector): Patient history is stored here as embeddings — a format that captures meaning rather than just text. This allows doctors to search using plain English questions and get back relevant results quickly, using a RAG-based NLP setup.
Time-Series Database (InfluxDB/Timestream): This picks up real-time ICU vitals streaming in through Kafka or Kinesis. It's specifically designed for high-speed, timestamped data — exactly what you need when monitoring patients moment to moment.


## OLTP vs OLAP Boundary
The transactional side of the system — the OLTP — covers everything up to the live patient records database that keeps daily hospital operations running. The analytical side — the OLAP — kicks in right after the ETL pipeline, which pulls data out of the OLTP and moves it into the Data Lake and Data Warehouse. This clear separation exists for a good reason: you don't want heavy analytical workloads like AI training, vector searches, or BI reporting slowing down the systems that doctors and nurses rely on in real time. Keeping the two sides separate ensures neither gets in the way of the other.

## Trade-offs
Running five different storage systems together — OLTP, Data Lake, Data Warehouse, Vector DB, and Time-Series DB — is genuinely complex. It requires well-maintained ETL and streaming pipelines, and if anything breaks down, data silos can form quickly. To keep this manageable, the architecture leans on fully managed cloud services wherever possible, which takes a lot of the infrastructure burden off the team. On top of that, using a data orchestration tool like Apache Airflow helps automate pipeline monitoring and keeps data consistent across all the layers without requiring constant manual oversight.
