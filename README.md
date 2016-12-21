# Backup and email

Series of scripts to backup and email when complete.

This is using bash to run sync over SSH.  The purpose is to maintain an offsite RAID backup of my primary server at home.

## Assumptions

The following software should be installed and configured.  This doesn't require a local email server, but `ssmtp` needs configured to use an existing email service.

* Bash
* PHP7-cli
* ssmtp
