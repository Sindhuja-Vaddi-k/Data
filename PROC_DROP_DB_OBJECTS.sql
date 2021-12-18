SET SERVEROUTPUT ON;

CREATE OR REPLACE
procedure  PROC_DROP_DB_OBJECTS AS
cursor C1 is
   select object_type,'"'||object_name||'"'||decode(object_type,'TABLE' ,' cascade constraints',null) obj_name
  FROM USER_OBJECTS
  where object_type in ('FUNCTION','TABLE','PACKAGE','PACKAGE BODY', 'PROCEDURE', 'SEQUENCE', 'VIEW'  )
  and object_name IN ( 'PROC_DEPARTMENT' , 'TABLENAME1' , 'NUMS')
  order by object_type;
BEGIN
    for rec in C1 loop
      execute immediate ('drop '||rec.object_type||' ' ||rec.obj_name);  
      DBMS_OUTPUT.PUT_LINE('DROP SUCCESSFUL FOR '  ||rec.object_type|| ' ' ||rec.obj_name );
    end loop;
    DBMS_OUTPUT.PUT_LINE('ALL DATABASE OBJECTS DROPPED'  );
END ;
/

EXECUTE PROC_DROP_DB_OBJECTS;