const price = function () {
  const itemPrice = document.getElementById("item-price");
  const itemTax = document.getElementById("add-tax-price");
  const itemProfit = document.getElementById("profit");

  itemPrice.addEventListener("input", function(){

    const price = parseFloat(itemPrice.value);
    if (!isNaN(price)) {
    const tax = price * 0.1;
    const floorTax = Math.floor(tax);
    itemTax.innerHTML = floorTax;
    const total = price - floorTax;
    const floorTotal = Math.floor(total);
    itemProfit.innerHTML = floorTotal;
  }else{
    itemTax.innerHTML = 0;
    itemProfit.innerHTML = 0;
  }
  });
}

window.addEventListener("load", price);