#!/bin/bash

unittestjob="TaskManager-UnitTest"
newunittestjob=$unittestjob$6

deployjob="TaskManager-Deploy"
newdeployjob=$deployjob$6

jenkinsscript(){

	gitprovider=$7

	#create a new git user credential
	curl --user $1:$2 -G http://$3/scriptler/run/createNewGitUserScript.groovy --data-urlencode "username=$5" --data-urlencode "password=$6"                                                                                                 

	#copy the default jobs
	sh autocopy_jenkin_jobs/jenkin_copy_job.sh $1 $2 $newunittestjob $unittestjob $3 $4 $5 $6 $gitprovider "--job1"
	sh autocopy_jenkin_jobs/jenkin_copy_job.sh $1 $2 $newdeployjob $deployjob $3 $4 $5 $6 $gitprovider "--job2"

}

bitbucketscript(){
	jenkinusername=$1 
	jenkinuserapitoken=$2  
	jenkinurl=$3 
	jenkinprojecttoken=$4 
	bitbucketusername=$5 
	bitbucketpassword=$6 
	bitbucketrepositoryname=$7

	jenkinsscript $jenkinusername $jenkinuserapitoken $jenkinurl $jenkinprojecttoken $bitbucketusername $bitbucketrepositoryname --bitbucket
	sh autocreate_bitbucket_service/bitbucket_service.sh $bitbucketusername $bitbucketpassword $bitbucketrepositoryname $jenkinurl $jenkinprojecttoken $newunittestjob

}

githubscript(){
	jenkinusername=$1 
	jenkinuserapitoken=$2 
	jenkinurl=$3 
	jenkinprojecttoken=$4 
	githubusername=$5 
	githubpassword=$6 
	githubrepositoryname=$7

	jenkinsscript $jenkinusername $jenkinuserapitoken $jenkinurl $jenkinprojecttoken $githubusername $githubrepositoryname --github
	sh autocreate_github_service/github_service.sh $githubusername $githubpassword $githubrepositoryname $jenkinurl
}



#
# Check input params
#

case ${1} in
    -g|--github)
   		if [ -n "${1}" -a -n "${2}" -a -n "${3}" -a -n "${4}" -a -n "${5}" -a -n "${6}" -a -n "${7}" -a -n "${8}" ]; then
        	githubscript $2 $3 $4 $5 $6 $7 $8 
		else
		    echo "Usage:"
		    echo "  Please follow this convention: ${0} --github 'jenkin_username' 'jenkin_user_api_token' 'jenkin_url' 'jenkin_project_token' 'github_username' 'github_password' 'github_repository_name'"
		    exit 1
		fi
        ;;
    -b|--bitbucket)
        if [ -n "${1}" -a -n "${2}" -a -n "${3}" -a -n "${4}" -a -n "${5}" -a -n "${6}" -a -n "${7}" -a -n "${8}" ]; then
    		bitbucketscript $2 $3 $4 $5 $6 $7 $8
		else
		    echo "Usage:"
		    echo "  Please follow this convention: ${0} --bitbucket 'jenkin_username' 'jenkin_user_api_token' 'jenkin_url' 'jenkin_project_token' 'bitbucket_username' 'bitbucket_password' 'bitbucket_repository_name' "
		    exit 1
		fi
        ;;
    *)
        echo "Please specify which git : ${0} --github|--bitbucket ...."
esac

