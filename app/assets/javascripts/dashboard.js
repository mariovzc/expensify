'use strict'
$(document).on('turbolinks:load', function () {
  $('.header-link').click(function () {
    localStorage.removeItem('date_selected')
  })
  if (window.location.href.toString().split(window.location.host)[1] === '/') {
    var charts = new Charts()
  }
})

var _createClass = function () { function defineProperties(target, props) { for (var i = 0 i < props.length i++) { var descriptor = props[i] descriptor.enumerable = descriptor.enumerable || false descriptor.configurable = true if ("value" in descriptor) descriptor.writable = true Object.defineProperty(target, descriptor.key, descriptor) } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps) if (staticProps) defineProperties(Constructor, staticProps) return Constructor } }()

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function") } }

var Charts = function () {
  function Charts() {
    _classCallCheck(this, Charts)

    this.categoryData()
    this.lastsSixMonths()
    this.byDayMonthly()
    this.accumulatedData()
  }

  _createClass(Charts, [{
    key: 'categoryData',
    value: function categoryData() {
      var _this = this

      fetch('/chart/categories').then(function (response) {
        return response.json()
      }).then(function (json) {
        return _this.chartByCategory(json.categories)
      })
    }
  }, {
    key: 'byDayMonthly',
    value: function byDayMonthly() {
      var _this2 = this

      fetch('/chart/monthly').then(function (response) {
        return response.json()
      }).then(function (json) {
        return _this2.chartByDayMonthly(json.data)
      })
    }
  }, {
    key: 'lastsSixMonths',
    value: function lastsSixMonths() {
      var _this3 = this

      fetch('/chart/transaction').then(function (response) {
        return response.json()
      }).then(function (json) {
        return _this3.chartLast6Months(json.data)
      })
    }
  }, {
    key: 'accumulatedData',
    value: function accumulatedData() {
      var _this4 = this

      fetch('/chart/accumulated').then(function (response) {
        return response.json()
      }).then(function (json) {
        return _this4.chartAccumulated(json.data)
      })
    }
  }, {
    key: 'chartByCategory',
    value: function chartByCategory(data) {
      var options = {
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
            label: function label(tooltipItems, data) {
              return formatter.format(data.datasets[0].data[tooltipItems.index])
            }
          }
        }
      }
      var d = {
        datasets: [{
          data: data.values,
          backgroundColor: data.backgroundColors
        }],
        // These labels appear in the legend and in the tooltips when hovering different arcs
        labels: data.labels
      }
      var ctx = document.getElementById('byCategoryChart') // .getContext('2d')
      var myDoughnutChart = new Chart(ctx, {
        type: 'doughnut',
        data: d,
        options: options
      })
    }
  }, {
    key: 'chartLast6Months',
    value: function chartLast6Months(data) {
      var options = {
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
      var ctx = document.getElementById('lastSixMonthsChart') // .getContext('2d')
      var myBarChart = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: options
      })
    }
  }, {
    key: 'chartByDayMonthly',
    value: function chartByDayMonthly(data) {
      var options = {
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
      var ctx = document.getElementById('byDayChart') // .getContext('2d')
      var myBarChart = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: options
      })
    }
  }, {
    key: 'chartAccumulated',
    value: function chartAccumulated(data) {
      var options = {
        tooltips: {
          mode: 'index',
          intersect: false
        },
        responsive: true,
        maintainAspectRatio: false,
        animation: {
          animateScale: true,
          animateRotate: true
        }
      }
      var ctx = document.getElementById('accumulatedChart') // .getContext('2d')
      var myLinesChart = new Chart(ctx, {
        type: 'line',
        data: data,
        options: options
      })
    }
  }])

  return Charts
}()

var formatter = new Intl.NumberFormat('es-CO', {
  style: 'currency',
  currency: 'COP',
  minimumFractionDigits: 2
  // the default value for minimumFractionDigits depends on the currency
  // and is usually already 2
})
