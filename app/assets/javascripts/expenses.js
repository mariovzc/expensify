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
  $('.delete-btn').click(function () {
    let id = $(this).val()
    swal.queue([{
      title: 'Eliminar',
      confirmButtonText: 'ok :-(',
      cancelButtonText: 'Cancelar',
      showCancelButton: true,
      cancelButtonClass: 'btn btn-danger',
      buttonsStyling: false,
      text: '¿Estas seguro de que deseas eliminar el gasto?',
      showLoaderOnConfirm: true,
      preConfirm: function () {
        $.ajax({
          url: '/api/v1/expenses/' + id,
          method: 'DELETE'
        }).done(function () {
          document.location.reload()
        })
      }
    }])
  })
  $('.edit-btn').click(function () {
  })
})
