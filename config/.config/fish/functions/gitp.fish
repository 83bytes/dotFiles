function gitp
set -x GIT_SSH_COMMAND "ssh -i ~/.ssh/git_personal"
git $argv
end
