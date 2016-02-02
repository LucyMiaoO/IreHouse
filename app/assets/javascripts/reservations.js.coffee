jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  payment.setupForm()

payment =
  setupForm: ->
    $('#new_reservation').submit ->
      $('input[type=submit]').attr('disabled', true)
      Stripe.card.createToken($('#new_reservation'), payment.handleStripeResponse)
      false

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#new_reservation').append($('<input type="hidden" name="stripeToken" />').val(response.id))
      $('#new_reservation')[0].submit()
    else
      $('#stripe_error').text(response.error.message).show()
      $('input[type=submit]').attr('disabled', false)