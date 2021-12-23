<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- Connect JQUERY CDN  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 

    <script>
        $( document ).ready(function() {
            ajax_table_load();
        });

        function ajax_table_load(){
            // Get Students Table with AJAX 
            $.ajax({
                method: "GET",
                url: "students_ajax.php",
                data: { },
                beforeSend : function (){
                    // alert( "beforeSend" );
                    console.log( "beforeSend" );
                    $('#table').html("Loading ......");
                },
            })
            .done(function( html ) {
                //alert( "Result: " + msg );
                $('#table').html(html);
            });
        }
    </script>
</head>
<body>

    <h3> Students Table  AJAX </h3>

    <div id="table">

    </div>

    <br>

    <!-- Добавления студента  -->
    <h3>New Student form</h3>
    <form action="" method="post">
        Name: <input type="text" name="name">
        <br>
        Surname: <input type="text" name="surname">
        <br>
        <input type="submit" value="Send">
        <input type="hidden" name="action" value="insert">
    </form>





</body>
</html>