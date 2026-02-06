SELECT
    ID_TIME,
    IP_ADDRESS,
    ACTOR_EMAIL,
    EVENT_NAME,
    EVENT_PARAMETERS:target_user::varchar           AS target_user,
    EVENT_PARAMETERS:doc_title::varchar             AS doc_title,
    EVENT_PARAMETERS:old_value::varchar             AS old_value,
    EVENT_PARAMETERS:new_value::varchar             AS new_permission,
    EVENT_PARAMETERS:visibility::varchar            AS visibility,
    EVENT_PARAMETERS:owner_is_shared_drive::varchar AS owner_is_shared_drive,
    EVENT_PARAMETERS:owner_is_team_drive::varchar   AS owner_is_team_drive,
    EVENT_PARAMETERS:owner::varchar                 AS owner,
    EVENT_PARAMETERS:visibility_change::varchar     AS visibility_change
FROM RAW.GSUITE_ACTIVITY
WHERE ID_APPLICATION_NAME ILIKE 'drive'
  AND EVENT_NAME ilike 'sync_item_content'
  AND ACTOR_EMAIL ILIKE '%@gmail.com'
  AND ID_TIME > CURRENT_TIMESTAMP - INTERVAL '365 day';
