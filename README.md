# scyllaU

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