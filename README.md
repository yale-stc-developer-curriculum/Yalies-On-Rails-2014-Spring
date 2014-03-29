Yalies-On-Rails-2014-Spring
=====================

This is the home repo for the 2014 STC Course Yalies On Rails.

You probably want to check out the [wiki](http://github.com/yale-stc-developer-curriculum/Yalies-On-Rails-2014-Spring/wiki).

## How to Submit Assignments via GitHub

### Setup your repo. (One time only)

1. Fork this repo to your github account.
2. Clone it onto your computer `git clone ___`
3. Add STC's copy as a remote nicknamed 'upstream'

```bash
  git remote add upstream https://github.com/yale-stc-developer-curriculum/Yalies-On-Rails-2014-Spring.git
```

###Working in your personal repository

1. `cd` to the folder with your name
4. Do your work (IN YOUR FOLDER ONLY!)
3. You can view example code in the folder `EXAMPLE`
5. Git add/commit/push to your copy
3. Try to get into the habit of adding/committing/pushing very often -
   every substantial change, approximately every 3-10 minutes

###Updating your personal repository match STC's 

When the STC repository changes (new assignments or updated testing file) you'll have to update your copy

1. `cd` to the `Yalies-On-Rails-2014-Spring` repository
2. `git pull upstream master` to pull updates from upstream (=STC's copy) to your master branch

###Submit your work to STC's repository

When you're ready to submit your assignment, you'll use a Pull Request.

1. Make sure you've committed all of the changes you intended to your
   personal github repository (check the website to be sure)
2. Navigate to STC's github page for the course https://github.com/yale-stc-developer-curriculum/Yalies-On-Rails-2014-Spring/
3. Click on "pull requests" in the right bar
4. Click on "new pull request" in the top right
5. Click "compare across forks"
6. `Base fork` should be STC's and `head fork` should be yours. Both should be
   on the master branch.
7. Click "create pull request"

