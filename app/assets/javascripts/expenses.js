'use strict';

$(document).on('turbolinks:load', function () {
  var hiddenDate = localStorage.getItem('date_selected');
  if (hiddenDate != null) {
    $('#month_selector').val(hiddenDate);
  }
  $('#expense-form').validate({
    rules: {
      'date': { required: true },
      'amount': { number: true, required: true },
      'concept': { required: true },
      'transaction_type_id': { required: true },
      'category_id': { required: true }
    },
    submitHandler: function submitHandler() {
      var formData = $('#expense-form').serializeArray(); // store json object
      var obj = {};
      formData.forEach(function (element) {
        obj[element['name']] = element['value'];
      });
      console.log(obj);
      $.ajax({
        type: 'POST',
        url: '/api/v1/expenses',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify(obj),
        success: function success() {
          swal({
            title: 'Gasto Guardado',
            type: 'success',
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'OK'
          }).then(function (result) {
            document.location.reload();
          });
        }
      });
    }
  });
  $('.delete-btn').click(function () {
    var id = $(this).val();
    swal.queue([{
      title: 'Eliminar',
      confirmButtonText: 'ok :-(',
      cancelButtonText: 'Cancelar',
      showCancelButton: true,
      confirmButtonClass: 'btn btn-primary',
      cancelButtonClass: 'btn btn-danger',
      buttonsStyling: false,
      text: '¿Estas seguro de que deseas eliminar el gasto?',
      preConfirm: function preConfirm() {
        $.ajax({
          url: '/api/v1/expenses/' + id,
          method: 'DELETE'
        }).done(function () {
          document.location.reload();
        });
      }
    }]);
  });
  $('.edit-btn').click(function () {
    var id = $(this).val();
    var obj = [];
    $.ajax({
      url: '/expenses/' + id + '.json',
      method: 'GET'
    }).done(function (data) {
      $('#edit-expense-form #expense_id').val(data.id);
      $('#edit-expense-form #concept').val(data.concept);
      $('#edit-expense-form #date').val(data.date);
      $('#edit-expense-form #amount').val(data.amount);
      $('#edit-expense-form #transaction_type_id').val(data.transaction_type_id);
      $('#edit-expense-form #category_id').val(data.category_id);
      $('#edit-expenses-modal').modal('show');
      $('#edit-expense-form').validate({
        rules: {
          'date': { required: true },
          'amount': { number: true, required: true },
          'concept': { required: true },
          'transaction_type_id': { required: true },
          'category_id': { required: true }
        },
        submitHandler: function submitHandler() {
          var formData = $('#edit-expense-form').serializeArray(); // store json object
          var obj = {};
          formData.forEach(function (element) {
            obj[element['name']] = element['value'];
          });
          $.ajax({
            type: 'PUT',
            url: '/api/v1/expenses/' + obj.id,
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(obj),
            success: function success() {
              swal({
                title: 'Gasto Editado',
                type: 'success',
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'OK'
              }).then(function (result) {
                document.location.reload();
              });
            }
          });
        }
      });
    });
  });

  $('.checkbox').change(function () {
    if (this.checked) {
      setParams();
    }
  });

  $('.select').change(function (e) {
    setParams();
  });

  function setParams() {
    var checks = $('.checkbox:checked').map(function () {
      return { name: this.name, value: this.value };
    }).get();
    var date = new Date();
    var dateSelector = $('#month_selector').val();
    dateSelector = dateSelector.split('-');
    date.setFullYear(dateSelector[0], dateSelector[1] - 1, dateSelector[2]);
    localStorage.setItem('date_selected', $('#month_selector').val());
    window.location.href = '/expenses?utf8=✓&month=' + (date.getMonth() + 1) + '&year=' + date.getFullYear() + '&' + checks[0].name + '=' + checks[0].value + '&' + checks[1].name + '=' + checks[1].value;
    // window.location.href = `/expenses?utf8=✓&month=${date.getMonth() + 1}&year=${date.getFullYear()}&${checks[0].name}=${checks[0].value}&${checks[1].name}=${checks[1].value}`
  }
});