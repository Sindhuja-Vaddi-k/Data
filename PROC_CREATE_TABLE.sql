SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE PROC_CREATE_TABLE ( p_tabname VARCHAR2  )
 AS
     v_tab_name varchar2(50);
     v_tab_script varchar2(3000);
     row_count number(10):= 0;
    BEGIN
SELECT tab_name , tab_script  INTO v_tab_name,v_tab_script  
        FROM 
            all_tab_scripts where tab_name = p_tabname;
          DBMS_OUTPUT.PUT_LINE('--------------------------');
  
          SELECT count(*) into row_count FROM user_tables where table_name = UPPER(p_tabname);
       
          
           IF(row_count > 0)
            THEN
                DBMS_OUTPUT.PUT_LINE('TABLE '|| v_tab_name || ' ALREADY EXISTS');
               
            ELSE
                DBMS_OUTPUT.PUT_LINE('--------------------------');  
                EXECUTE IMMEDIATE v_tab_script;
                dbms_output.put_line( 'TABLE '|| v_tab_name || ' CREATED SUCCESSFULLY!' );
                 END IF;
                EXCEPTION
                WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Please execute the proc in the following order 
                1.CUSTOMER
                2.CUST_CONTACT_DETAILS
                3.CUST_PAYMENT
                4.VENDOR
                5.VENDOR_ADDRESS
                6.VENDOR_HISTORY
                6.PRODUCT_CATEOGRY
                7.PRODUCT_DETAILS
                8.ORDERS
                9.LINE_ITEMS
                10.REVIEWS');
                           END;
/  

EXECUTE PROC_CREATE_TABLE ('CUSTOMER' );