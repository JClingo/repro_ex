#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "joshuaclingo@gmail.com"
git config --global user.name "Joshua Clingo"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git temp
cd temp
mv -f ../scripts/OUTPUTFILE.html index.html
git add index.html
git commit -m "Update the reproduced analysis" || true
git push origin gh-pages