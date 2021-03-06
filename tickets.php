<?php include('header.php'); 
  get_session();
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <title>Билеты</title>
</head>

<body>

    <?php
    get_header();
    include 'db.php';
    include 'api.php';
    $tickets = getAllTickets($db);

echo "<p>Нажмите на название билета, чтобы перейти к списку вопросов.</p><div class=\"tkt\">";
    foreach ($tickets as $row) {
        $tkt_id = $row['tkt_id'];
        $name = $row['name'];
        echo "<div class=\"block\"><a href=\"questions.php?tkt_id=$tkt_id\">$name</a></div>";
    }
echo "</div>";
    ?>

    <div>
        <form class="form_ed" id="form_ed" name="form_ed">
            <input type="text" name="tkt_name" placeholder="Введите название билета">
            <input type="submit" name="add" value="Добавить новый билет">
        </form>
    </div>

    <?php
    if (isset($_POST['add'])) {
        $tkt_name = $_POST['tkt_name'];
        addTicket($db, $tkt_name);
    }
    ?>

</body>

</html>