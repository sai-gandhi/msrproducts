<!DOCTYPE html>
<html>
<head>
  <title>Yearly Product Sales</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    body {
      font-family: "Poppins", sans-serif;
      background-color: #fafafa;
      text-align: center;
      padding: 40px;
    }
    h2 {
      color: #2c3e50;
      font-size: 28px;
      margin-bottom: 5px;
    }
    #chartContainer {
      width: 75%;
      margin: 0 auto;
    }
    select {
      margin-bottom: 20px;
      padding: 5px 10px;
      font-size: 16px;
    }
  </style>
</head>
<body>

  <h2>📦 Yearly Product Sales Report</h2>
  <p>Select a year to view total products sold:</p>

  <select id="yearSelect">
    <option value="2025">2025</option>
    <option value="2024">2024</option>
    <option value="2023">2023</option>
  </select>

  <div id="chartContainer">
    <canvas id="salesChart"></canvas>
  </div>

  <script>
    const ctx = document.getElementById('salesChart').getContext('2d');
    let salesChart;

    function loadChart(year) {
      fetch(`/sales/yearly?year=${year}`)
        .then(res => res.json())
        .then(data => {
          const labels = data.map(item => item.product);
          const values = data.map(item => item.totalSold);

          if (salesChart) salesChart.destroy();

          salesChart = new Chart(ctx, {
            type: 'bar',
            data: {
              labels: labels,
              datasets: [{
                label: 'Total Units Sold',
                data: values,
                backgroundColor: [
                  '#4C6EF5', '#6C63FF', '#FF6B6B', '#FFB703', '#219EBC', '#8ECAE6'
                ],
                borderRadius: 8
              }]
            },
            options: {
              indexAxis: 'y',
              responsive: true,
              plugins: {
                legend: { display: false },
                title: {
                  display: false
                },
                tooltip: {
                  callbacks: {
                    label: context => `${context.parsed.x} units sold`
                  }
                }
              },
              scales: {
                x: {
                  beginAtZero: true,
                  title: {
                    display: true,
                    text: 'Units Sold',
                    color: '#555'
                  },
                  grid: { display: false }
                },
                y: { grid: { display: false } }
              }
            }
          });
        })
        .catch(err => console.error("Error fetching data:", err));
    }

    // Initial load for current year
    const currentYear = new Date().getFullYear();
    document.getElementById("yearSelect").value = currentYear;
    loadChart(currentYear);

    // Reload when user changes year
    document.getElementById("yearSelect").addEventListener("change", (e) => {
      loadChart(e.target.value);
    });
  </script>

</body>
</html>
