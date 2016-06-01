#!/bin/bash

bitbucketscript(){
	jenkinusername=$1 
	jenkinuserapitoken=$2 
	newjobname=$3 
	jobnametocopy=$4 
	jenkinurl=$5 
	jenkinprojecttoken=$6 
	bitbucketusername=$7 
	bitbucketpassword=$8 
	bitbucketrepositoryname=$9
	jenkinprojectname=${10} 


	sh autocopy_jenkin_jobs/jenkin_copy_job.sh $jenkinusername $jenkinuserapitoken $newjobname $jobnametocopy $jenkinurl $jenkinprojecttoken $bitbucketusername $bitbucketrepositoryname --bitbucket
  	sh autocreate_bitbucket_service/bitbucket_service.sh $bitbucketusername $bitbucketpassword $bitbucketrepositoryname $jenkinusername $jenkinuserapitoken $jenkinurl $jenkinprojecttoken $jenkinprojectname

}

githubscript(){
	jenkinusername=$1 
	jenkinuserapitoken=$2 
	newjobname=$3 
	jobnametocopy=$4 
	jenkinurl=$5 
	jenkinprojecttoken=$6 
	githubusername=$7 
	githubpassword=$8 
	githubrepositoryname=$9

	sh autocopy_jenkin_jobs/jenkin_copy_job.sh $jenkinusername $jenkinuserapitoken $newjobname $jobnametocopy $jenkinurl $jenkinprojecttoken $githubusername $githubrepositoryname --github
	sh autocreate_github_service/github_service.sh $githubusername $githubpassword $githubrepositoryname $jenkinurl
}



#
# Check input params
#

case ${1} in
    -g|--github)
   		if [ -n "${1}" -a -n "${2}" -a -n "${3}" -a -n "${4}" -a -n "${5}" -a -n "${6}" -a -n "${7}" -a -n "${8}" -a -n "${9}" -a -n "${10}" ]; then
        	githubscript $2 $3 $4 $5 $6 $7 $8 $9 ${10}
		else
		    echo "Usage:"
		    echo "  Please follow this convention: ${0} 'git_mode = --github|--bitbucket' 'jenkin_username' 'jenkin_user_api_token' 'new_job_name' 'job_name_to_copy' 'jenkin_url' 'jenkin_project_token' 'github_username' 'github_password' 'github_repository_name'"
		    exit 1
		fi
        ;;
    -b|--bitbucket)
        if [ -n "${1}" -a -n "${2}" -a -n "${3}" -a -n "${4}" -a -n "${5}" -a -n "${6}" -a -n "${7}" -a -n "${8}" -a -n "${9}" -a -n "${10}" -a -n "${11}" ]; then
    		bitbucketscript $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11}
		else
		    echo "Usage:"
		    echo "  Please follow this convention: ${0} 'git_mode = --github|--bitbucket' 'jenkin_username' 'jenkin_user_api_token' 'new_job_name' 'job_name_to_copy' 'jenkin_url' 'jenkin_project_token' 'bitbucket_username' 'bitbucket_password' 'bitbucket_repository_name' 'jenkin_project_name' "
		    exit 1
		fi
        ;;
    *)
        echo "Please specify which git : ${0} --github|--bitbucket ...."
esac

