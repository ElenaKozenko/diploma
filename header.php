<?php
session_start();
$u_name = $_SESSION['u_surname'].' '.$_SESSION['u_name'].' '.$_SESSION['u_patr'];
echo '<header>';
echo '<table><tr>';
echo '<td><a href="tickets.php">Билеты</a></td> 
      <td><a href="trainer.php">Тренажер</a></td>
      <td><a href="exam.php">Экзамен</a></td>
      <td><a href="change_password.php">Сменить пароль</a></td> 
      <td>'.$u_name.'</td>';
echo '</tr></table>';
echo '</header>';
?>
