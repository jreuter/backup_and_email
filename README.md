# Backup and email

Series of scripts to backup and email when complete.

This is using bash to run rsync over SSH.  The purpose is to maintain an offsite RAID backup of my primary server at home.

## Assumptions

The following software should be installed and configured.  This doesn't require a local email server, but `ssmtp` needs configured to use an existing email service.

* Bash
* PHP7-cli
* ssmtp

Since this can be run from a crontab, it is expected you have an SSH loging that doesn't require user interaction (i.e. ssh keys with no passphrase).

## To Create and Use SSH Keys

Generate the key pair.

    ssh-keygen -t rsa

Push the public key as your user.

    cat ~/.ssh/id_rsa.pub | ssh -p 22 usernamme@your_server_ip 'cat >> .ssh/authorized_keys'

## Create Variables

You will need to create a `bash_variables.sh` and `email_variables.php` files in the root directory.  You can copy and edit the samples to get started.

I recommend using test directories with small files/folders that aren't important or are backed up for testing.

## Set up cronjob

You can set up a cronjob to run as a normal user.  Simply run `crontab -e` when you are not root.

I put my cronjob up to run at 3am each Wednesday by adding the following line.

    00 3 * * 3 /media/data/code/backup_and_email/backup.sh

It's a good idea to research cronjobs a bit before doing this if you aren't familiar with them.  Also you may want to move the code later to someplace like `/opt`.
