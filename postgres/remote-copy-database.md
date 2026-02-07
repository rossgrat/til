# Remote copy database
You can make a copy of a database directly on a postgres server instance using:
```sql
CREATE DATABASE new_database WITH TEMPLATE old_database;
```

