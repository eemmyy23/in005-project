<?php
include_once('_inc/_func_shell.php');

if(!empty($_POST)){
	switch($_POST['cmd']){
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
}
?>

<html>
<head>

<link rel=StyleSheet href="_css/style.css" type="text/css" />

</head>
<body>
<h1>Theodor 1 Web Interface</h1>




 <div class="left">
 <div class="content">
  <h2>Commands</h2>
  <p>
   <form method="POST" name="form_cmd" action="<?php echo $_SERVER['PHP_SELF']; ?>">
	<input type="radio" name="cmd" value="start roscore" />roscore <br>
	<input type="radio" name="cmd" value="start all" />all.launh <br>
	<input type="radio" name="cmd" value="start cam" />cam.launch <br>
	<input type="radio" name="cmd" value="kill all" />kill all launchers <br>
	<input type="radio" name="cmd" value="reboot 1" />reboot in 1 min<br>
	<input type="radio" name="cmd" value="shutdown 1" />shutdown in 1 min<br>
	<input type="radio" name="cmd" value="reboot now" />reboot now<br>
	<input type="radio" name="cmd" value="" checked="checked" />none <br>
	<input type="submit" name="submit" value="submit" />
   </form>
  </p>
  
   <div class="apps">
  <h2>ROS Web Apps</h2>
  <p>Video monitor: <a href="mjpg.php" target="_blank"><b>mjpeg</b></a></p>
  <p>Other apps</p>
  <!--<a href="/~emi/mob_ptu_local/" target="_blank">PTU - LOCAL</a> <br>-->
  <a href="/~emi/mob_ptu_ext/" target="_blank"><b>Pan Tilt Unit</b></a> <br>
  <!--<a href="/~emi/mob_robot_local/" target="_blank">PTU - LOCAL</a> <br>-->
  <a href="/~emi/test0/" target="_blank"> ~ test ~</a> <br>
  </div>
 </div>
 </div>

 <div class="right">
 <div class="content">
  <h2>Status <a href="<?php echo $_SERVER['PHP_SELF']; ?>">refresh</a></h2>
  <p><b>System date:</b> <?php echo shell_exec('date');?></p>
  <p><b>System uptime:</b> <?php echo shell_exec('uptime');?></p>
	<?php 
	$launchers = infoPID(statusCMD("roslaunch"));
	if (empty($launchers)) echo '<p class="msg err">No roslaunch instances were found!</p>';
	else {
		echo '<p class="msg ok">';
		foreach($launchers as $pid => $cmd)
			echo "PID:{$pid} CMD:{$cmd}<br>";
		echo '</p>';
	}
	
	echo shell_exec('bash _sh/info.sh'); 
	
	?>
 </div>
 </div>

</div>
</body>
</html>
