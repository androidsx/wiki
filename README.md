Androidsx
=========

Just some bits of general documentation.

### Our tools

* [Google Apps] for e-mail, calendar, docs, and video-conferencing (via Hangouts)
* _git_ for version control
* [GitHub] as the git repository
* [Slack] for team communication
* [Trello] for task management
* [Eclipse ADT] as the IDE for projects created before August 2014
* [Android Studio] as the IDE for projects created in August 2014 or later
* [Crashlytics] for crash reporting
* [Flurry] for detailed analytics
* [Google Analytics] for high-level analytics
* [Jenkins] for the continuous build
* [Hockey App] to circulate alpha and beta versions

[Google Apps]:http://www.google.com/enterprise/apps/business/
[GitHub]:http://www.github.com
[Slack]:http://www.slack.com
[Trello]:http://www.trello.com
[Eclipse ADT]:http://developer.android.com/tools/sdk/eclipse-adt.html
[Android Studio]:https://developer.android.com/sdk/installing/studio.html
[Crashlytics]:https://www.crashlytics.com
[Flurry]:http://flurry.com
[Google Analytics]:http://analytics.google.com
[Jenkins]:http://jenkins-ci.org/
[Hockey App]:hockeyapp.com

### Our git workflow

Our workflow is pretty much the same as the one they use at GitHub. It is well described [in this post]. Also, even better explained, see [this official guide].

If you're new to Git... good luck! There's a lot of information out there. Spend some time experimenting with the main commands [in this playground].

[in this post]:http://scottchacon.com/2011/08/31/github-flow.html
[this official guide]:http://guides.github.com/overviews/flow/
[in this playground]:http://try.github.io/

### A note about commit messages

A commit is a logically separate changeset. It is not a bunch of unrelated changes that you're sending to the repository for backup. For instance, you just fixed a bug (so, your commit message would read something like _Fixed crash on startup for images larger than 5MBs_), implemented a few feature (e.g. _Added support for animated GIFs_), did some internal change (e.g. _Moved the video editing logic out of the full-view activity_). It can also be an intermediate step towards a big feature, but it needs to be easy to describe and self-contained. If you need to use the word _and_, it usually means you're doing it wrong.

As for Git-specific guidelines, see the first sections of [Git's contribution guidelines].

[Git's contribution guidelines]:http://git-scm.com/book/ch5-2.html

### Java code style

We follow [Google's style guide]. The only notable exception is the column limit: we ues 120 characters (not 80 or 100). Screens are wide enough nowadays.

But, above all others, *consistency* is the most important rule: follow the conventions of the file you're working on.

[Google's style guide]:http://google-styleguide.googlecode.com/svn/trunk/javaguide.html

### Java/Android programming conventions

We agree on the conventions laid out in [iwombat's Guidelines]. The only (minor) inconsistency with our code style is the blank line they leave after class and method javadoc comments: we follow the official javadoc recommendation and omit it.

Also, [iwombat's Exception Standards] are a good read on good practices for exception handling.

The Android Developers site also has a small set of guidelines: [Code Style Guidelines for Contributors]. We follow it except for the naming conventions for fields: we stick to general Java's guidelines and do not prepend fields with _m_ or _s_. And, again, the 120 column limit.

[iwombat's Guidelines]:http://www.iwombat.com/standards/JavaStyleGuide.html
[iwombat's Exception Standards]:http://www.iwombat.com/standards/ExceptionStandards.html
[Code Style Guidelines for Contributors]:https://source.android.com/source/code-style.html

### Java code formatting

If you use Eclipse, go to Window -> Preferences → Java → Code Style → Formatters, and then import [this XML file]. If you use IntelliJ, well, you’re on your own!

Again, remember that, in any case, the most important rule is to be consistent with the existing style of the project/file you're working on.

[this XML file]:https://dl.dropbox.com/s/u4wdr9xpy99kdag/2012-03-28-androidsx-formatting.xml

## Misc tips

### Effective naming

Proper naming is essential to make code understandable to others.

The most important check for a proper name for any element is: when you have to describe that element, do you use the words in its name? If you don't, the name of that package/class/method/variable/constant is most likely wrong.

Class names are always nouns. For instance, `Car`, `ConfirmationDialog`, `LoginFragment`.

Interfaces names are usually adjectives, such as `Observable` or `Clonable`. They are also use to define the public operations of domain objects, so nouns are acceptable 

Method names are always verbs, such as `setHeight`, `sendArticle` or `getDefaultCoverImage`.

Variable names usually take their name from their type, such as `car`, `confirmationDialog` or `loginFragment`.

Read the section on Naming Conventions from [this University's Style Guide].

[this University's Style Guide]:http://www.cwu.edu/~gellenbe/javastyle/naming.html

### How to clone and configure your workspace in Eclipse

The basic steps are the following:

1. Clone the repo: `git clone git@github.com:androidsx/PROJECT.git`
2. Open Eclipse and set the `PROJECT` folder as the root directory for the workspace
3. Import all projects from the `PROJECT` folder: _File_ -> _Import_ -> _Existing Projects into Workspace_

However, if you already have an Eclipse workspace with a nice config you like (shortcuts, templates, fonts, etc), use [this script], renamed to `new-workspace.sh` below, to copy it into our new workspace:

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

### How to remove folders and its history from Git

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

### How to create a sample animated GIF

Useful for a quick demo, like the one in https://github.com/androidsx/jog-tracker. Follow these steps:

    NAMESPACE=v2
    DELAY=35
    for i in `seq -w 1 1 300`; do adb shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g' > $NAMESPACE-$(date +%Y%m%d-%H%M%S).png; echo -e "Took screenshot $i"; done;
    for i in `ls $NAMESPACE-*.png`; do convert $i -scale 50% $i.gif; done;
    convert -delay $DELAY -loop 0 $NAMESPACE-*.gif animated-$NAMESPACE-$DELAY.gif

### Useful git scripts

* [`git-up`] to sync all local branches with the remote ones

[`git-up`]:https://github.com/aanand/git-up

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/androidsx/wiki/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
