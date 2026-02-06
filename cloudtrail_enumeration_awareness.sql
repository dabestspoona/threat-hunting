select 
USER_IDENTITY_ARN,
RECIPIENT_ACCOUNT_ID,
USER_AGENT,
SOURCE_IP_ADDRESS,

min(EVENT_TIME) earliest,
max(EVENT_TIME) latest,
ARRAY_AGG(DISTINCT EVENT_NAME) as EVENT_NAMEs,
count (DISTINCT EVENT_NAME) as EVENT_NAME_count,
ARRAY_AGG(DISTINCT EVENT_SOURCE) as EVENT_SOURCEs,
count(*) as count,
from RAW.AWS_CLOUDTRAIL
WHERE
EVENT_TIME > current_timestamp - INTERVAL '1 day' 
--- AND EVENT_NAME in ('ListGroupsForUser','ListMFADevices','ListPolicies','ListUsers','ListUserPolicies','ListAttachedUserPolicies','GetUser','GetAccountSummary','ListRoles')                                              ---- List event names here
AND USER_IDENTITY_ARN ilike 'arn:aws:sts::106877218800:assumed-role/personalization-rw/aaron.webb@onepeloton.com' ---- insert USER_IDENTITY_ARN here

group by 1,2,3,4
