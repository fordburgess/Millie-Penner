document.addEventListener('turbo:load', function () {
    var addButton = document.getElementById('add-to-cart-button');
    var zineId = addButton.getAttribute('data-zine-id');
    var cartItems = document.getElementById('cart-items');    

    addButton.addEventListener('click', () => {        
        fetch(`/zines/ajax/${zineId}`, {
            method: 'GET',
            headers: { 'Content-Type' : 'application/json' }
        })
        .then((res) => {
            if (res.ok) {                
                return res.json()
            }
            else {
                throw new Error("error")
            }
        })
        .then((data) => {
            var zine = data.zine;
            var coverImage = data.cover_image            

            var newElement = document.createElement("div");
            var newElementContent = `
                <div class="flex text-white mb-6 relative">
                    <img src="${coverImage}" class="mr-4" style="max-height: 10rem; max-width: 5rem" />             
                    <div class="font-kameron">
                        <h2 class="mt-0 mb-4">${zine.title}</h2>
                        <p>Price: £${(parseFloat(zine.price)).toFixed(2)}</p>
                    </div>                    
                </div>
            `

            newElement.innerHTML = newElementContent;
            cartItems.appendChild(newElement);            
        })
    })
})