<?php
  try
  {
    //open the database
    $db = new PDO('sqlite:/var/www/html/db/play.db');

    //now output the data to a simple html table...
    echo "<table class='qtable'>";
    echo "<tr class='qhead'><td>Date</td><td>Home Team</td><td>Score</td><td>Away Team</td><td>Score</td></tr>";
    $result = $db->query('SELECT Game.GameDate, HomeTeam.Name AS HName, Game.HomeScore, AwayTeam.Name AS AName, Game.AwayScore
                            FROM Game JOIN Play JOIN Team AS HomeTeam JOIN Team AS AwayTeam
                            ON Game.GameId = Play.GameId
                            AND Play.HomeTeamId = HomeTeam.TeamId
                            AND Play.AwayTeamID = AwayTeam.TeamId
			    WHERE HomeTeam.TeamId = 16 OR AwayTeam.TeamId = 16');
    foreach($result as $row)
    {
      echo "<tr class='qrow'>";
      echo "<td class='qcell'>".$row['GameDate']."</td>";
      echo "<td class='qcell'>".$row['HName']."</td>";
      echo "<td class='qcell'>".$row['HomeScore']."</td>";
      echo "<td class='qcell'>".$row['AName']."</td>";
      echo "<td class='qcell'>".$row['AwayScore']."</td>";
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