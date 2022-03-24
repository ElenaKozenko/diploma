<!doctype html>
<html lang="ru">
<head>
  <meta charset="utf-8" />
  <title>Новый вопрос</title>
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

<?php include 'db.php';  ?>
<?php  include 'api.php'; ?>
<?php $topic = getAllTopics($db); ?>
<?php $tkt = getAllTickets($db); ?>

    <form name="" action="" method="post">
       <!--  <label for="num_question">Вопрос №: </label> 
        <input type="text" id="num_question" name="num_question" > -->
        <!-- название билета -->
       
            <select id="ticket" name="ticket">
            <?php foreach ($tkt as $row){
                $id = $row['tkt_id'];
                $name = $row['name'];
                echo "<option value=\"$id\">$name</option>";}?>
            </select>
        <!-- <input type="number" id="ticket" name="ticket" placeholder="1"> -->
<br>
        <label for="theme">Тема билета:</label> <!-- выбор темы билета -->
            <select id="theme" name="theme">
            <?php foreach ($topic as $row){
                $id = $row['tp_id'];
                $name = $row['name'];
                echo "<option value=\"$id\">$name</option>";}?>
            </select>

<!-- ОТРЕДАКТИРОВАТЬ СДЕЛАТЬ ВЫБОР КАРТИНКИ КРАСИВЫЙ -->

        <label for="picture">Код картинки: </label> 
        <input type="number" id="picture" name="picture" >

        <label for="question">Вопрос: </label> <!-- ввод вопроса -->
        <input type="text" id="question" name="question" placeholder="Введите вопрос здесь" maxlength="">
        
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

        <input type="submit" value="Добавить вопрос">
    </form>
    <!-- if(isset($_POST['question'])) -->

    <?php if($_POST['question'] != '')  
            {
            $tkt_id=$_POST['ticket'];
            $pic_id=$_POST['picture'];
            $tp_id=$_POST['theme'];
            $task=$_POST['question'];
            $true_ans=$_POST['answer'];
            $ans1=$_POST['answer1'];
            $ans2=$_POST['answer2'];
            $ans3=$_POST['answer3'];
            $ans4=$_POST['answer4'];
            $ans5=$_POST['answer5'];
            $description=$_POST['description'];
        addQuestion($db, $tkt_id, $pic_id, $tp_id, $task, $true_ans, $ans1, $ans2, $ans3, $ans4, $ans5, $description);
            }?> 




</body>
</html>

<!-- <label for=""> </label>
            <select id="simple" name="theme">
                <option>Banana</option>
                <option>Cherry</option>
                <option>Lemon</option>
            </select>
        <input type="" id="" name="" placeholder="" maxlength="">
        <textarea id="" name=""> </textarea> -->