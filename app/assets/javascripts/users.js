$(document).ready(function() {

	// máscaras
  $(".phone").mask("(99) 9999-9999?9");
  $(".celphone").mask("(99) 99999-999?9");
  $(".cep").mask("99.999-999");
  $(".cpf").mask("999.999.999-99");

  $(".date_filter").datepicker({
    format: "dd/mm/yyyy",
    language: "pt-BR",
    autoclose: true,
    todayHighlight: true
  });

  // busca o CEP
  $('#user_zip_code').blur(function(event) {
    cep = $(this).val();
    $.getJSON(
      '/busca_cep',
      {cep: cep},
      function(data){
        $('#user_street').val(data.address.address);
        $('#user_district').val(data.address.neighborhood);

        var selectState = data.address.state
        $("#user_state_id").find("option").filter(function(index) {
            return selectState === $(this).text();
        }).prop("selected", "selected");

        var selectCity = data.address.city;
        $("#user_city_id").find("option").filter(function(index) {
            return selectCity === $(this).text();
        }).prop("selected", "selected");
      }
    );
  });

});