<?php

function get_session(){
      global $u_name;
      session_start();
      $u_name = $_SESSION['u_surname'].' '.$_SESSION['u_name'].' '.$_SESSION['u_patr'];
}

function get_header(){
      global $u_name;
echo '<header>';
echo '<div class="navbar">';
echo '<div class="nav-item"><a href="pdd.php">Главная</a></div> 
      <div class="nav-item"><a href="tickets.php">Билеты</a></div> 
      <div class="nav-item"><a href="trainer_tkt.php">Тренажер</a></div>
      <div class="nav-item"><a href="exam_tkt.php">Экзамен</a></div>
      <div class="nav-item"><a href="change_password.php">Сменить пароль</a></div> 
      <div class="nav-item nav-user"><a href="logout.php">Выход</a></div>
      <div class="nav-item nav-user"><a>'.$u_name.'</a></div>';
echo '</div>';
echo '</header>';
}

?>
