exec msdb.dbo.rds_backup_database 
        @source_db_name='HAccountsDB', 
        @s3_arn_to_backup_to='arn:aws:s3:::dfyl/temp/HAccountsDB.bak',
        @overwrite_S3_backup_file=1;

exec msdb.dbo.rds_backup_database 
        @source_db_name='HPlatformDB', 
        @s3_arn_to_backup_to='arn:aws:s3:::dfyl/temp/HPlatformDB.bak',
        @overwrite_S3_backup_file=1;

exec msdb.dbo.rds_backup_database 
        @source_db_name='HTreasureDB', 
        @s3_arn_to_backup_to='arn:aws:s3:::dfyl/temp/HTreasureDB.bak',
        @overwrite_S3_backup_file=1;

exec msdb.dbo.rds_task_status @db_name='HTreasureDB';
