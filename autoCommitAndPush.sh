USER='username'
REPO='/home/'${USER}'/Sites/git/bitbucket/kb'
COMMIT_TIMESTAMP=`date +'%Y-%m-%d %H:%M:%S %Z'`

GIT=`which git`
${GIT} add --all .
${GIT} commit -m "Automated commit on ${COMMIT_TIMESTAMP}"
${GIT} push git@bitbucket.org:username/repo.git master
