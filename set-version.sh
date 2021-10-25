
if [ "${CI:-}" != "" ]
then
  VERSION=0.1.${GITHUB_RUN_NUMBER}
fi

