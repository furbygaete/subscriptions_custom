create or replace PACKAGE BODY subscriptions_pkg IS 

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
				      ) IS
 	v_sqlerrm 					VARCHAR2(256);
 	v_subs_id 					NUMBER;
 	v_scheduled_job_name		VARCHAR2(256);
 	v_end_day					NUMBER;
 	v_end_day_unit				VARCHAR2(256);
 	v_offset_date				TIMESTAMP;
 	v_status					VARCHAR2(256);
 	v_error_message				VARCHAR2(256);

  BEGIN
    DO_LOG(process_name => 'Subscription', subprocess_name => 'subs_add_upd', message => 'Start', status => 'Info');
  	BEGIN 
	  	SELECT id 
	  	  INTO v_subs_id
	  	  FROM subscription
	  	 WHERE app_user = p_app_user
	 	   AND email_address = p_email_address
	 	   AND report_id = p_report_id
	 	   AND static_id = p_static_id;
 	 EXCEPTION WHEN no_data_found THEN 
 	 	v_subs_id:= NULL;
 	 END;

 	 IF v_subs_id IS NOT NULL THEN 
 	 	NULL; --UPDATE
 	 ELSIF v_subs_id IS NULL THEN 
 	 	NULL; --INSERT 
 	 END IF;

 	 COMMIT;
 	 
  EXCEPTION WHEN others THEN 
  	DO_LOG(process_name => 'Subscription', subprocess_name => 'subs_add_upd', message => SQLERRM, status => 'Error');
  END subs_add_upd;

 PROCEDURE subs_delete(p_app_user VARCHAR2
 					 , p_email_address VARCHAR2
 					 , p_report_id NUMBER
 					 , p_static_id NUMBER) IS 

 BEGIN

 	DELETE subscription 
 	 WHERE app_user = p_app_user
 	   AND email_address = p_email_address
 	   AND report_id = p_report_id
 	   AND static_id = p_static_id;

 	 COMMIT;  
 EXCEPTION WHEN others THEN 
 	NULL;
 END subs_delete;

 PROCEDURE subs_email(p_subs_id NUMBER) IS

 BEGIN
 	NULL;
 END subs_email;

 PROCEDURE subs_scheduler(p_subs_id NUMBER) IS

 BEGIN
 	NULL;
 END subs_scheduler;    

END subscriptions_pkg;
