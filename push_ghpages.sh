#! /bin/bash

# This script is used to automate the process of push to the branch gh-pages from github.
# The main purpose of the "manually" deploying is to allow the use of a "Third Party Plugin", that don't work with automatic deploy. 
#
# This script dependents from a branch previously created "gh-pages" on github and the folder "_site" were the build content must be.
# 
# Description:
#   First it creates a folder called "PUSH_FOLDER", 
#   then it's cloned only the branch "gh-pages" from github.
#   The directory is temporaly changed to "PUSH_FOLDER". 
#   In the directory it 

# If the push hangs, then try `git gc`

# I (Eric Keilty) did not originally make this, but I have edited it

BUILD_FOLDER="_site";
PUSH_FOLDER="_site_ghpages"; 
COMMIT_MESSAGE=$1

#Remove all the content from the "PUSH_FOLDER".
function removeAllContentFromPushFolder(){
        echo $(rm -r $PUSH_FOLDER/*);
}

# Delete the "PUSH_FOLDER"
function deletePushFolder(){
        echo $(rm -rf $PUSH_FOLDER);
}

#Create the folder "PUSH_FOLDER".
function createFolderToPush(){
        echo "$(mkdir $PUSH_FOLDER)"
}

#Copy all the content from the folder _site to PUSH_FOLDER.
function copySiteToFolder(){
    echo "$(cp -r $BUILD_FOLDER/. $PUSH_FOLDER)"
}

#Clone only the branch "gh-pages" to the folder "PUSH_FOLDER". 
function cloneGhpages(){
    echo "$(git clone --branch gh-pages `git config remote.origin.url` $PUSH_FOLDER)"
}

function prepareThePushFolder(){
    if [[ -d ./$PUSH_FOLDER ]]
    then
        #Delete "PUSH_FOLDER".
        deletePushFolder
    else
        #Create the folder "PUSH_FOLDER" if it doesn't exist.
        createFolderToPush
    fi
    #Call the function that clone the branch "gh-pages" to the folder "PUSH_FOLDER". 
    cloneGhpages
    #Call the function that copy all the content from the folder _site to "PUSH_FOLDER".
    copySiteToFolder
}

function changeDirectoryToGhpages(){
    CHANGE_TO_SITE= cd $PUSH_FOLDER
    echo $CHANGE_TO_SITE;
}

function setMessageCommit(){
    if ! [ "$COMMIT_MESSAGE" ]
    then
      COMMIT_MESSAGE='automatic commit'
    else
      echo "$COMMIT_MESSAGE"
    fi
}

function pushBranchGhpages(){
    git add .
    git commit -m "$COMMIT_MESSAGE"
    git push
}

function changeDirectoryBack(){
    BACKFOLDER= cd ..
    echo $BACKFOLDER
}

prepareThePushFolder
changeDirectoryToGhpages
setMessageCommit
pushBranchGhpages
changeDirectoryBack