document.addEventListener('turbo:load', function () {
    var cartItems = document.getElementById('cart-items');
    
    cartItems.addEventListener('click', (e) => {        
        if (e.target.id == 'delete-button') {            
            var zineIdDelete = e.target.getAttribute('data-id');
            var zineToRemove = document.getElementById(`zine-${zineIdDelete}`);                   
              
            cartItems.removeChild(zineToRemove);

            fetch(`/remove_from_cart/${zineIdDelete}`, {
                method: 'DELETE',
                headers: { 
                    'Content-Type' : 'application/json', 
                    'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content') 
                }
            })         
        }
    })
})