<?php
  try
  {
    //open the database
    $db = new PDO('sqlite:/var/www/html/db/play.db');

    //now output the data to a simple html table...
    echo "<table class='qtable'>";
    echo "<tr class='qhead'><td>Wins</td><td>Losses</td><td>Draws</td></tr>";
    echo "<tr class='qrow'>";
    $result = $db->query('SELECT count(*) AS Wins
        FROM Game Join Play Join Team AS HomeTeam Join Team AS AwayTeam
            ON Game.GameId = Play.GameId
                     AND HomeTeam.TeamId = Play.HomeTeamId
                     AND AwayTeam.TeamId = Play.AwayTeamId
                         WHERE (Game.HomeScore > Game.AwayScore AND HomeTeam.TeamId = 9) OR (Game.AwayScore > Game.HomeScore AND AwayTeam.TeamId = 9)');
    
    foreach($result as $row)
    {
      echo "<td class='qcell'>".$row['Wins']."</td>";
    }

    $result = $db->query('SELECT count(*) AS Losses
        FROM Game Join Play Join Team AS HomeTeam Join Team AS AwayTeam
            ON Game.GameId = Play.GameId
                     AND HomeTeam.TeamId = Play.HomeTeamId
                     AND AwayTeam.TeamId = Play.AwayTeamId
                         WHERE (Game.HomeScore < Game.AwayScore AND HomeTeam.TeamId = 9) OR (Game.AwayScore < Game.HomeScore AND AwayTeam.TeamId = 9)');
    
    foreach($result as $row)
    {
      echo "<td class='qcell'>".$row['Losses']."</td>";
    }

    $result = $db->query('SELECT count(*) AS Draws
        FROM Game Join Play Join Team AS HomeTeam Join Team AS AwayTeam
            ON Game.GameId = Play.GameId
                     AND HomeTeam.TeamId = Play.HomeTeamId
                     AND AwayTeam.TeamId = Play.AwayTeamId
                         WHERE (Game.HomeScore = Game.AwayScore AND HomeTeam.TeamId = 9) OR (Game.AwayScore = Game.HomeScore AND AwayTeam.TeamId = 9)');
    foreach($result as $row)
    {
      echo "<td class='qcell'>".$row['Draws']."</td>";
    }
    echo "</tr>";
    echo "</table>";

    // close the database connection
    $db = NULL;
  }
  catch(PDOException $e)
  {
    echo $e->getMessage();
  }
?>