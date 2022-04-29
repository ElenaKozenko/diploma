<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php var_dump($_POST); 
echo '<hr>';
$strrr = $_POST['body'];
var_dump($strrr);
echo '<hr>';
$arr = json_decode($strrr);
var_dump($arr);

echo $arr[1];

?>

</body>
</html>