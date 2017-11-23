$(document).on('turbolinks:load', () => {
  console.log('loading vals') 
  $('#expense-form').validate({
    rules: {
      'date': {required: true},
      'amount': {number: true, required: true},
      'concept': {required: true},
      'transaction_type_id': {required: true},
      'category_id': {required: true}
    },
    submitHandler: () => {
      let formData = $('#expense-form').serializeArray() // store json object
      let obj = {}
      formData.forEach(element => {
        obj[element['name']] = element['value']
      })
      console.log(obj)
      $.ajax({
        type: 'POST',
        url: '/api/v1/expenses',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify(obj),
        success: function () {
          swal({
            title: 'Gasto Guardado',
            type: 'success',
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'OK'
          }).then(function (result) {
            document.location.reload()            
          })
        }
      })
    }
  })
  $('.delete-btn').click(() => {
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
  $('.edit-btn').click(() => {
  })
})
