select 
ID_TIME,
ACTOR_EMAIL,
EVENT_PARAMETERS:target::varchar as target,
EVENT_PARAMETERS:doc_title::varchar as drive_name,
EVENT_PARAMETERS:membership_change_type::varchar as membership_change_type,
EVENT_PARAMETERS:visibility::varchar as visibility,
EVENT_PARAMETERS:added_role::varchar as added_role,
EVENT_PARAMETERS:owner_is_shared_drive::varchar as owner_is_shared_drive,
EVENT_PARAMETERS:owner_is_team_drive::varchar as owner_is_team_drive,
EVENT_PARAMETERS:owner::varchar as owner
from RAW.GSUITE_ACTIVITY
where 
EVENT_NAME = 'shared_drive_membership_change' AND
membership_change_type = 'add_to_shared_drive' AND
target not ilike '%corpdomain.com' AND target not ilike '%corpdomain2.com' AND target not AND
ID_TIME > current_timestamp - INTERVAL '365 day'
