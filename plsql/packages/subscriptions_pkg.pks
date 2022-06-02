create or replace PACKAGE subscriptions_pkg IS 

 /*************************************************
 ***** Manage the DML for Subscriptions table *****
 **************************************************/
 PROCEDURE subs_add_upd(p_workspace_id NUMBER  
				      , p_application_id NUMBER 
				      , p_page_id NUMBER 
				      , p_report_type VARCHAR2
				      , p_report_id NUMBER  
				      , p_static_id VARCHAR2  
				      , p_app_user VARCHAR2
				      , p_email_from VARCHAR2
				      , p_email_address VARCHAR2
				      , p_email_subject VARCHAR2
				      , p_start_date TIMESTAMP
				      , p_language VARCHAR2 
				      , p_end_date TIMESTAMP
				      , p_notify_interval VARCHAR2
				      , p_query_report CLOB 
				      , p_attach_format VARCHAR2
				      );

 PROCEDURE subs_delete(p_app_user VARCHAR2
 					 , p_email_address VARCHAR2
 					 , p_report_id NUMBER
 					 , p_static_id NUMBER);

/*************************************************
* Sub-program to build the email with attachment *
**************************************************/
 PROCEDURE subs_email(p_subs_id NUMBER);

/*************************************************
********* Schedule single (user - report) ********
**************************************************/
 PROCEDURE subs_scheduler(p_subs_id NUMBER);

END subscriptions_pkg;