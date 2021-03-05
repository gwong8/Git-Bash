# Git-and-Bash

This project aims to demonstrate the basics of Git and Bash by going through a simple exercise
illustrating commands, such as clone, init, branch, add, commit, merge, tag, push, status, and log.

Also, this project is inspired by [Practical Git: Confident Git Through Practice](https://www.oreilly.com/library/view/practical-git-confident/9781484262702/), by Johan Abildskov O'Reilly, 2020.

## Setup

Clone repository and run `exercise_setup.sh` script in Terminal.

```shell
# Run exercise_setup.sh in Terminal
source exercise_setup.sh  
```

## General Walkthrough of Exercise
- Create `git-exercise` folder
- Setup remote repository as `remote-repo`
- Create `.gitignore` file
- Clone `remote-repo` as `local-repo`
- Setup simple local alias through `config`
- Perform work in `local-repo` and push to `remote-repo`
- Run John Doe's work on remote
- Perform another work in `local-repo` and push to `remote-repo`
- Encounter error during push
- Fix error by fetch, merge, then push on local
- Compare logs from both `remote-repo` and `local-repo`