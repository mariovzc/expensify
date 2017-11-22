$(document).on('turbolinks:load', function () {
  console.log('loading vals')
  $('#expense-form').validate({
    rules: {
      'date': {required: true},
      'amount': {number: true, required: true},
      'concept': {required: true},
      'transaction_type_id': {required: true},
      'category_id': {required: true}
    }
  })
})
