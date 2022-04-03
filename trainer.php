<!doctype html>
<html lang="ru">
<head>
  <meta charset="utf-8" />
  <title>Тренажер</title>
  <style>
    label, input {
        width: 450px;
        padding: 5px;
        margin: 20px;
    }
    *, *:before, *:after {
  box-sizing: border-box;
}
form {
    width: 500px;
}
</style>
  </head>
<body>

<?php 
    include 'db.php';  
    include 'api.php';
    include 'questions_query.php';
    $topic = getAllTopics($db);
    $tkt = getAllTickets($db);

    
    $tkt_id = $_GET['tkt_id'];
    $name = $_GET['name'];
    $n = 0; //номер вопроса

    $pathImg = '/pic/no_pic.png';
    if( isset($_GET['q']) ){
        $pt = 'uploaded/'.$_GET['q'].'.jpg';
        if(file_exists($pt)){
            $pathImg = '/uploaded/'.$_GET['q'].'.jpg';
        }
    }
?>
<img height="200px" src="<?php echo $pathImg; ?>" alt="">
    <form name="" action="" method="post" enctype="multipart/form-data">
 
           <!-- название билета и вопроса-->
           <?php echo "$name. Вопрос $n" ?>

<br>


        <label id="question" name="question" >Вопрос: </label> <!-- ввод вопроса -->
        <input type="text" placeholder="Введите вопрос здесь" maxlength="">
        
         <!-- ввод ответов -->
        <label for="answer1">Вариант ответа 1: </label>
        <input type="text" id="answer1" name="answer1" placeholder="Введите ответ здесь" maxlength="">

        <label for="answer2">Вариант ответа 2:</label>
        <input type="text" id="answer2" name="answer2" placeholder="Введите ответ здесь" maxlength="">

        <label for="answer3">Вариант ответа 3:</label>
        <input type="text" id="answer3" name="answer3" placeholder="Введите ответ здесь" maxlength="">

        <label for="answer4">Вариант ответа 4:</label>
        <input type="text" id="answer4" name="answer4" placeholder="Введите ответ здесь" maxlength="">

        <label for="answer5">Вариант ответа 5:</label>
        <input type="text" id="answer5" name="answer5" placeholder="Введите ответ здесь" maxlength=""> 

        <label for="answer">Номер верного ответа:</label> <!-- номер верного ответа -->
        <input type="number" id="answer" name="answer" >

        <label for="question">Описание ответа, подсказка:</label>
        <input type="text" id="description" name="description" placeholder="Введите подсказку здесь" maxlength="">

        <input type="reset" value="Очистить поля">

        <input type="submit" value="Сохранить ответ и перейти к следующему">
    </form>

    <?php echo "<a href=\"questions.php?tkt_id=$tkt_id\">Вернутья к списку вопросов</a>" ?>
<?php
    if($_POST['question'] != '')  
            {
            $tp_id=$_POST['theme'];
            $task=$_POST['question'];
            if ($_POST['answer'] == '') $true_ans = null; else $true_ans=$_POST['answer'];
            if ($_POST['answer1'] == '') $ans1 = null; else $ans1=$_POST['answer1'];
            if ($_POST['answer2'] == '') $ans2 = null; else $ans2=$_POST['answer2'];
            if ($_POST['answer3'] == '') $ans3 = null; else $ans3=$_POST['answer3'];
            if ($_POST['answer4'] == '') $ans4 = null; else $ans4=$_POST['answer3'];
            if ($_POST['answer5'] == '') $ans5 = null; else $ans5=$_POST['answer3'];
            if ($_POST['description'] == '') $description = null; else $description=$_POST['description'];
        addQuestion($db, $tkt_id, $tp_id, $task, $true_ans, $ans1, $ans2, $ans3, $ans4, $ans5, $description);
        UploadImage();
}
?>

</body>
</html>