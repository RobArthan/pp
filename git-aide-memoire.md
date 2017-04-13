# Git Aide-Memoire

This is a list of example git command lines each with a potted explanation.

---

* Clone a repo (aka. a remote); get default remote called "origin":  
    `git clone git@github.com:RobArthan/pp`

* List known remotes:  
    `git remote`

* Show status of the remote called "origin":  
    `git remote show origin`

* Pull changes from the remote:  
    `git pull`

* Add local changes prior to commit (stages a snapshot of the current state into the index of uncommitted changes):
    `git add dtd001.doc`

* Show diffs between (a) committed state and (b) current state:  
    `git diff HEAD`

* Show diffs betwee (a) state staged for next commit (or committed state if no changes staged) and (b) current state:  
    `git diff`

* Show diffs between (a) committed state and (b) state staged for next commit:  
    `git diff --cached`

* Commit changes (prompts for message):  
    `git commit`

* Push changes to remote. (This will fail if you have changed files that have been changed remotely since you last pulled changes. If it fails, pull the changes: there will be merge conflicts which you need to resolve. i.e., you need to change the conflicted files to be as you want them to be, add them and then commit.):  
    `git push`

* View change log (with diffs, drop "-p" for just the log):  
    `git log -p  `

* Create an annotated tag for a specified commit (prompts for message):  
    `git tag -a v3.1w6 3c5daefb03286d2999daef75c745e73bd82b4718`

* List all tags with 1st line of the description:  
    `git tag -l -n 1 '*'`

* Get info on tag:  
    `git show -s v3.1w6`

* Create local branch for maintenance using tag to identify commit:  
    `git branch fix-3.1w6 v3.1w6`

* Push branch upstream and set up the tracking for future pushes:  
    `git push -u origin fix-3.1w6`

* List all branches, including untracked branches:  
    `git branch -a`

* To track a branch that has been created upstream, check it out:  
    `git checkout fix-3.1w6`

* To delete an upstream branch:  
    `git push origin :fix-3.1w6`

* To merge changes into current branch 
(In case of conflicts, resolve them by changing the conflicted files to be as you want them to be, add them and then commit):  
    `git merge fix-3.1w6`

----

