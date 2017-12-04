$(document).on('turbolinks:load', function () {
  $('.header-link').click(function () {
    localStorage.removeItem('date_selected')
  })
  let charts = new Charts()
  charts.categoryData()
})
class Charts {
  chartByCategory (data) {
    let options = {
      responsive: true,
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
    let ctx = document.getElementById('byCategoryChar')// .getContext('2d')
    let myDoughnutChart = new Chart (ctx, {
      type: 'doughnut',
      data: d,
      options: options
    })
  }
  categoryData () {
    fetch('/chart/categories.json')
    .then(response => response.json())
    .then(json => this.chartByCategory(json.categories))
    return 1
  }
}

let formatter = new Intl.NumberFormat('es-CO', {
  style: 'currency',
  currency: 'COP',
  minimumFractionDigits: 2
  // the default value for minimumFractionDigits depends on the currency
  // and is usually already 2
})
