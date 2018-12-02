<!DOCTYPE html>
<html lang="en">
  <head>
    <title>League Information</title>
    <script src="https://code.jquery.com/jquery-2.1.1.js" type="text/javascript"></script>
    <script src="javascript/play.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/play.css">
    <link rel="stylesheet" href="css/query.css">
  </head>
  <body>
    <header>
      <a href="index.php"><div class="logo"></div></a>
      <nav>
          <ul>
            <li><a href="index.php">Home</a></li>
            <li><a href="info.php">League Information</a></li>
	    <li><a href="team-info.php">Team Information</a></li>                
          </ul>
      </nav>
    </header>
    <footer>
      Christian Strauss | Tristan Rooney
    </footer>
    <section>
      <h1>Premier League Application Yearbook</h1>
      <div class="tabs">
        <ul>
          <li class="tab active"><a href="#tabs-1">Teams</a></li>
	  <li class="tab"><a href="#tabs-2">Standings</a></li>
          <li class="tab"><a href="#tabs-3">Games</a></li>
          <li class="tab"><a href="#tabs-4">Top 10 Games</a></li>
          <li class="tab"><a href="#tabs-5">Managers</a></li>
        </ul>
        <div class="tab-content active" id="tabs-1">
          <div class="business-card">
            <header class="bussiness-card-header">
              <h1>Teams</h1>
            </header>
            <div class="business-card-body">
              <div>
               <?php include("php/team.php"); ?>
              </div>
            </div>        
          </div>
        </div>
	<div class="tab-content" id="tabs-2">
          <div class="business-card">
            <header class="bussiness-card-header">
              <h1>Standings</h1>
            </header>
            <div class="business-card-body">
              <div>
               <?php include("php/standings.php"); ?>
              </div>
            </div>          
          </div>
        </div>
        <div class="tab-content" id="tabs-3">
          <div class="business-card">
            <header class="bussiness-card-header">
              <h1>Games</h1>
            </header>
            <div class="business-card-body">
              <div>
               <?php include("php/game.php"); ?>
              </div>
            </div>          
          </div>
        </div>
        <div class="tab-content" id="tabs-4">
          <div class="business-card">
            
            <header class="bussiness-card-header">
              <h1>Top 10 Games Scored</h1>
            </header>
            <div class="business-card-body">
              <div>
                <p>
                  <?php include("php/top-10-games-scored.php"); ?>
                </p>
                <table class="team_table"></table>
              </div>
            </div>      
          </div>
        </div>
        <div class="tab-content" id="tabs-5">
          <div class="business-card">
            
            <header class="bussiness-card-header">
              <h1>Managers</h1>
            </header>
            <div class="business-card-body">
              <div>
                <p>
                <?php include("php/manager.php"); ?>
                </p>
                <table class="team_table"></table>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section>
  </body>
</html>