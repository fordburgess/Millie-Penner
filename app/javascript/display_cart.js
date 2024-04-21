// window.addEventListener('DOMContentLoaded', () => {
//     var cartIcon = document.getElementById("cart-icon");        
//     var cartSidebar = document.getElementById("cart-sidebar");
//     var cartOpen = false;

//     cartIcon.addEventListener('click', (e) => {    
//         e.stopPropagation();
    
//         if (cartSidebar.style.transform == 'translateX(100%)') {
//             cartSidebar.style.transform = 'translateX(0%)';   
//             cartOpen = true;         
//         }
//     })

//     document.addEventListener('click', (e) => {
//         if (cartOpen) {            
//             if (!cartSidebar.contains(e.target) && e.target.id !== 'delete-button') {                    
//                 cartSidebar.style.transform = 'translateX(100%)'
//                 cartOpen = false;
//             }
//         }
//     })
// })