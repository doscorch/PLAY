<!DOCTYPE html>
<html lang="en">
  <head>
    <title>AFC Bournemouth</title>
    <script src="https://code.jquery.com/jquery-2.1.1.js" type="text/javascript"></script>
    <script src="javascript/play.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/play.css">
    <link rel="stylesheet" href="css/query.css">
    </style>
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
      <h1>AFC Bournemouth</h1>
      <div class="tabs">
        <ul>
          <li class="tab active"><a href="#tabs-1">Statistics</a></li>
          <li class="tab"><a href="#tabs-2">Schedule</a></li>
          <li class="tab"><a href="#tabs-3">Players</a></li>
          <li class="tab"><a href="#tabs-4">Manager</a></li>
        </ul>
        <div class="tab-content active" id="tabs-1">
          <div class="business-card">
            <header class="bussiness-card-header">
              <h1>Statistics</h1>
            </header>
            <div class="business-card-body">
              <div>
               <?php include("php/statsbournemouth.php"); ?>
              </div>
            </div>        
          </div>
        </div>
        <div class="tab-content" id="tabs-2">
          <div class="business-card">
            <header class="bussiness-card-header">
              <h1>Game Schedule</h1>
            </header>
            <div class="business-card-body">
              <div>
               <?php include("php/schedulebournemouth.php"); ?>
              </div>
            </div>          
          </div>
        </div>
        <div class="tab-content" id="tabs-3">
          <div class="business-card">
            
            <header class="bussiness-card-header">
              <h1>Players</h1>
            </header>
            <div class="business-card-body">
              <div>
                <p>
                  <?php include("php/playersbournemouth.php"); ?>
                </p>
                <table class="team_table"></table>
              </div>
            </div>      
          </div>
        </div>
        <div class="tab-content" id="tabs-4">
          <div class="business-card">
            
            <header class="bussiness-card-header">
              <h1>Manager</h1>
            </header>
            <div class="business-card-body">
              <div>
                <p>
                <?php include("php/managerbournemouth.php"); ?>
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