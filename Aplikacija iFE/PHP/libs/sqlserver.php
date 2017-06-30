<?php

	function get_profesors(int $id)
	{
		
		$ServerName="localhost, 1433";
		$ConnectionInfo=array(
		"Database" =>"iFE",
		"UID" =>"sa",
		"PWD" =>"iFE2016",
		"CharacterSet"=>"UTF-8"
		);
			
			$Conn=sqlsrv_connect($ServerName, $ConnectionInfo);
			if(!$Conn)
			{
				echo "Ni se mogoèe povezat z bazo.</br>";
				die(print_r(sqlsrv_errors(),true));
			}
			
			$return_arr=array();
			
			if($id==-1)	
			{      
				 $stmnt=sqlsrv_query($Conn,"SELECT * FROM dbo.fnZaposleniPoTipu(Vsi zapoleni)");
			}
			else	
			{
				$stmnt=sqlsrv_query($Conn,"SELECT * FROM dbo.fnVsiPodatkiZaposlenega("+strval($id)+")");
			}
			
			if(!($stmnt)
			{
				echo "Napaka pri izbrševanju poizvedbe.</br>";
				die(print_r(sqlsrv_errors(),true));
			}
					do
					{
						while($row = sqlsrv_fetch_array($stmnt,SQLSRV_FETCH_ASSOC))
						{
							$return_arr[] =$row;
						}
					} while (sqlsrv_next_result($stmnt));
					
					
			echo json_encode($return_arr,<code> JSON_NUMERIC_CHECK </code>);
				sqlsrv_free_stmt($stmnt);
				sqlsrv_close($Conn);
	}
	
	
			
			
			
?>