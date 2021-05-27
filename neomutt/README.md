# Mail with Neomutt

I use neomutt for the terminal mail interface and I use iSync (mbsync is the executable) to sync my work email locally.
This allows me to read mail when offline once I have synchronised. You can always connect directly to your IMAP server and not synchronise your mails locally.

I use notmuch to index my mail and search them too.
See below for what has to be configured.

I used the pass executable for the simplicity but there are claims that it is not so secure so I've started to use gpg with neomutt but still haven't changed it for mbsync and msmtp.

I copied Konfekt’s mailcap, that is listed in the useful-programs section of the neomutt website, as mailcap2 and am still adapting it to use it in mac os as well as linux. 

## Install

Copy the files in source to the corresponding destination.

source | destination
--- | ---
scripts/quicklook.sh | ~/bin/
scripts/view-attachment.sh | ~/bin/
scripts/mailcap | ~/.config/mutt/
accounts/* | ~/.config/mutt/
muttrc | ~/.config/mutt/
mbsyncrc | ~/.mbsyncrc
notmuch-config | ~/.notmuch-config
msmtp-config | ~/.config/msmtp/config

I've installed theme files in the **~/.config/mutt/colors** subdir and should be sourced from within *muttrc*.

## Configuration

** In general, look for <...> and change according to the text inside < and >. **

mbsyncrc and msmtp-config need to be edited with your own data for connections.
I keep mine locally so as to not leak private information.

notmuch-config needs to be edited also to set the path to your mail database and your settings under [user].

I set my default directory to save attachments to ~/Downloads/attachments. Change it to your liking!
