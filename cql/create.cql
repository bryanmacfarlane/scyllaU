
CREATE KEYSPACE IF NOT EXISTS mykeyspace WITH replication = {'class': 'NetworkTopologyStrategy', 'replication_factor' : 3} AND durable_writes = true;

DESCRIBE KEYSPACEs;

USE mykeyspace;

CREATE TABLE IF NOT EXISTS users ( user_id int, fname text, lname text, PRIMARY KEY((user_id))); 

INSERT INTO users(user_id, fname, lname) VALUES (1, 'rick', 'sanchez'); 
INSERT INTO users(user_id, fname, lname) VALUES (4, 'rust', 'cohle'); 

SELECT * FROM users;
