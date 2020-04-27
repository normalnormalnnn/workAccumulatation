-- 备份数据库s3

exec msdb.dbo.rds_backup_database 
        @source_db_name='数据库名', 
        @s3_arn_to_backup_to='s3路径',
        @overwrite_S3_backup_file=1;

exec msdb.dbo.rds_task_status @db_name='数据库名';


-- 从s3恢复数据库备份

EXECUTE msdb.dbo.rds_drop_database  "数据库名"

exec msdb.dbo.rds_restore_database 
        @restore_db_name='数据库名', 
        @s3_arn_to_restore_from='s3路径';

exec msdb.dbo.rds_task_status @db_name='数据库名';
