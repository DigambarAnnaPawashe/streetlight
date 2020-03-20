<?php

include 'databaseconfi.php';

// $id = isset($_GET['id']);
$id = $_GET['id'];
  if($id > 0){
$idFetch = $conn->prepare("SELECT * FROM  formdatas WHERE id = :id"); 
$iddataarry = [
                      ':id'=>$id
                    ]; 
            // print_r($pendingdataarry);
                    $employeeout = $idFetch->execute($iddataarry);
                    // var_dump($employeeout);
                    // die();
$idrecod = $idFetch->fetchAll(pdo::FETCH_ASSOC);
//     var_dump($idrecod);
//   die();
                }else{
                    echo "not valid id";
                }



    $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);

  $msg = 'Send Data properly';
      $len = strlen($msg);

      socket_sendto($sock, $msg, $len, 0, $idrecod, 1223);
      socket_close($sock);
?>