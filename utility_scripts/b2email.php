#!/usr/bin/php
<?PHP
include 'b2_email_variables.php';

    $output = get_file_contents("b2_output");

    $sub = "BIG NAS Backup - BackBlaze Backup Complete";
    $msg = "Your backup has completed successfully.\n" + $output;

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
