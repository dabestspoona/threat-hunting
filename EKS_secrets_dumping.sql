select STAGE_TIMESTAMP, STAGE, REQUEST_URI, USERNAME, USER_GROUPS,USER_ACCESS_KEY_IDS, USER_ARNS, USER_SESSION_NAMES, SOURCE_IPS, USER_AGENT,RESPONSE_STATUS_CODE, ANNOTATIONS from RAW.AWS_EKS_API_SERVER_AUDIT_LOGS 
where USERNAME not like '%argo%' 
and USERNAME not like '%serviceaccount%'
and USERNAME not like 'system%apiserver'
and USERNAME not like 'eks%kms-storage-migrator'
and USERNAME not like 'system%kube-controller-manager'
and STAGE ilike 'ResponseComplete' 
and REQUEST_URI ilike '/api/v1/secrets?limit=%'
and STAGE_TIMESTAMP between '202x-xx-xx 00:00:00' and '20xx-xx-xx 00:00:00'
