const pay = () => {
  const payjp = Payjp("<%= ENV['PAYJP_PUBLIC_KEY'] %>");
  
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    e.preventDefault(); 

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        alert(response.error.message); 
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");

        const existingTokenInput = document.querySelector('input[name="token"]');
        if (existingTokenInput) existingTokenInput.remove();

        const tokenInput = document.createElement('input');
        tokenInput.setAttribute('type', 'hidden');
        tokenInput.setAttribute('name', 'token');
        tokenInput.setAttribute('value', token);
        renderDom.appendChild(tokenInput);

        renderDom.submit();
      }
    });
  });
};

window.addEventListener("load", pay);
