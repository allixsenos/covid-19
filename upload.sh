#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  git remote remove origin
  git remote add origin https://${GH_TOKEN}@github.com/allixsenos/covid-19.git > /dev/null 2>&1
}

commit_website_files() {
  git commit -a --message "Auto data update $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git push --set-upstream origin HEAD:master
}

setup_git
commit_website_files
upload_files
