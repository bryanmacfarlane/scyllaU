```bash


   _____            _ _       _____  ____  
  / ____|          | | |     |  __ \|  _ \ 
 | (___   ___ _   _| | | __ _| |  | | |_) |
  \___ \ / __| | | | | |/ _` | |  | |  _ < 
  ____) | (__| |_| | | | (_| | |__| | |_) |
 |_____/ \___|\__, |_|_|\__,_|_____/|____/ 
               __/ |                       
              |___/                        


```

Scripts and files used while going through Scylla University free training.  These all use docker containers.

## Dev Cluster  

Create a three node cluster

```bash
$ ops/cluster up
```

Stop the cluster

```bash
$ ops/cluster down
```

Jump into a cql shell

```bash
$ ops/cluster cqlsh
...
cqlsh>
```

Jump into a bash shell

```bash
ops/cluster bash
bash-5.1$
```

#### Create the schema

From a bash shell inside a node 

```bash
root@scyllaU1:/# scripts/exec create

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