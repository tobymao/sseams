var orders = {
  submit: function() {
    var card = {
      number:   document.getElementById('number').value,
      expMonth: document.getElementById('month').value,
      expYear:  document.getElementById('year').value,
      cvc:      document.getElementById('cvv').value
    };

    console.log(card)

    Stripe.createToken(card, function(status, response) {
      if (status === 200) {
        console.log("COMING HERE SUCCESS");
        console.log(response);
        document.getElementById('order_form').submit();
      } else {
        console.log("COMING HERE FAIL");
        console.log(response);
        //$("#stripe-error-message").text(response.error.message);
        //$("#credit-card-errors").show();
        //$("#user_submit").attr("disabled", false);
      }
    });

    return false;
  }
};
