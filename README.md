## SYNOPSIS
This is a script to create a new job on jenkins by copying existed job & creating a bitbucket service. In other word, this is
a 'frontend' script for bitbucket_service.sh and jenkin_copy_job.sh

## USAGE
For this time the script must be running the variable sequence correctly, or else it will break  
{script name} 'jenkin_username' 'jenkin_user_api_token' 'new_job_name' 'job_name_to_copy' 'jenkin_url' 'jenkin_project_token' 'bitbucket_username' 'bitbucket_password' 'bitbucket_repository_name' 'jenkin_project_name'


for example (in windows)    
sh jenkin_job.sh 'jenkin_username' 'jenkin_user_api_token' 'new_job_name' 'job_name_to_copy' jenkin.test:8080 'jenkin_project_token' 'bitbucket_username' 'bitbucket_password' 'bitbucket_repository_name' 'jenkin_project_name'

## PLEASE NOTE
'new_job_name' and 'job_name_to_copy' need to be url encoded first  
'jenkin_url' , dont include http:// infront of it