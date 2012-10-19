# Bash Script Collection

This is a collection of bash script I often use.

### Installation

I suggest to install them in `/usr/local/bin` if you have root access or in
`~/bin` if you do not. If you add these scripts in `~/bin`, you need to add
this directory in your PATH environment variable. To do so, edit your `.bashrc`
(create it if you haven't) and add these line:

    export PATH="${PATH}:~/bin"

Remeber to add exec permission with

    chmod +x /path/to/script

-------------------------------------------------------------------------------

## easy-ssh-agent

Speed up using of ssh-agent and ssh-add.

 - Support for SSH_ASKPASS
 - Fast integration with graphical system.
 - Support for identity lifetime
 - Available in all terminals, even if started from X

### easy-ssh-agent for bash users

Add this to your ~/.bashrc

    easy-ssh-agent

It will ask for passphrase when you open the first terminal.

### easy-ssh-agent for zsh users

Add this to your ~/.zshrc

    easy-ssh-agent

It will ask for passphrase when you open the first terminal.
    
### easy-ssh-agent for kde4 users

    ln -s /path/to/your/easy-ssh-agent ~/.kde4/env/easy-ssh-agent.sh

It will ask for passphrase during kde startup. ksshaskpass or similar is needed
