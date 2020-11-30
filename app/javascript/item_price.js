function item_price() {
  
  const itemPrice = document.getElementById("item-price");
  
  itemPrice.addEventListener("input", () => {
    const itemPrice = document.getElementById("item-price");
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const itemPriceValue = itemPrice.value;
    addTaxPrice.innerHTML = Math.floor(itemPriceValue * 0.1);
    profit.innerHTML = Math.floor(itemPriceValue * 0.9);
  });
}

window.addEventListener('load', item_price);