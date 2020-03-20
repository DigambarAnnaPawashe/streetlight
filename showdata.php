<?php 
  
     include 'databaseconfi.php';

  $employeeview = "SELECT * FROM `formdatas`";
   $employeeout = $conn->query($employeeview);
   $employeedata = $employeeout->fetchAll(pdo::FETCH_ASSOC);
    // var_dump($employeedata);
    // die();
?>
  
  

<table border="2px" width="40%" style="margin-top: 50px; height:70px; ">
	<tr>
	
		
		<th>Employee Name</th>

		
	</tr>
	<?php foreach ($employeedata  as $key => $value): ?>
		<tr>
			
			
			<td><?php echo $value['EmpName'] ?></td>
			
			
		</tr>
		 	<?php endforeach ?>
</table>
       