<!DOCTYPE html>
<html lang="en">
	<head>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1"/>
	</head>
<body>

	<div class="col-md-3"></div>
	<div class="col-md-6 well">

		<div class="col-md-8">
			<form method="POST">	
				<h4 class="text-success">Смена пароля</h4>
				<hr style="border-top:1px groovy #000;">
				<div class="form-group">
								
				<div class="form-group">
					<label>Логин</label>
					<input type="text" class="form-control" name="login">
				</div>
				<div class="form-group">
					<label>Новый пароль</label>
					<input type="password" class="form-control" name="password">
				</div>
                <div class="form-group">
					<label>Введите пароль повторно</label>
					<input type="password" class="form-control" name="password2">
				</div>
				<br />
				<div class="form-group">
					
					<input type="submit" name="submit" value="Сменить пароль">
				</div>
				<a href="pdd.php">Главная страница</a>
			</form>
		</div>
	</div>

<?php 
require_once 'db.php';
if ($_POST['submit'])
{
	session_start();
	$u_id = $_SESSION['user'];
	
	$stmt = $db->prepare("SELECT login FROM `users` WHERE users.u_id = ?;");
    $stmt->execute(array($u_id));	
    $login_db = $stmt->fetch(PDO::FETCH_COLUMN);
	//echo var_dump($stmt->errorInfo()); 

	$login = $_POST['login'];
	$new_password = $_POST['password'];
	$new_password2 = $_POST['password2'];

	if($login == $login_db){
		if($new_password == $new_password2){
			$sql = "UPDATE users SET password = $new_password WHERE users.u_id = $u_id";
			$db->exec($sql);
			echo '<p>Пароль успешно изменен</p>';
		}
		else{
			echo '<p>Пароли не совпадают</p>';
		}
	}
	else {
		echo '<p>Неверно введен логин</p>';
	}

}

?>
</body>
</html>