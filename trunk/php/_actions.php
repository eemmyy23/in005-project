<?php
function actions($cmd,$args){
	echo "php > ";
	switch($cmd){
	case "start roscore":
		echo "start roscore";
		shell_exec('bash _sh/roscore.bash');
		break;
	case "start all":
		echo "start all.launch";
		shell_exec('bash _sh/x.bash');
		break;
	case "start cam":
		echo "no actions implemented yet";
		break;
	case "kill all":
		echo "kill all";
		killCMD("roslaunch");
		break;
	case "kill update":
		echo "kill update script";
		killCMD("main-loop",$args[0]);
		break;
	case "shutdown 1":
		echo "shutdown -h 1";
		echo shell_exec('echo "emi" | sudo -S shutdown -h 1');
		break;
	case "reboot 1":
		echo "shutdown -r 1";
		echo shell_exec('echo "emi" | sudo -S shutdown -r 1');
		break;
	case "reboot now":
		echo "shutdown -r now";
		echo shell_exec('echo "emi" | sudo -S shutdown -r now');
		break;
	default:
		echo "nothing";
		break;
	}
	echo "\n";
}
?>

