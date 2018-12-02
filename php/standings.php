<?php
  try
  {
    //open the database
    $db = new PDO('sqlite:/var/www/html/db/play.db');

    //now output the data to a simple html table...
    echo "<table class='qtable'>";
    echo "<tr class='qhead'><td>Team</td><td>Points</td></tr>";
    $result = $db->query('SELECT HomeTeam1 AS Team, (HomePoints+AwayPoints) AS Points FROM(
(SELECT HomeTeam1, (Wins + Draws) AS HomePoints
	From (SELECT HomeTeam.Name AS HomeTeam1, (count(*)*3) AS Wins
			FROM Game Join Play Join Team AS HomeTeam Join Team AS AwayTeam
				ON Game.GameId = Play.GameId
				AND HomeTeam.TeamId = Play.HomeTeamId
				AND AwayTeam.TeamId = Play.AwayTeamId
                                                    WHERE (Game.HomeScore > Game.AwayScore AND Play.HomeTeamId = HomeTeam.TeamId) 
                                                    GROUP BY HomeTeam.Name) JOIN
		(SELECT HomeTeam.Name AS HomeTeam2, count(*) AS Draws
			FROM Game Join Play Join Team AS HomeTeam Join Team AS AwayTeam
				ON Game.GameId = Play.GameId
				AND HomeTeam.TeamId = Play.HomeTeamId
				AND AwayTeam.TeamId = Play.AwayTeamId
                                                     WHERE (Game.HomeScore = Game.AwayScore AND Play.HomeTeamId = HomeTeam.TeamId)
                                                    GROUP BY HomeTeam.Name)
                             ON HomeTeam1 = HomeTeam2)
JOIN
(SELECT AwayTeam1, (Wins + Draws) AS AwayPoints
	From (SELECT AwayTeam.Name AS AwayTeam1, (count(*)*3) AS Wins
			FROM Game Join Play Join Team AS HomeTeam Join Team AS AwayTeam
				ON Game.GameId = Play.GameId
				AND HomeTeam.TeamId = Play.HomeTeamId
				AND AwayTeam.TeamId = Play.AwayTeamId
                                                    WHERE (Game.HomeScore < Game.AwayScore AND Play.AwayTeamId = AwayTeam.TeamId) 
                                                    GROUP BY AwayTeam.Name) JOIN
		(SELECT AwayTeam.Name AS AwayTeam2, count(*) AS Draws
			FROM Game Join Play Join Team AS HomeTeam Join Team AS AwayTeam
				ON Game.GameId = Play.GameId
				AND HomeTeam.TeamId = Play.HomeTeamId
				AND AwayTeam.TeamId = Play.AwayTeamId
                                                     WHERE (Game.HomeScore = Game.AwayScore AND Play.AwayTeamId = AwayTeam.TeamId)
                                                    GROUP BY AwayTeam.Name)
                        ON AwayTeam1 = AwayTeam2)
ON HomeTeam1 = AwayTeam1
)
ORDER BY (HomePoints+AwayPoints) DESC');
    foreach($result as $row)
    {
      echo "<tr class='qrow'>";
      echo "<td class='qcell'>".$row['Team']."</td>";
      echo "<td class='qcell'>".$row['Points']."</td>";
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