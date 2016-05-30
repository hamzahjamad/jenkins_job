#!/bin/bash

runscript(){
	jenkinusername=$1 
	jenkinuserapitoken=$2 
	newjobname=$3 
	jobnametocopy=$4 
	jenkinurl=$5 
	jenkinprojecttoken=$6 
	bitbucketusername=$7 
	bitbucketpassword=$8 
	bitbucketrepositoryname=$9
	jenkinprojectname=$10  
  	sh autocopy_jenkin_jobs/jenkin_copy_job.sh $jenkinusername $jenkinuserapitoken $newjobname $jobnametocopy $jenkinurl $jenkinprojecttoken $bitbucketusername $bitbucketrepositoryname
  	sh autocreate_bitbucket_service/bitbucket_service.sh $bitbucketusername $bitbucketpassword $bitbucketrepositoryname $jenkinusername $jenkinuserapitoken $jenkinurl $jenkinprojecttoken $jenkinprojectname
}



#
# Check input params
#
if [ -n "${1}" -a -n "${2}" -a -n "${3}" -a -n "${4}" -a -n "${5}" -a -n "${6}" -a -n "${7}" -a -n "${8}" -a -n "${9}" -a -n "${10}" ]; then
   
    runscript $1 $2 $3 $4 $5 $6 $7 $8 $9 $10

else
    echo "Usage:"
    echo "  Please follow this convention: ${0} 'jenkin_username' 'jenkin_user_api_token' 'new_job_name' 'job_name_to_copy' 'jenkin_url' 'jenkin_project_token' 'bitbucket_username' 'bitbucket_password' 'bitbucket_repository_name' 'jenkin_project_name' "
    exit 1
fi

