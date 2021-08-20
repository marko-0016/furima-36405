window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

    const profitNumber = document.getElementById("profit")
    profitNumber.innerHTML = Math.floor(inputValue * 0.9);
    
  })
});



// 以下を入力するとターミナルに出力できるが可読性下げるため消している
    // console.log(inputValue);
    // console.log(addTaxDom);
    // console.log(profitNumber);
