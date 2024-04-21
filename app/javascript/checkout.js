// This is your test publishable API key.
const stripe = Stripe("");

// The items the customer wants to buy
const items = [{ id: "xl-tshirt" }];

let elements;
let orderId;
let shipping = 300;

// initialize();
// checkStatus();

document.addEventListener("turbo:load", () => {
    console.log("Hello")
    var paymentForm = document.getElementById("payment-form");
    var infoForm = document.getElementById("info-form");
    var errorMessage = document.getElementById("error-message");
    var country = document.getElementById("country");
    var shippingDiv = document.getElementById("shipping");    
    var cartTotal = document.getElementById("cart-total");
    var cartValue = parseFloat(cartTotal.getAttribute("data"));    

    country.addEventListener('change', (e) => {
        var val = e.target.value;

        if (val == 'United Kingdom') {
          let grandTotal = (cartValue + 3).toFixed(2);
          shippingDiv.textContent = "£3.00"
          shipping = 300;
          cartTotal.textContent = `£${grandTotal}`
        }
        else {            
            let grandTotal = (cartValue + 4.5).toFixed(2); 
            shippingDiv.textContent = "£4.50"
            shipping = 450;
            cartTotal.textContent = `£${grandTotal}`
        }
    })

    paymentForm.style.display = "none";

    infoForm.addEventListener("submit", (e) => {
        e.preventDefault();
        var firstName = document.getElementById("first-name").value;
        var lastName = document.getElementById("last-name").value;
        var email = document.getElementById("email").value;
        var country = document.getElementById("country").value;
        var streetAddress = document.getElementById("street-address").value;
        var postCode = document.getElementById("post-code").value;

        if (firstName == "" || lastName == "" || email == "" || country == "" || streetAddress == "" || postCode == "") {
            errorMessage.style.display = "block"
        }
        else {
            var name = `${firstName} ${lastName}`;
            var address = `${streetAddress}, ${postCode} ${country}`;

            var formData = {
                name: name,
                email: email,
                address: address,
            }

            fetch(`/orders`, {
                method: 'POST',
                headers: { 
                    'Accept': 'application/json',
                    'Content-Type' : 'application/json', 
                    'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                },
                body: JSON.stringify(formData)
            })
            .then((res) => res.json())
            .then((data) => {
                orderId = data;
                initialize();
                checkStatus();            
                infoForm.style.display = "none";
                paymentForm.style.display = "block";
            })

        }
    })

    document
      .getElementById("payment-form")
      .addEventListener("submit", handleSubmit);
})

// Fetches a payment intent and captures the client secret
async function initialize() {    
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  const response = await fetch("/payment_intents", {
    method: "POST",
    headers: { 
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken
    },
    body: JSON.stringify({ shipping }),
  });

  const { clientSecret } = await response.json();  

  const appearance = {
    theme: 'flat',
    variables: {
      fontFamily: 'Verdana',
      fontLineHeight: '1.5',
      borderRadius: '0',
      colorBackground: '#fff',
      focusBoxShadow: 'none',      
      focusOutline: '-webkit-focus-ring-color auto 1px',
      tabIconSelectedColor: 'var(--colorText)'
    },
    rules: {
      '.Input, .CheckboxInput, .CodeInput': {
        transition: 'none',
        boxShadow: 'inset -1px -1px #ffffff, inset 1px 1px #0a0a0a, inset -2px -2px #dfdfdf, inset 2px 2px #808080'
      },
      '.Input': {
        padding: '12px'
      },
      '.Input--invalid': {
        color: '#DF1B41'
      },
      '.Tab, .Block, .PickerItem--selected': {
        backgroundColor: '#dfdfdf',
        boxShadow: 'inset -1px -1px #0a0a0a, inset 1px 1px #ffffff, inset -2px -2px #808080, inset 2px 2px #dfdfdf'
      },
      '.Tab': {
        transition: 'none'
      },
      '.Tab:hover': {
        backgroundColor: '#eee'
      },
      '.Tab--selected, .Tab--selected:focus, .Tab--selected:hover': {
        color: 'var(--colorText)',
        backgroundColor: '#ccc'
      },
      '.Tab:focus, .Tab--selected:focus': {
        boxShadow: 'inset -1px -1px #0a0a0a, inset 1px 1px #ffffff, inset -2px -2px #808080, inset 2px 2px #dfdfdf',
        outline: 'none'
      },
      '.Tab:focus-visible': {
        outline: 'var(--focusOutline)'
      },
      '.PickerItem': {
        backgroundColor: '#dfdfdf',
        boxShadow: 'inset -1px -1px #0a0a0a, inset 1px 1px #ffffff, inset -2px -2px #808080, inset 2px 2px #dfdfdf',
        transition: 'none'
      },
      '.PickerItem:hover': {
        backgroundColor: '#eee'
      },
      '.PickerItem--highlight': {
        outline: '1px solid blue'
      },
      '.PickerItem--selected:hover': {
        backgroundColor: '#dfdfdf'
      }
    }
  };

  elements = stripe.elements({ appearance, clientSecret });  

  const paymentElementOptions = {
    layout: "tabs",
  };

  const paymentElement = elements.create("payment", paymentElementOptions);  

  paymentElement.mount("#payment-element");
}

async function handleSubmit(e) {
  e.preventDefault();
  setLoading(true);

  const { error } = await stripe.confirmPayment({    
    elements,
    confirmParams: {
      // Make sure to change this to your payment completion page
      return_url: `http://localhost:3000/orders/${orderId}`,
    },
  });

  // This point will only be reached if there is an immediate error when
  // confirming the payment. Otherwise, your customer will be redirected to
  // your `return_url`. For some payment methods like iDEAL, your customer will
  // be redirected to an intermediate site first to authorize the payment, then
  // redirected to the `return_url`.
  if (error.type === "card_error" || error.type === "validation_error") {
    showMessage(error.message);
  } else {
    showMessage("An unexpected error occurred.");
  }

  setLoading(false);
}

// Fetches the payment intent status after payment submission
async function checkStatus() {
  const clientSecret = new URLSearchParams(window.location.search).get(
    "payment_intent_client_secret"
  );

  if (!clientSecret) {
    return;
  }

  const { paymentIntent } = await stripe.retrievePaymentIntent(clientSecret);

  switch (paymentIntent.status) {
    case "succeeded":
      showMessage("Payment succeeded!");
      break;
    case "processing":
      showMessage("Your payment is processing.");
      break;
    case "requires_payment_method":
      showMessage("Your payment was not successful, please try again.");
      break;
    default:
      showMessage("Something went wrong.");
      break;
  }
}

// ------- UI helpers -------

function showMessage(messageText) {
  const messageContainer = document.querySelector("#payment-message");

  messageContainer.classList.remove("hidden");
  messageContainer.textContent = messageText;

  setTimeout(function () {
    messageContainer.classList.add("hidden");
    messageContainer.textContent = "";
  }, 4000);
}

// Show a spinner on payment submission
function setLoading(isLoading) {
  if (isLoading) {
    // Disable the button and show a spinner
    document.querySelector("#submit").disabled = true;
    document.querySelector("#spinner").classList.remove("hidden");
    document.querySelector("#button-text").classList.add("hidden");
  } else {
    document.querySelector("#submit").disabled = false;
    document.querySelector("#spinner").classList.add("hidden");
    document.querySelector("#button-text").classList.remove("hidden");
  }
}