// DISTRICT99 - Global JS
document.addEventListener('DOMContentLoaded',()=>{
  // quantity
  document.querySelectorAll('.qty').forEach(qty=>{
    const input=qty.querySelector('input');
    qty.querySelectorAll('button').forEach(btn=>{
      btn.addEventListener('click',()=>{
        let v=parseInt(input.value||1);
        if(btn.dataset.dir==='minus') v=Math.max(1,v-1);
        else v=v+1;
        input.value=v;
        input.dispatchEvent(new Event('change',{bubbles:true}));
      });
    });
  });
  // cart drawer placeholder
  const cartBtn=document.querySelector('[data-cart-toggle]');
  if(cartBtn) cartBtn.addEventListener('click',()=>alert('Cart drawer - اربطه ب Shopify AJAX API'));
});
