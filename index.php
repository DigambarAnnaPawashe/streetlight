<?php 
    include 'databaseconfi.php';

 
  if(isset($_GET['value'])){
    
echo "<pre>";
  
  $empdata = $conn->prepare("INSERT INTO formdatas(
           	                      
           	                       EmpName
           	                  
           	                       
                                   )VALUES(
           	                     
           	                       :EmpName       	                    
           	                      
           	                       )");

             $empstore = [
                           
           	               ':EmpName'=>$empName
           	               
           	              
                           ];
                           // echo "<pre>";
                  // var_dump($empstore);
                  // die();
                    $emppp=$empdata->execute($empstore);
                  
                  //  echo "<pre>";
                  // var_dump($empexe);
             //      $datafet= $empdata->fetchAll(PDO::FETCH_ASSOC);
             //   echo "<pre>";
             // var_dump($datafet);   
                      
        header('location:index.html');

                          }
                        else{
                          echo "data not get";
                        }











 ?>