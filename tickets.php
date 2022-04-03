<!DOCTYPE html>
<html lang="ru">

<head>
<meta charset="utf-8" />
  <title>Билеты</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1" />
</head>
<style>
    .form_ed {
        display: none;
    }
</style>

<script>
    let tkt_btn = document.getElementById('tkt_btn');

  /*   for (let i = 0; i < tkt_btn.length; i++) {
        tkt_btn[i].onclick = function() {
            let form = this.parentElement.getElementsByClassName('form_ed')[0];
            form.style.display = 'block';
            this.style.display = 'none';
        }
    } */
    tkt_btn.onclick = function() {
            let form = this.parentElement.getElementsByClassName('form_ed');
            form.style.display = 'block';
            this.style.display = 'none';
    }
</script>

<body>
    <?php
    include 'db.php';
    include 'api.php';
    $tickets = getAllTickets($db);

    foreach ($tickets as $row) {
        $tkt_id = $row['tkt_id'];
        $name = $row['name'];
        echo "<a href=\"questions.php?tkt_id=$tkt_id\">$name</a><br>";
    }


    ?>

    <div>
        <form class="form_ed">
            <input type="text" name="tkt_name" placeholder="Введите название билета">
            <input type="submit" value="Добавить">
        </form>
        <button class="tkt_btn" id="tkt_btn">Добавить новый билет</button>
    </div>

    <?php
    if ($_POST['tkt_name'] > '') {
        $tkt_name = $_POST['name'];
        $sql = "INSERT INTO tickets(name) VALUES($tkt_name)";
        $db->exec($sql);
        header('Refresh: 1;');

        echo var_dump($stmt->errorInfo());
    }
    ?>

</body>

</html>