#!/usr/bin/php
<?PHP
include 'email_variables.php';

    $sub = "NAS Backup - RSYNC Complete";
    $msg = "Your backup has completed successfully.\n";

    $emails = explode ( " ", $to );
    $i = 0;

    while ( $i < count($emails) ) {
        if ( mail($emails[$i], $sub, $msg, "From: ".$from) ) {
            print("yepper\n");
        } else {
            print("nope\n");
        }
        $i++;
    }

?>
