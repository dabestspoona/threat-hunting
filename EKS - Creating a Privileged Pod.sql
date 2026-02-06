select STAGE_TIMESTAMP as start_time, STAGE_TIMESTAMP as end_time, STAGE_TIMESTAMP as last_event_insertion_time, METADATA$UUID as event_ids, METADATA$DATAFLOW_ID as DATAFLOW_IDS, STAGE, REQUEST_URI, USERNAME, USER_GROUPS, USER_ACCESS_KEY_IDS, USER_ARNS, USER_SESSION_NAMES, SOURCE_IPS, USER_AGENT, RESPONSE_STATUS_CODE, ANNOTATIONS from RAW.AWS_EKS_API_SERVER_AUDIT_LOGS 
where RESPONSE_OBJECT_KIND like 'Pod'
and VERB like 'create'
and RESPONSE_OBJECT_SPEC like '%"privileged"%true%'
and STAGE ilike 'ResponseComplete' 
and RESPONSE_STATUS_CODE like '201'
and USERNAME not like 'system%serviceaccount%'
and STAGE_TIMESTAMP between 'xxxx-xx-xx 00:00:00' and 'xxxx-xx-xx 00:00:00'
