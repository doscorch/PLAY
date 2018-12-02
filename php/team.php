<?php
  try
  {
    //open the database
    $db = new PDO('sqlite:/var/www/html/db/play.db');

    //now output the data to a simple html table...
    echo "<table class='qtable'>";
    echo "<tr class='qhead'><td>Name</td></tr>";
    $result = $db->query('SELECT Team.Name FROM Team');
    foreach($result as $row)
    {


      echo "<tr class='qrow'>";
      echo "<td class='qcell'>".$row['Name']."</td>";
      echo "</tr>";
    }
    echo "</table>";

    // close the database connection
    $db = NULL;
  }
  catch(PDOException $e)
  {
    echo $e->getMessage();
  }
?>