<?php
  try
  {
    //open the database
    $db = new PDO('sqlite:/var/www/html/db/play.db');

    //now output the data to a simple html table...
    echo "<table class='qtable'>";
    echo "<tr class='qhead'><td>First Name</td><td>Last Name</td><td>Position</td></tr>";
    $result = $db->query('SELECT Player.FirstName, Player.LastName, Player.Position
    FROM Player JOIN PlayFor JOIN Team
        ON Player.PlayerId = PlayFor.PlayerId AND PlayFor.TeamId = Team.TeamId
        WHERE Team.TeamId = 15');
    foreach($result as $row)
    {


      echo "<tr class='qrow'>";
      echo "<td class='qcell'>".$row['FirstName']."</td>";
      echo "<td class='qcell'>".$row['LastName']."</td>";
      echo "<td class='qcell'>".$row['Position']."</td>";
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