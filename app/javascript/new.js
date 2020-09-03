window.addEventListener('load', function(){
  console.log("test")
  const originalPrice = document.getElementById("item-price")
  originalPrice.addEventListener('input', function(){

  const itemPrice = document.getElementById("item-price").value;

  const fee = document.getElementById("add-tax-price")
  tax = itemPrice * 0.1;
  fee.innerHTML = tax
  fee.innerHTML = Math.round(fee.innerHTML);
  console.log(fee.innerHTML)

  const calculate = document.getElementById("profit")
  calculate.innerHTML = itemPrice - tax
  calculate.innerHTML = Math.round(calculate.innerHTML);
  console.log(calculate.innerHTML)
  })
})