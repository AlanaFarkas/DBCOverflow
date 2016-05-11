# DBCOverflow

#Our git workflow:

- git checkout master
- git pull origin master
- git checkout -b new-feature
- ** make changes **
- ** add change **
- ** commit changes **
- git checkout master
- git pull origin master
- git checkout new-feature
- git rebase master
- git checkout master
- git merge new-feature
- git checkout new-feature
- git push origin new-feature
- git checkout master
- git branch -d old-feature
