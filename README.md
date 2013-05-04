# easy-ssh-agent

Speed up using of ssh-agent and ssh-add.

 - Support for SSH_ASKPASS
 - Fast integration with graphical system.
 - Support for identity lifetime
 - Available in all terminals, even if started from X

## easy-ssh-agent for bash users

Add this to your ~/.bashrc

    eval $( easy-ssh-agent start --env )

It will ask for passphrase when you open the first terminal.

## easy-ssh-agent for zsh users

Add this to your ~/.zshrc

    eval $( easy-ssh-agent start --env )

It will ask for passphrase when you open the first terminal.
    
### easy-ssh-agent for kde4 users

Add this to ~/.kde4/env/easy-ssh-agent.sh
	
	#!/bin/sh
	easy-ssh-agent start --env    

It will ask for passphrase during kde startup. ksshaskpass or similar is needed
