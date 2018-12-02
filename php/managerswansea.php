<?php
  try
  {
    //open the database
    $db = new PDO('sqlite:/var/www/html/db/play.db');

    //now output the data to a simple html table...
    echo "<table class='qtable'>";
    echo "<tr class='qhead'><td>First Name</td><td>Last Name</td><td>Salary</td></tr>";
    $result = $db->query('SELECT Team.Name, Manager.FirstName, Manager.LastName, Manager.Salary
                            FROM Manager NATURAL JOIN ManagedBy NATURAL JOIN Team
                            WHERE Team.TeamId = 12');
    foreach($result as $row)
    {
      echo "<tr class='qrow'>";
      echo "<td class='qcell'>".$row['FirstName']."</td>";
      echo "<td class='qcell'>".$row['LastName']."</td>";
      echo "<td class='qcell'>".$row['Salary']."</td>";
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