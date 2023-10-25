const pay = () => {
  const payjp = Payjp('pk_test_b4d207393bb6d93eafdfe9a2')
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#card-number');
  expiryElement.mount('#card-exp-month', '#card-exp-year');
  cvcElement.mount('#card-cvc');

  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        console.log(token);
    //     const renderDom = document.getElementById("charge-form");
    //     const tokenObj = `<input value=${token} name='token' type="hidden">`;
    //     renderDom.insertAdjacentHTML("beforeend", tokenObj);
    //     }
    //     numberElement.clear();
    //     expiryElement.clear();
    //     cvcElement.clear();
    //     document.getElementById("charge-form").submit();
      }
    });
  });
};

window.addEventListener("load", pay);

