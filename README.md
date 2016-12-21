# Backup and email

Series of scripts to backup and email when complete.

This is using bash to run sync over SSH.  The purpose is to maintain an offsite RAID backup of my primary server at home.

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

You will need to create a `variables.sh` file.  You can copy and edit the `sample_variables.sh` to get started.

I recommend using test directories with small files/folders that aren't important or are backed up for testing.
