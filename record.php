<?php
$url = $_REQUEST['RecordUrl'];
sleep(20);
shell_exec("wget -O stereo.wav $url");
shell_exec("bash go.sh");
