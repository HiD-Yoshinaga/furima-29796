function calculation (){

  const priceContent = document.getElementById("item-price")
  priceContent.addEventListener("keyup", () => {
    const price = priceContent.value;
    const tax = Math.floor(price * 0.1)
    const profit = price - tax
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${tax.toLocaleString()}`;
    const Profit = document.getElementById("profit");
    Profit.innerHTML = `${profit.toLocaleString()}`;
  });
}

window.addEventListener('keyup', calculation);