<?php include('header.php'); 
  get_session();
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf8mb4">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Удаление вопроса</title>
</head>
<body>

  <?php
   get_header(); 
  include 'db.php';
  include 'api.php';
  include 'questions_query.php';

  //получение из questions.php
  $q_id = $_GET['q_id'];
  $tkt_id = $_GET['tkt_id'];

  if ($q_id) {
    deleteQuestion($db, $q_id);
    echo "<h1>Вопрос удалён</h1>";
    echo "<a href=\"questions.php?tkt_id=$tkt_id\">Вернуться к вопросам</a>";
  } else {
    echo "<h1>При удаление призошла ошибка</h1>";
    exit();
  }

  ?>
</body>

</html>