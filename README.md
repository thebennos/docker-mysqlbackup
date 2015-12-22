# docker-mysqlbackup
Docker Container with mydump, a good start to write an individual backup container

This Container installs just the mydumper tool. It is the fastet SQL Backup Tool! 
Works in multi threads and depending on the database it create a backup of a 500 GB Database in minutes.
The needed time depends on the sql schema. If you have just one table that hold 500 Gb of data it takes longer, but if you 
have 500 GB of data in hundreds of tables the multi-threading plays out the advantage of mydump and the backup is done in minutes

In the Example folder are two scripts. 
1. Run a full backup once - fullbackup.sh
2. Runs a daemon and it does incremental backups every 60 minutes - incremental.sh

Use the scripts a starting templates to write your own container. 
There are several ways to schedule the jobs inside the docker container or on start of the container 

Everybody needs to decide what is the best way to his strategy. 

# Our Backup Strategy and docker container

To give you some imagination, here how I did it. 

Backup Strategy: 
All Databases are running in a Cluster and all server are running on RAID 1 or 5. 
Normaly a backup is not needed, but there is a worst case scenario. 
What happens if... 
Only 1 percent or lower risk that there is full breakdown. 

If worst case happens we need to be back up in hours with all database, actually several Terrabyte of data (unpacked). 

We made a decision matrix and played theoretical around. 
From the theory and the descision matrix we decided to run some backups daily and some backups only every 3 days and 
database that are needed in frontend's additional incremental backups every hour. 



