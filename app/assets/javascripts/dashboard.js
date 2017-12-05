$(document).on('turbolinks:load', function () {
  $('.header-link').click(function () {
    localStorage.removeItem('date_selected')
  })
  let charts = new Charts()
  charts.categoryData()
  charts.lastsSixMonths()
})
class Charts {
  chartByCategory (data) {
    let options = {
      responsive: true,
      maintainAspectRatio: false,
      animation: {
        animateScale: true,
        animateRotate: true
      },
      pieceLabel: {
        fontColor: '#FFF'
      },
      tooltips: {
        enabled: true,
        mode: 'single',
        callbacks: {
          label: function (tooltipItems, data) {
            return formatter.format(data.datasets[0].data[tooltipItems.index])
          }
        }
      }
    }
    let d = {
      datasets: [{
        data: data.values,
        backgroundColor: data.backgroundColors
      }],
      // These labels appear in the legend and in the tooltips when hovering different arcs
      labels: data.labels
    }
    let ctx = document.getElementById('byCategoryChart')// .getContext('2d')
    let myDoughnutChart = new Chart (ctx, {
      type: 'doughnut',
      data: d,
      options: options
    })
  }
  categoryData () {
    fetch('/chart/categories')
    .then(response => response.json())
    .then(json => this.chartByCategory(json.categories))
  }
  lastsSixMonths () {
    fetch('/chart/transaction')
    .then(response => response.json())
    .then(json => this.chartLast6Months(json.data))
  }
  chartLast6Months (data) {
    let options = {
      responsive: true,
      maintainAspectRatio: false,
      animation: {
        animateScale: true,
        animateRotate: true
      },
      tooltips: {
        mode: 'index',
        intersect: false
      },
      scales: {
        xAxes: [{
          stacked: true
        }],
        yAxes: [{
          stacked: true
        }]
      }
    }
    let ctx = document.getElementById('lastSixMonths')// .getContext('2d')
    let myBarChart = new Chart (ctx, {
      type: 'bar',
      data: data,
      options: options
    })
  }
}

let formatter = new Intl.NumberFormat('es-CO', {
  style: 'currency',
  currency: 'COP',
  minimumFractionDigits: 2
  // the default value for minimumFractionDigits depends on the currency
  // and is usually already 2
})
