Androidsx
=========

Just some bits of general documentation.

### Our git workflow

Our workflow is pretty much the same as the one they use at GitHub. It is well described [in this post]. Also, even better explained, see [this official guide].

[in this post]:http://scottchacon.com/2011/08/31/github-flow.html
[this official guide]:http://guides.github.com/overviews/flow/

### How to clone and configure your workspace in Eclipse

The basic steps are the following:

1. Clone the repo: `git clone git@github.com:androidsx/PROJECT.git`
2. Open Eclipse and set the `PROJECT` folder as the root directory for the workspace
3. Import all projects from the `PROJECT` folder: _File_ -> _Import_ -> _Existing Projects into Workspace_

However, if you already have an Eclipse workspace with a nice config you like (shortcuts, templates, fonts, etc), use [this script] (renamed to `new-workspace.sh` below) to copy it into our new workspace:

    ./new-workspace.sh $EXISTING_WORKSPACE $NEW_WORKSPACE
    
You can now do the following trick to clone into this folder (based on [this answer on stack overflow]):

    git clone --no-checkout $REPO $NEW_WORKSPACE/tmp
    mv $NEW_WORKSPACE/tmp/.git/ $NEW_WORKSPACE/
    rmdir $NEW_WORKSPACE/tmp/
    cd $NEW_WORKSPACE/
    git reset --hard HEAD

These instructions are copy-pasteable into your terminal if you just assign your own values to the variables:

    EXISTING_WORKSPACE=chat-toolkit
    NEW_WORKSPACE=lottodroid
    REPO=git@github.com:androidsx/lottodroid.git

[this script]:https://github.com/kremso/cpew/blob/master/cpew
[this answer on stack overflow]:http://stackoverflow.com/a/2484349/106342

### Code formatting

If you use Eclipse, go to Window -> Preferences → Java → Code Style → Formatters, and then import [this XML file]. If you use IntelliJ, well, you’re on your own!

In any case, the most important rule is to be consistent: follow the conventions of the file you’re working on.

[this XML file]:https://dl.dropbox.com/s/u4wdr9xpy99kdag/2012-03-28-androidsx-formatting.xml

## Misc tips

### How to remove folders and its history

First, take [this script in GitHub's wiki]e and save it as "git-delete-history".

Let's copy and clean the repository:

    ツ ~/workspaces$ cp -rf sx-git/ sx-git-pruned/
    ツ ~/workspaces$ cd sx-git-pruned/
    ツ (master) ~/workspaces/sx-git-pruned$ git clean -xdf
    ツ (master) ~/workspaces/sx-git-pruned$ find ./first-folder-to-delete ./second-folder-to-delete -name \* -print

Apply the magic:

    ツ (master) ~/workspaces/sx-git-pruned$ find ./first-folder-to-delete ./second-folder-to-delete -name \* -print | xargs ../git-delete-history

Now push to a newly created repo:

    ツ (master) ~/workspaces/sx-git-pruned$ git remote rm origin
    ツ (master) ~/workspaces/sx-git-pruned$ git remote add origin git@github.com:androidsx/chat-toolkit.git
    ツ (master) ~/workspaces/sx-git-pruned$ git push -u origin master

[this script in GitHub's wiki]:https://github.com/benjaminoakes/public_notes/wiki/Forever-remove-files-or-folders-from-history

### How to split a directory into another repository

Very simple steps [outlined here].

[outlined here]:https://help.github.com/articles/splitting-a-subpath-out-into-a-new-repository


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/androidsx/wiki/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

