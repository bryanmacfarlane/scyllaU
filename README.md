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
$ ops/compose up
```

Stop the cluster

```bash
$ ops/compose down
```

Jump into a cql shell

```bash
$ ops/compose cqlsh
...
cqlsh>
```

## Execute Command 

scripts/exec "\<command\>"

```bash
$ script/exec "DESCRIBE CLUSTER"

Cluster: 
Partitioner: org.apache.cassandra.dht.Murmur3Partitioner
Snitch: SimpleSnitch
```

## Run A Script

script/run <file_without_cql_extension>

For example, to run the create.cql script ...

```bash
$ script/run create             

Running /Users/bryan/Study/scyllaU/scripts/create.cql on localhost:9042 ...

...

mykeyspace  system_auth         system_distributed_everywhere  system_schema
system      system_distributed  system_replicated_keys         system_traces


 user_id | fname | lname
---------+-------+---------
       1 |  rick | sanchez
       4 |  rust |   cohle

(2 rows)
```
