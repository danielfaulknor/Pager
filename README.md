## NZ Pager Tool

A quick tool to send pages to NZ Minicall pagers. (You call the pager number, send it DTMF tones and it fires them off to the pager)

To use:

-Put the files in your webroot and make sure PHP has short open OFF
-Get a Plivo account, and buy a number (US is fine, they're cheaper)
-Create config.sh from the template and update config.php with the numbers you want to send and the URL to the folder
-Run ./sendpage.sh [string] where string is one of the options you have defined
-Done


As ugly as their website is, http://www.fasttalk.co.nz/ is the place to go for these MiniCall pagers.


### TODO
-Convert everything to PHP
-Make it secure
