select EVENT_PARAMETERS:doc_id::varchar as doc_id ,
ACTOR_EMAIL,
EVENT_PARAMETERS:doc_title::varchar as doc_title,
EVENT_PARAMETERS:old_value::varchar as old_value,
EVENT_PARAMETERS:new_value::varchar as new_value,
EVENT_PARAMETERS:owner_is_shared_drive::varchar as owner_is_shared_drive,
EVENT_PARAMETERS:owner_is_team_drive::varchar as owner_is_team_drive,
EVENT_PARAMETERS:target_domain::varchar as target_domain,
EVENT_PARAMETERS:doc_type::varchar as doc_type,
EVENT_PARAMETERS:originating_app_id::varchar as originating_app_id,
EVENT_PARAMETERS:owner::varchar as owner
from RAW.GSUITE_ACTIVITY
where 
--ACTOR_EMAIL ilike 'actor@.domain.com' AND --insert username here
OLD_VALUE ilike '%private%' AND
NEW_VALUE ilike '%people_with_link%' AND
EVENT_NAME = 'change_document_visibility' AND
ID_TIME > current_timestamp - INTERVAL '7 day'
