$('#form_user').bind 'ajax:complete', (e, res)->
  if res.status == 422
  	if res.responseJSON['fname']
  		$('span#fname_error').html res.responseJSON['fname'][0]
  	else
  		$('span#fname_error').html ' '
  	if res.responseJSON['lname']
  		$('span#lname_error').html res.responseJSON['lname'][0]
  	else
  		$('span#lname_error').html ' '
  	if res.responseJSON['email']
  		$('span#email_error').html res.responseJSON['email'][0]
  	else
  		$('span#email_error').html ' '
  	if res.responseJSON['password']	
  		$('span#password_error').html res.responseJSON['password'][0]
  	else
  		$('span#password_error').html ' '
  	if res.responseJSON['password_confirmation']	
  		$('span#password_confirmation_error').html res.responseJSON['password_confirmation'][0]
  	else
  		$('span#password_confirmation_error').html ' '
  else if res.status == 201
    alert "Thankyou for subscribing to our newsletter."
    $('#user_fname').val ''
    $('#user_lname').val ''
    $('#user_email').val ''
    $('#user_password').val ''
    $('#user_password_confirmation').val ''
  else
    alert "unknown error"