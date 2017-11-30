$(document).on('turbolinks:load', function () {
  $('.header-link').click(function () {
    localStorage.removeItem('date_selected')
  })
})
