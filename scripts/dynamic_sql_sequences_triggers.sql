set serveroutput on

DECLARE 
------ Declare a curssor to select the information of tables , constraints from schema
CURSOR v_tables_cursor is 
SELECT ucc.table_name, ucc.column_name , utc.data_type , uc.constraint_type ,  uc.constraint_name 
    FROM user_cons_columns ucc , user_constraints uc , user_tab_columns utc
    WHERE ucc.constraint_name = uc.constraint_name
     AND utc.table_name = ucc.table_name
     AND utc.column_name = ucc.column_name
     AND uc.constraint_type = 'P'
     AND utc.data_type = 'NUMBER'
     AND (SELECT COUNT(*)
       FROM user_cons_columns ucc2
       WHERE ucc2.constraint_name = uc.constraint_name) = 1;
-- cursor for selecting all sequences and a variable to drop sequences using dynamic sql -----
CURSOR v_seq_cursor is
select * from user_sequences;
v_drop_seq varchar2(1000);
-----------------------------------------------------------------
v_sql_create_Seq varchar2(1000);
v_sql_create_Tgr varchar2(1000);
v_max_id NUMBER(10);
v_select_max varchar2(1000);
v_seq_name varchar2(100);
v_Tgr_name varchar(100);
BEGIN
-------------------- loop through the cursor for all sequences and drop each sequence -----
    for seq_record in v_seq_cursor loop
        v_drop_seq := 'DROP SEQUENCE '|| seq_record.sequence_name;
        EXECUTE IMMEDIATE v_drop_seq;
    end loop;
    dbms_output.put_line('OLD Sequences Dropped Successfully');
-----------------------------------------------------------------
-------------- loop through cursor to create sequences and triggers --------------
    for v_table_record in v_tables_cursor loop
        v_select_max := 'select NVL(max(' ||v_table_record.column_name||'),0) FROM ' 
        ||v_table_record.table_name;
        EXECUTE IMMEDIATE v_select_max INTO v_max_id;
        --dbms_output.put_line(v_table_record.table_name);
        --dbms_output.put_line(v_table_record.column_name);
        --dbms_output.put_line('Max ID OF '||v_table_record.table_name||' = '||v_max_id);
        -- Sequence
        v_seq_name := v_table_record.table_name || '_seq';

        v_sql_create_Seq := 'CREATE SEQUENCE ' || v_seq_name ||  
                            ' START WITH ' || (v_max_id + 1) ||
                            ' MAXVALUE 999999999999999999999999999 MINVALUE 1 NOCYCLE CACHE 20 NOORDER';
        EXECUTE IMMEDIATE v_sql_create_Seq;
        
         -- Trigger
        v_Tgr_name := v_table_record.table_name||'_Tgr';
        
        v_sql_create_Tgr := 'CREATE OR REPLACE TRIGGER '|| v_Tgr_name ||
        ' BEFORE INSERT ON '||v_table_record.table_name || 
        ' FOR EACH ROW BEGIN :NEW.'||v_table_record.column_name || 
        '  :=  '||v_seq_name||'.nextval; END;';
        EXECUTE IMMEDIATE v_sql_create_Tgr;
    end loop;
    dbms_output.put_line('Sequences Created Successfully');
   dbms_output.put_line('Triggers Created Successfully');
    
END;             
