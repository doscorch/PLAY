<?php
  try
  {
    //open the database
    $db = new PDO('sqlite:/var/www/html/db/play.db');

    //now output the data to a simple html table...
    echo "<table class='qtable'>";
    echo "<tr class='qhead'><td>Date</td><td>Home Team</td><td>Away Team</td><td>Goals</td></tr>";
    $result = $db->query('SELECT Game.GameDate AS GameDate, HomeTeam.Name AS HName, AwayTeam.Name AS AName, HomeScore+AwayScore AS Goals
                            FROM Game JOIN Play JOIN Team AS HomeTeam JOIN Team AS AwayTeam
                            ON Game.GameId = Play.GameId
                            AND HomeTeam.TeamId = Play.HomeTeamId
                            AND AwayTeam.TeamId = Play.AwayTeamID
                            ORDER BY (Game.HomeScore+Game.AwayScore) DESC
                            LIMIT 10');
    foreach($result as $row)
    {
      echo "<tr class='qrow'>";
      echo "<td class='qcell'>".$row['GameDate']."</td>";
      echo "<td class='qcell'>".$row['HName']."</td>";
      echo "<td class='qcell'>".$row['AName']."</td>";
      echo "<td class='qcell'>".$row['Goals']."</td>";
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