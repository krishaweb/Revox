$(document).on 'ajax:before', '#form_user', (e, res)->
  $(".add_user_loader").show()

$(document).on 'ajax:complete', '#form_user', (e, res)->
  if res.status == 422
  	if res.responseJSON && res.responseJSON['fname']
  		$('span#fname_error').html res.responseJSON['fname'][0]
  	else
  		$('span#fname_error').html ' '
  	if res.responseJSON && res.responseJSON['lname']
  		$('span#lname_error').html res.responseJSON['lname'][0]
  	else
  		$('span#lname_error').html ' '
  	if res.responseJSON && res.responseJSON['email']
  		$('span#email_error').html res.responseJSON['email'][0]
  	else
  		$('span#email_error').html ' '
  	if res.responseJSON && res.responseJSON['password']	
  		$('span#password_error').html res.responseJSON['password'][0]
  	else
  		$('span#password_error').html ' '
  	if res.responseJSON && res.responseJSON['password_confirmation']	
  		$('span#password_confirmation_error').html res.responseJSON['password_confirmation'][0]
  	else
  		$('span#password_confirmation_error').html ' '
    if res.responseJSON['image']
      $('span#image_error').html res.responseJSON['image']
    else
      $('span#image_error').html ' '
    $(".add_user_loader").hide()
  else if res.status == 201
    $(".add_user_loader").hide()
    $('#user_fname').val ''
    $('span#fname_error').html ' '
    $('#user_lname').val ''
    $('span#lname_error').html ' '
    $('#user_email').val ''
    $('span#email_error').html ' '
    $('#user_password').val ''
    $('span#password_error').html ' '
    $('#user_password_confirmation').val ''
    $('span#password_confirmation_error').html ' '
    $('.form-user').hide()
    $('#user-success').show()
  else if res.status == 200
    $(".add_user_loader").hide()
    $('#user_fname').val ''
    $('span#fname_error').html ' '
    $('#user_lname').val ''
    $('span#lname_error').html ' '
    $('#user_email').val ''
    $('span#email_error').html ' '
    $('#user_password').val ''
    $('span#password_error').html ' '
    $('#user_password_confirmation').val ''
    $('span#password_confirmation_error').html ' '
    $('.form-user').hide()
    $('#user-success').show()
  else


