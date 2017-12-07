'use strict';

$(document).on('turbolinks:load', function () {
  $('.header-link').click(function () {
    localStorage.removeItem('date_selected');
  });
  if (window.location.href.toString().split(window.location.host)[1] === '/') {
    var charts = new Charts();
    charts.start();
  }
});
function Charts() {
  var x = this;
  x.start = function () {
    this.categoryData();
    this.lastsSixMonths();
    this.byDayMonthly();
    this.accumulatedData();
  };
  x.categoryData = function () {
    $.get('/chart/categories', function (data) {
      x.chartByCategory(data.categories);
    });
  };
  x.byDayMonthly = function () {
    $.get('/chart/monthly', function (data) {
      x.chartByDayMonthly(data.data);
    });
  };
  x.lastsSixMonths = function () {
    $.get('/chart/transaction', function (data) {
      x.chartLast6Months(data.data);
    });
  };
  x.accumulatedData = function () {
    $.get('/chart/accumulated', function (data) {
      x.chartAccumulated(data.data);
    });
  };
  x.chartByCategory = function (data) {
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
            return formatter.format(data.datasets[0].data[tooltipItems.index]);
          }
        }
      }
    };
    var d = {
      datasets: [{
        data: data.values,
        backgroundColor: data.backgroundColors
      }],
      // These labels appear in the legend and in the tooltips when hovering different arcs
      labels: data.labels
    };
    var ctx = document.getElementById('byCategoryChart'); // .getContext('2d')
    var myDoughnutChart = new Chart(ctx, {
      type: 'doughnut',
      data: d,
      options: options
    });
  };

  x.chartLast6Months = function (data) {
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
    };
    var ctx = document.getElementById('lastSixMonthsChart'); // .getContext('2d')
    var myBarChart = new Chart(ctx, {
      type: 'bar',
      data: data,
      options: options
    });
  };
  x.chartByDayMonthly = function (data) {
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
    };
    var ctx = document.getElementById('byDayChart'); // .getContext('2d')
    var myBarChart = new Chart(ctx, {
      type: 'bar',
      data: data,
      options: options
    });
  };
  x.chartAccumulated = function (data) {
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
    };
    var ctx = document.getElementById('accumulatedChart'); // .getContext('2d')
    var myLinesChart = new Chart(ctx, {
      type: 'line',
      data: data,
      options: options
    });
  };
}

var formatter = new Intl.NumberFormat('es-CO', {
  style: 'currency',
  currency: 'COP',
  minimumFractionDigits: 2
  // the default value for minimumFractionDigits depends on the currency
  // and is usually already 2
});