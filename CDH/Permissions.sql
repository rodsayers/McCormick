USE mccormick
GRANT INSERT ON SCHEMA :: cleansed TO  
[gdoran] , [jhyer] ,[jshea] , [jsherma], [mbrown];  
GRANT select ON SCHEMA :: cleansed TO  
[gdoran] , [jhyer] ,[jshea] , [jsherma], [mbrown];  
GRANT EXECUTE ON SCHEMA :: cleansed TO  
[gdoran] , [jhyer] ,[jshea] , [jsherma], [mbrown];  
GRANT CONTROL ON SCHEMA :: cleansed TO  
[gdoran] , [jhyer] ,[jshea] , [jsherma], [mbrown]; 

ALTER AUTHORIZATION ON SCHEMA::cleansed to [gdoran] 
ALTER AUTHORIZATION ON SCHEMA::cleansed TO [jhyer] 
ALTER AUTHORIZATION ON SCHEMA::cleansed TO [jshea]
ALTER AUTHORIZATION ON SCHEMA::cleansed TO [jsherma]
ALTER AUTHORIZATION ON SCHEMA::cleansed to [mbrown];

ALTER AUTHORIZATION ON SCHEMA::stage to [gdoran] 
ALTER AUTHORIZATION ON SCHEMA::stage TO [jhyer] 
ALTER AUTHORIZATION ON SCHEMA::stage TO [jshea]
ALTER AUTHORIZATION ON SCHEMA::stage TO [jsherma]
ALTER AUTHORIZATION ON SCHEMA::stage TO [mbrown];

exec sp_addrolemember N'db_datareader' , 'gdoran' 
exec sp_addrolemember N'db_datareader', 'jhyer' 
exec sp_addrolemember N'db_datareader','jshea' 
exec sp_addrolemember N'db_datareader', 'jsherma'
exec sp_addrolemember N'db_datareader', 'mbrown'

exec sp_addrolemember N'db_datawriter' , 'gdoran' 
exec sp_addrolemember N'db_datawriter', 'jhyer' 
exec sp_addrolemember N'db_datawriter','jshea' 
exec sp_addrolemember N'db_datawriter', 'jsherma'
exec sp_addrolemember N'db_datawriter', 'mbrown'