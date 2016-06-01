## SYNOPSIS
This is a script to create a new job on jenkins by copying existed job & creating a bitbucket service. In other word, this is
a 'frontend' script for bitbucket_service.sh and jenkin_copy_job.sh

## USAGE
For this time the script must be running the variable sequence correctly, or else it will break  
{script name} 'git_mode = --github|--bitbucket' 'jenkin_username' 'jenkin_user_api_token' 'new_job_name' 'job_name_to_copy' 'jenkin_url' 'jenkin_project_token' 'bitbucket_username' 'bitbucket_password' 'bitbucket_repository_name' 'jenkin_project_name'


for example (in windows)    
for github (didnt need to specify jenkin_project_name)  
sh jenkins_job.sh --github 'jenkin_username' 'jenkin_user_api_token' 'new_job_name' 'job_name_to_copy' jenkin.test:8080 'jenkin_project_token' 'github_username' 'github_password' 'github_repository_name'

for bitbucket  
sh jenkins_job.sh --bitbucket 'jenkin_username' 'jenkin_user_api_token' 'new_job_name' 'job_name_to_copy' jenkin.test:8080'jenkin_project_token' 'bitbucket_username' 'bitbucket_password' 'bitbucket_repository_name' 'jenkin_project_name'

## PLEASE NOTE
'new_job_name' and 'job_name_to_copy' need to be url encoded first  
'jenkin_url' , dont include http:// infront of it