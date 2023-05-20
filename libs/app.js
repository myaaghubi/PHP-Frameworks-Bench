const COLORS = [
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

var rpsChart = document.getElementById('rpsChart');
var memoryChart = document.getElementById('memoryChart');
var timeChart = document.getElementById('timeChart');
var fileChart = document.getElementById('fileChart');
new Chart(rpsChart, {
  type: "bar",
  data: {
    labels: dataLabels,
    datasets: [
      {
        label: "Requests Per Second (RPS)",
        data: dataRPS,
        backgroundColor: COLORS,
      },
    ],
  },
});

new Chart(memoryChart, {
  type: "bar",
  data: {
    labels: dataLabels,
    datasets: [
      {
        label: "Memory Peak (MB)",
        data: dataMemory,
        backgroundColor: COLORS,
      },
    ],
  },
});

new Chart(timeChart, {
  type: "bar",
  data: {
    labels: dataLabels,
    datasets: [
      {
        label: "Execution Time (ms)",
        data: dataTime,
        backgroundColor: COLORS,
      },
    ],
  },
});

new Chart(fileChart, {
  type: "bar",
  data: {
    labels: dataLabels,
    datasets: [
      {
        label: "Included Files",
        data: dataFile,
        backgroundColor: COLORS,
      },
    ],
  },
});
