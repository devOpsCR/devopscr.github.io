#!/bin/bash
SOURCE_BRANCH="source"
DESTINATION_BRANCH="master"

echo "Starting deployment"
echo "Source branch: $SOURCE_BRANCH | Target branch: $DESTINATION_BRANCH"

TEMP_DIRECTORY="/tmp/__temp_static_content"
CURRENT_COMMIT=`git rev-parse HEAD`
ORIGIN_URL=`git config --get remote.origin.url`
ORIGIN_URL_WITH_CREDENTIALS=${ORIGIN_URL/\/\/github.com/\/\/$GITHUB_TOKEN@github.com}

echo "Compiling new static content"
git checkout -B $SOURCE_BRANCH
mkdir $TEMP_DIRECTORY || exit 1
harp compile . $TEMP_DIRECTORY || exit 1
cp .gitignore $TEMP_DIRECTORY || exit 1
cp public/CNAME $TEMP_DIRECTORY || exit 1

echo "Checking out $DESTINATION_BRANCH branch"
git checkout -B $DESTINATION_BRANCH || exit 1

echo "Removing old static content"
git rm -rf . || exit 1

echo "Copying newly generated static content"
cp -r $TEMP_DIRECTORY/* . || exit 1
cp $TEMP_DIRECTORY/CNAME . || exit 1
cp $TEMP_DIRECTORY/.gitignore . || exit 1

echo "Pushing new content to $ORIGIN_URL"
git config user.name "Travis-CI" || exit 1
git config user.email "meetup@devopscr.co" || exit 1

git add -A . || exit 1
git commit --allow-empty -m "Regenerated static content for $CURRENT_COMMIT" || exit 1
git push --force --quiet "$ORIGIN_URL_WITH_CREDENTIALS" $DESTINATION_BRANCH > /dev/null 2>&1

echo "Cleaning up temp files"
rm -Rf $TEMP_DIRECTORY

echo "Deployed successfully."
