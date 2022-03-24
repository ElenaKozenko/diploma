<?php
include 'db.php';

//РАБОТА С ТАБЛИЦЕЙ "Темы"
//ВЫВОД ВСЕЙ ИНФОРМАЦИИ ИЗ "Темы"
function getAllTopics($db)
{
$sql="SELECT * FROM topics;";
$result=array();
$stmt=$db->prepare($sql);
$stmt->execute();
while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {$result[$row['tp_id']] = $row;}
return $result;
}

//РАБОТА С ТАБЛИЦЕЙ "Вопросы"
//ВСТАВКА В "Вопросы""
function  addQuestion($db, $tkt_id, $pic_id, $tp_id, $task, $true_ans, $ans1, $ans2, $ans3, $ans4, $ans5, $description)
{
$sql ="INSERT INTO questions( tkt_id, pic_id, tp_id, task, true_ans, ans1, ans2, ans3, ans4, ans5, 'description')
VALUES( :tkt_id, :pic_id, :tp_id, :task, :true_ans, :ans1, :ans2, :ans3, :ans4, :ans5, :'description');";
$stmt=$db->prepare($sql);
$stmt->bindValue('tkt_id', $tkt_id, PDO::PARAM_INT);
$stmt->bindValue('pic_id', $pic_id, PDO::PARAM_INT);
$stmt->bindValue('tp_id', $tp_id, PDO::PARAM_INT);
$stmt->bindValue('task', $task, PDO::PARAM_STR);
$stmt->bindValue('true_ans', $true_ans, PDO::PARAM_INT);
$stmt->bindValue('ans1', $ans1, PDO::PARAM_STR);
$stmt->bindValue('ans2', $ans2, PDO::PARAM_STR);
$stmt->bindValue('ans3', $ans3, PDO::PARAM_STR);
$stmt->bindValue('ans4', $ans4, PDO::PARAM_STR);
$stmt->bindValue('ans5', $ans5, PDO::PARAM_STR);
$stmt->bindValue('description', $description, PDO::PARAM_STR);
$stmt->execute();
echo var_dump($stmt->errorInfo());
}

//РАБОТА С ТАБЛИЦЕЙ "Билеты"
//Вывод всей информации из "Билеты"
function getAllTickets($db)
{
$sql="SELECT * FROM tickets;";
$result=array();
$stmt=$db->prepare($sql);
$stmt->execute();
while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {$result[$row['tkt_id']] = $row;}
return $result;
}
?>