function gits
set -x GIT_SSH_COMMAND "ssh -i ~/.ssh/git_people"
git $argv
end
