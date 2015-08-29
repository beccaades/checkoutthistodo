$(function(){
  $("form").on("submit", function(e){
    e.preventDefault();
    var $form = $(this);

    // What needs to happen?
    // Send the info to the create method.
    
    // we need the form data
    var data = $form.serialize();
    var url = $form.attr("action");

    var method_input = $("input[name=_method]", $form)[0];
    
    if (method_input){
      var method = $(method_input).attr("value")
    } else {
      var method = $form.attr("method")  
    }


    $.ajax({
      data: data,
      url: url,
      method: method,
      dataType: "script"
    });

     // but also i should look at the _method input
    // we need an ajax request
      // we need the url/method of that request

    // insert the new list we just made into the DOM
  });  
});