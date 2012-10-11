<?php
include("_func_shell.php");
include("_actions.php");

var_dump($argv);
echo "==========\n";
array_shift($argv);
$cmd = array_shift($argv);
var_dump($argv);
actions($cmd,$argv)	

?>
