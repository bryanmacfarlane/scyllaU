# scyllaU

Scripts and files used while going through Scylla University free training.  

## Scripts  

Foo

## Sample Output

Sample output of creating a cluster, getting status of the cluster, creating a schema (scripts/create.cql) and stopping the cluster.  Some output removed for brevity.

#### Create the cluster  
```bash 
√ scyllaU $ ./cluster.sh 
setting fs.aio-max-nr to greater than 65536 ...
fs.aio-max-nr = 1048576
Waiting for scyllaU1 to start
.......ready
NODE1_IP=172.17.0.2

creating node scyllaU2 seeding to 172.17.0.2...
Waiting for scyllaU2 to start
..ready

creating node scyllaU3 seeding to 172.17.0.2...
Waiting for scyllaU3 to start
..............................ready


   _____            _ _       _____  ____  
  / ____|          | | |     |  __ \|  _ \ 
 | (___   ___ _   _| | | __ _| |  | | |_) |
  \___ \ / __| | | | | |/ _` | |  | |  _ < 
  ____) | (__| |_| | | | (_| | |__| | |_) |
 |_____/ \___|\__, |_|_|\__,_|_____/|____/ 
               __/ |                       
              |___/                        


Nodetool:
	nodetool help
CQL Shell:
	cqlsh
More documentation available at: 
	http://www.scylladb.com/doc/

root@scyllaU1:/# 
```

#### Shell into a node and get status
```bash
√ scyllaU $ ./cql.sh scyllaU1

   _____            _ _       _____  ____  
  / ____|          | | |     |  __ \|  _ \ 
 | (___   ___ _   _| | | __ _| |  | | |_) |
  \___ \ / __| | | | | |/ _` | |  | |  _ < 
  ____) | (__| |_| | | | (_| | |__| | |_) |
 |_____/ \___|\__, |_|_|\__,_|_____/|____/ 
               __/ |                       
              |___/                        


Nodetool:
	nodetool help
CQL Shell:
	cqlsh
More documentation available at: 
	http://www.scylladb.com/doc/

root@scyllaU1:/# nodetool status
Datacenter: datacenter1
=======================
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address     Load       Tokens       Owns    Host ID                               Rack
UN  172.17.0.3  181.07 KB  256          ?       c94d93e3-8dc7-4fe5-9311-ebe11b9191dd  rack1
UN  172.17.0.2  107.23 KB  256          ?       f6ddac09-37d1-4390-867c-2a067da482ba  rack1
UN  172.17.0.4  323.94 KB  256          ?       c3c09512-c643-4eef-b8a8-20d01d106d37  rack1

root@scyllaU1:/# exit
exit
```

#### Create the schema

From a shell inside a node 

```bash
root@scyllaU1:/# ./scripts/exec.sh create

Running /scripts/create.cql on scyllaU1 ...

system_auth    system_distributed  system_traces                  mykeyspace
system_schema  system              system_distributed_everywhere


 user_id | fname | lname
---------+-------+---------
       1 |  rick | sanchez
       4 |  rust |   cohle

(2 rows)
root@scyllaU1:/# exit
exit
```

#### Stop the cluster
```bash
√ scyllaU $ ./stop.sh 
Stopping 80919e364ec8 4b61240727db 42cd824f628c ...
80919e364ec8
4b61240727db
42cd824f628c

Removing 80919e364ec8 4b61240727db 42cd824f628c ...
80919e364ec8
4b61240727db
42cd824f628c
```