#!/usr/bin/php
<?PHP
include 'email_variables.php';

    $sub = "NAS Media Backup - Power Fail";
    $msg = "There has been a power incident.\n\n".file_get_contents("ups-output");

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
