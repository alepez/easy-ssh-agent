#!/bin/bash
##
## easy-ssh-agent
## 
## Start ssh-agent and ask for default identity passphrase if needed.
## Export environment variables so ssh-agent is available for all terminals  
##

##
## Add options to ssh-agent, like identity lifetime
## See `man ssh-agent` for details
##
SSH_AGENT_OPTIONS=""

##
## Specify identity to use
##
SSH_IDENTITY="${HOME}/.ssh/id_rsa"

##
## Other variables, should not be changed
##
SSH_ENV="${HOME}/.ssh/environment"
SSH_AGENT="/usr/bin/ssh-agent"


##
## DO NOT EDIT BEHIND THIS LINE
##

SSH_AGENT_CMD="${SSH_AGENT}"
test -n "${SSH_AGENT_OPTIONS}" && SSH_AGENT_CMD+=" ${SSH_AGENT_OPTIONS}"

function main {
  environment_file_exists && . "${SSH_ENV}"
  if [ "${1}" == 'stop' ]; then {
    stop_agent_if_running;
  } else {
    start_agent_if_not_running;
  } fi
}

function start_agent {
  ${SSH_AGENT_CMD} | sed '/^echo/d' > "${SSH_ENV}"
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}"
  ssh-add "${SSH_IDENTITY}"
}

function start_agent_if_not_running {
  if environment_file_exists; then {
    . "${SSH_ENV}" > /dev/null
    if ! agent_is_running; then {
      start_agent;
    } fi
  } else {
    start_agent;
  } fi
}

function environment_file_exists {
  test -f "${SSH_ENV}"
}

function agent_is_running {
  environment_file_exists || return 1
  ps -ef | grep ${SSH_AGENT_PID} | grep "${SSH_AGENT_CMD}$" >/dev/null
}

function stop_agent_if_running {
  if agent_is_running; then {
    eval $( ${SSH_AGENT} -k )
  } fi
  environment_file_exists && rm "${SSH_ENV}"
}

main $@