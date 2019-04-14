USER='RagdollNoone'
REPO='Note'
COMMIT_TIMESTAMP=`date +'%Y-%m-%d %H:%M:%S %Z'`

GIT=`which git`
${GIT} add --all .
${GIT} commit -m "Automated commit on ${COMMIT_TIMESTAMP}"
${GIT} push git@github.com:username/repo.git daily
