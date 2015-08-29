$(function(){
  $("form").on("submit",(function(e){
    e.preventDefault();
    var $form = $(this);

    var data = $form.serialize();
    var url = $form.attr("action");

    var method_input = $("input[name=_method]", $form)[0];

    if (method_input){
      var method = $(method_input).attr("value") 
    } else {
      var method = $form.attr("method")
    }

    //var name = $(this).find("#list_name").val();
    

    $.ajax({
      method: method,
      url: url,
      data: data,
      //this line makes the response form JS and not html
      dataType: 'script'
    });
  });
});