/*
    PHP-Frameworks-Bench
 */

const COLORS_ = [
  "#3273a8",
  "#3a78ac",
  "#437cae",
  "#4c80af",
  "#5483b0",
  "#5d86af",
  "#6588ad",
  "#6d8aaa",
  "#758ba6",
  "#7d8ca1",
  "#848c9b",
  "#8a8c94",
  "#908b8b",
  "#968a82",
  "#9a8878",
  "#9f866c",
  "#a28360",
  "#a57f52",
  "#a77b43",
  "#a87732",
];

// For more colors 
// I'm lazy to regenerate them again
// so lets have a map to make more
let COLORS = dataRPS.map(
  (item, index) =>
    COLORS_[Math.round(index / (dataRPS.length / COLORS_.length))]
);

var rpsChart = document.getElementById("rpsChart");
var memoryChart = document.getElementById("memoryChart");
var timeChart = document.getElementById("timeChart");
var fileChart = document.getElementById("fileChart");

new Chart(rpsChart, {
  type: "bar",
  options: {
    plugins: {
      title: {
        display: true,
        text: 'Requests Per Second (RPS)'
      },
    }
  },
  data: {
    labels: dataLabels,
    datasets: [
      {
        label: resultsDatetime,
        data: dataRPS,
        backgroundColor: COLORS,
      },
    ],
  },
});

new Chart(memoryChart, {
  type: "bar",
  options: {
    plugins: {
      title: {
        display: true,
        text: 'Memory Peak (MB)'
      },
    }
  },
  data: {
    labels: dataLabels,
    datasets: [
      {
        label: resultsDatetime,
        data: dataMemory,
        backgroundColor: COLORS,
      },
    ],
  },
});

new Chart(timeChart, {
  type: "bar",
  options: {
    plugins: {
      title: {
        display: true,
        text: 'Execution Time (ms)'
      },
    }
  },
  data: {
    labels: dataLabels,
    datasets: [
      {
        label: resultsDatetime,
        data: dataTime,
        backgroundColor: COLORS,
      },
    ],
  },
});

new Chart(fileChart, {
  type: "bar",
  options: {
    plugins: {
      title: {
        display: true,
        text: 'Included Files'
      },
    }
  },
  data: {
    labels: dataLabels,
    datasets: [
      {
        label: resultsDatetime,
        data: dataFile,
        backgroundColor: COLORS,
      },
    ],
  },
});
