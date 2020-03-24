EXECUTE msdb.dbo.rds_drop_database  "HAccountsDB"
EXECUTE msdb.dbo.rds_drop_database  "HPlatformDB"
EXECUTE msdb.dbo.rds_drop_database  "HTreasureDB"

exec msdb.dbo.rds_restore_database 
        @restore_db_name='HAccountsDB', 
        @s3_arn_to_restore_from='arn:aws:s3:::dfyl/temp/HAccountsDB.bak';

exec msdb.dbo.rds_restore_database 
        @restore_db_name='HPlatformDB', 
        @s3_arn_to_restore_from='arn:aws:s3:::dfyl/temp/HPlatformDB.bak';

exec msdb.dbo.rds_restore_database 
        @restore_db_name='HTreasureDB', 
        @s3_arn_to_restore_from='arn:aws:s3:::dfyl/temp/HTreasureDB.bak';

exec msdb.dbo.rds_task_status @db_name='HTreasureDB';