<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>PHP Frameworks Bench</title>
</head>

<body style="max-width: 1200px; margin:0 auto; padding: 15px 30px">
    <h1>PHP Frameworks Bench</h1>

    <script>
        <?php
        ini_set('display_errors', '1');
        ini_set('display_startup_errors', '1');
        error_reporting(E_ALL);

        $target = $_GET['t'] ?? null;

        $dataLabels = [];
        $dataRPS = [];
        $dataMemory = [];
        $dataTime = [];
        $dataFile = [];

        $dataCompRPS = [];
        $dataCompMemory = [];

        $data = [];

        $resultsDirs = glob("./output/*", GLOB_ONLYDIR);

        rsort($resultsDirs);

        $resultsDir = @$resultsDirs[0];

        if ($target !== null && file_exists('./output/' . $target)) {
            $resultsDir = './output/' . $target;
        }

        $resultsDatetime = "-";
        if (preg_match("/output\/(.*)/", @$resultsDir, $match)) {
            $resultsDatetime = @$match[1];
        }

        if (file_exists($resultsDir)) {
            Parse_Results: {
                require __DIR__ . '/libs/parse_results.php';
                $results = parse_results($resultsDir . '/results.log');
            }

            foreach ($results as $fw => $params) {
                $dataLabels[] = $fw;
                $dataRPS[] = $params['rps'];
                $dataMemory[] = $params['memory'];
                $dataTime[] = $params['time'];
                $dataFile[] = $params['file'];

                if (empty($resultsDirs[1]))
                    continue;

                if (!empty($results2[$fw])) {
                    $dataCompRPS[] = $results2[$fw]['rps'];
                    $dataCompMemory[] = $results2[$fw]['memory'];
                } else {
                    $dataCompRPS[] = 0;
                    $dataCompMemory[] = 0;
                }
            }
        }

        echo "
        const dataLabels = ['" . implode("','", $dataLabels) . "'];
        const dataRPS = [" . implode(",", $dataRPS) . "];
        const dataMemory = [" . implode(",", $dataMemory) . "];
        const dataTime = [" . implode(",", $dataTime) . "];
        const dataFile = [" . implode(",", $dataFile) . "];

        const resultsDatetime = '$resultsDatetime';
        ";
        ?>
    </script>

    <?php
    if (!file_exists($resultsDir ?? '')) {
    ?>
        <b>Results</b> not found!
        <ul style="list-style-type:decimal">
            <li>Run <b>bash setup.sh</b></li>
            <li>Run <b>bash check.sh</b></li>
            <li>Run <b>bash benchmark.sh</b></li>
        </ul>
    <?php
    } else {

        require __DIR__ . '/libs/common.php';
        echo "<h4>" .  dateNameChecker($resultsDatetime) . "</h4>";

        foreach ($resultsDirs as $res) {
            if (preg_match("/output\/(.*)/", @$res, $match)) {
                echo "<a href='index.php?t=" .  @$match[1] . "'>" . dateNameChecker(@$match[1]) . "</a> | ";
            }
        }
    ?>
        <br>
        <canvas id="rpsChart" height="125"></canvas>
        <br>
        <br>
        <canvas id="memoryChart" height="90"></canvas>
        <br>
        <canvas id="timeChart" height="90"></canvas>
        <br>
        <canvas id="fileChart" height="90"></canvas>
    <?php
    }
    ?>

    <ul>
        <?php
        $urlsLog = $resultsDir . '/urls.log';

        if (!file_exists($urlsLog)) {
            echo "File <i>$urlsLog</i> does not exists!";
        } else if (count($urls = file($urlsLog)) < 1) {
            echo "File <i>$urlsLog</i> is empty!";
        } else {
            foreach ($urls as $url) {
                $urlArray = explode('/', $url);
                $urlArray_ = array_slice($urlArray, 5);
                echo "<li><B>" . $urlArray[4] . ": </B><a href=\"$url\">/" . implode('/', $urlArray_) . "</a></li>";
            }
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