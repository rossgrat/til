# New Install
Upon installing a new version of postgres the first thing you will need to to is create a role and a database for that role for whatever your username on your local machine is. You'll also probably want to make yourself a [superuser](https://www.postgresql.org/docs/current/role-attributes.html). You may additionally want to set a password for your role for use in database URLS such as `postgres://rossgrat:password@localhost:5432/test-database`. All of those things are taken care of in the below sequence of commands.
```
$ psql postgres
# CREATE ROLE rossgrat;
# CREATE DATABASE rossgrat;
# ALTER ROLE rossgrat WITH SUPERUSER;
# ALTER ROLE rossgrat WITH PASSWORD 'password';
```

