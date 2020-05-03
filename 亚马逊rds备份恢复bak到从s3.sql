-- Option groups 在Amazon RDS页面左侧列表。
-- 设置数据库实例，添加 SQLSERVER_BACKUP_RESTORE option 到 option group。
-- 在这个过程中可以自动创建需要的s3存储bak文件和IAM role 以访问s3。
-- 备份数据库s3

exec msdb.dbo.rds_backup_database 
        @source_db_name='数据库名', 
        @s3_arn_to_backup_to='arn:aws:s3:::s3bucket名字/文件名',
        @overwrite_S3_backup_file=1;

exec msdb.dbo.rds_task_status @db_name='数据库名';


-- 从s3恢复数据库备份

EXECUTE msdb.dbo.rds_drop_database  "数据库名"

exec msdb.dbo.rds_restore_database 
        @restore_db_name='数据库名', 
        @s3_arn_to_restore_from='arn:aws:s3:::s3bucket名字/文件名';

exec msdb.dbo.rds_task_status @db_name='数据库名';

-- 参考：https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/SQLServer.Procedural.Importing.html
