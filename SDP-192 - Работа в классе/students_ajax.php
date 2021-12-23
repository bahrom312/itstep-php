<?php 


    $servername = "localhost";
    $username = "mysql";
    $password = "mysql";
    $db_name = "itstep";

    // выполнение подключения
    $conn = new PDO("mysql:host=$servername;dbname=$db_name", $username, $password);
    // установка режима ошибки PDO на исключение
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Получения данных из таблицы
    $sql = "SELECT * FROM students_table";
    $result = $conn->query($sql);
    $rows_array = $result->fetchAll(PDO::FETCH_ASSOC); 

    sleep(3);

?>

<table border="1">
<tr>
    <th>ID</th>
    <th>Pic</th>    
    <th>Name</th>
    <th>Surname</th>
    <th>Age</th>
    <!-- <th>Delete</th> -->
    <!-- <th>Edit</th> -->
</tr>


<?php
foreach($rows_array as $row):
?>
    <tr>
        <td><?php echo $row['id'];?></td>
        <td>
            <img src="photos/photo_<?php echo $row['id'];?>.png" width="50px">
        </td>
        <td style="display: flex;"><?php echo $row['name'];?></td>
        <td><?php echo $row['surname'];?></td>
        <td><?php echo $row['age'];?></td>
        <!-- <td>
            <a href="edit_form.php?id=<?php echo $row['id'];?>">Edit</a>
        </td> -->
    </tr>
<?php
endforeach
?>


</table>