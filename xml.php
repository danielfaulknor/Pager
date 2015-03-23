<?php
header('Content-type: application/xml');
$base_url="http://" . $_SERVER['SERVER_NAME'] . dirname($_SERVER["REQUEST_URI"].'?');
require_once("config.php");
?>
<?xml version="1.0" encoding="UTF-8" ?>
<Response>
        <Record action="<?=$base_url?>/record.php" recordSession="true" redirect="false" fileFormat="wav"/>
        <DTMF>WWW<?=$digits[$_GET['type']]?>#</DTMF>
        <Wait length="10" />
</Response>
