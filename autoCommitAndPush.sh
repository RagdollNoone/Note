USER='RagdollNoone'
REPO='Note'
COMMIT_TIMESTAMP=`date +'%Y-%m-%d %H:%M:%S %Z'`

GIT=`which git`
${GIT} add --all .
${GIT} commit -m "Automated commit on ${COMMIT_TIMESTAMP}"
${GIT} push git@bitbucket.org:username/repo.git master
