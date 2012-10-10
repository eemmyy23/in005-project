<?php
ini_set("display_errors",1);
error_reporting(E_ALL);

#$pid = shell_exec('bash x.bash');
#echo "pornesc roslaunch => pid:".$pid;

//nohup myprogram > foo.out 2> foo.err < /dev/null &
#echo "rosnode list: ?\n"; echo shell_exec('bash info.sh');

/********************
function terminal($command){
pgrep -f "roslaunch theodor"

exec ( string $command [, array &$output [, int &$return_var ]] )
}
*/

function statusPID($pid){
exec ( "ps $pid", &$out);
return count($out) - 1;
}

function infoPID($array){
	$proc = array();
	foreach($array as $pid)	{
		$out = '';
		exec ( "ps -p $pid -f", &$out);
		$name = explode("/roslaunch ",$out[1]);
		$proc[$pid] = $name[1];
	}
	return $proc;
}

function statusCMD($cmd){
exec ( 'pgrep -f "'.$cmd.'"', &$pid);
array_pop($pid);
return $pid;
}

function killCMD($cmd){
	$pids = statusCMD($cmd);
	foreach ($pids as $pid)
		exec ("kill $pid");
		sleep(5);
}


function start($script){
	exec ($script, &$out);
	return $out;
}

function restart ($script, $search = false){
	if($search !=false) $killCMD($search);
	else killCMD ($script);
	start($script);
}
function start_once ($script, $search = false){
	if($search !=false) {
		if (count(statusCMD($search))){
			echo $search . "alerady started with pid: " . implode(' ,',statusCMD($search));
			return -1;
		} else 
		return start($script);
	}
}





?>

