window.Select2 = {
  initialize: function() {
    var seletedValue = $(".select2").attr('selected_value');
    if(seletedValue && seletedValue != '') {
      seletedValue.forEach(value => {
      var $newOption = $("<option selected='selected'></option>").val(value).text(value)
        $(".select2").append($newOption).trigger('change');
      });
    }
    $('.select2').select2();
  }
}