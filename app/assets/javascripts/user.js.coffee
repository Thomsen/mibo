# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

valid = () ->
  
  errorPlace = (error, element) ->
    error.appendTo(element.parent().next());
  
  succ = (label) ->
    label.html("&nbsp;").addClass("checked");

  handler = (form) ->
    form.submit();
    
  signupform = () ->
    rules:
      "user[username]":
        required: true,
  
      "user[email]":
        required: true,
        email:    true,

      "user[form_password]":
        required: true,
        
      "user[password_confirm]": 
        required: true,

    messages:
      "user[username]":
        required: "username is null"

    errorPlacement: errorPlace

    success: succ

    submitHandler: handler
                    
  $("#signupform").validate(signupform);
  
$(document).ready(valid);
