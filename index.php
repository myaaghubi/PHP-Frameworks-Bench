<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>PHP Frameworks Bench</title>
    <script>
        <?php
        $dataLabels = [];
        $dataRPS = [];
        $dataMemory = [];
        $dataTime = [];
        $dataFile = [];

        $resultsFile = __DIR__ . '/output/results.hello_world.log';

        if (file_exists($resultsFile)) {
            Parse_Results: {
                require __DIR__ . '/libs/parse_results.php';
                $results = parse_results($resultsFile);
            }

            foreach ($results as $fw => $params) {
                $dataLabels[] = $fw;
                $dataRPS[] = $params['rps'];
                $dataMemory[] = $params['memory'];
                $dataTime[] = $params['time'];
                $dataFile[] = $params['file'];
            }
        }

        echo "
        const dataLabels = ['".implode("','",$dataLabels)."'];
        const dataRPS = [".implode(",",$dataRPS)."];
        const dataMemory = [".implode(",",$dataMemory)."];
        const dataTime = [".implode(",",$dataTime)."];
        const dataFile = [".implode(",",$dataFile)."];
        ";
        ?>
    </script>
</head>

<body style="max-width: 1200px; margin:0 auto; padding: 15px 30px">
    <h1>PHP Frameworks Bench</h1>

    <?php
    if (!file_exists($resultsFile)) {
    ?>
        <b>output/results.hello_world.log</b> not found!
        <ul style="list-style-type:decimal">
            <li>Run <b>bash setup.sh</b></li>
            <li>Run <b>bash check.sh</b></li>
            <li>Run <b>bash benchmark.sh</b></li>
        </ul>
    <?php
    } else {
        echo "<h4>" . date("Y/m/d H:i:s", filemtime($resultsFile)) . "</h4>";
    ?>
        <br>
        <canvas id="rpsChart" height="120"></canvas>
        <br>
        <canvas id="memoryChart" height="120"></canvas>
        <br>
        <canvas id="timeChart" height="120"></canvas>
        <br>
        <canvas id="fileChart" height="120"></canvas>
    <?php
    }
    ?>

    <ul>
        <?php
        $urls = file(__DIR__ . '/output/urls.log');
        foreach ($urls as $url) {
            $url_array = explode('/', $url);
            // to make it shorter
            $url_array = array_slice($url_array,4);
            echo "<li><a href=\"$url\">.../".implode('/', $url_array)."</a></li>";
        }
        ?>
    </ul>
    <br>
    <hr>

    <footer>
        <p>This page is a part of <a href="https://github.com/myaaghubi/PHP-Frameworks-Bench">PHP-Frameworks-Bench</a>.</p>
    </footer>
    <script src="libs/chart4.3.js"></script>
    <script src="libs/app.js"></script>
</body>

</html>