function add_to_cart(pid, pname, price) {
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		//no cart yet
		let products = [];
		let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
		products.push(product);

		localStorage.setItem("cart", JSON.stringify(products));
		showToast("Product Added Successfully")
	}
	else {
		//cat is al ready present
		let pcart = JSON.parse(cart);
		let oldProduct = pcart.find((item) => item.productId == pid)
		if (oldProduct) {
			//we have to incresa th quantity
			oldProduct.productQuantity = oldProduct.productQuantity + 1
			pcart.map((item) => {

				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}

			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			showToast(oldProduct.productName + "Product Quantity Increased, Qunatity =" + oldProduct.productQuantity)
		}

		else {
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
			pcart.push(product)
			localStorage.setItem("cart", JSON.stringify(pcart));
			showToast("Product Added Successfully")
		}
	}
	update_cart();
}
//showing value in cart
function update_cart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);

	if (cart == null || cart.length == 0) {
		console.log("cart is empty")
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3> cart does not contaion any item</h3>");
		$(".checkout-btn").attr('disabled', true)
	}
	else {
		//console.log(cart)
		$(".cart-items").html(`(${cart.length})`);

		let table = `
				<table class='table table-bordered'>
				<thead class='thead-light'>
					<tr>
				      <th scope="col">Product Name</th>
				      <th scope="col">Price</th>
				      <th scope="col">Quantity</th>
				      <th scope="col">Total Price</th>
					  <th scope="col">Action</th>
				    </tr>
				</thead>
		`;
		let totalPrice = 0;
	
		cart.map((item) => {
			table += `
			
				<tbody>
				    <tr>
				      <td>${item.productName}</td>
					  <td>&#8377;${item.productPrice}</td>
					  <td><button onclick='deleteOneItem(${item.productId})' class='btn btn-sm btn-danger btn-sm'>-</button>
						${item.productQuantity}
						<button onclick='addOneItem(${item.productId})' class='btn btn-sm btn-success btn-sm'>+</button>
						</td>
					  <td>&#8377;${item.productQuantity * item.productPrice}</td>
					  <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
				    </tr>
				</tbody>
			
			`
			totalPrice += item.productPrice * item.productQuantity;
		
		})

		table = table + `
		<tr><td colspan='6' class='text-right font-weight-bold'> Total Price:&#8377;${totalPrice}</td></tr>
		</table>`

		$(".cart-nav-table").html(table);
		$(".cart-table").html(table);
		$(".checkout-btn").attr('disabled', false)
		
	}
}


function deleteItemFromCart(pid) {
	let cart = JSON.parse(localStorage.getItem('cart'));
	let newcart = cart.filter((item) => item.productId != pid)
	localStorage.setItem('cart', JSON.stringify(newcart))
	showToast("Product Removed From Cart")

	update_cart()
}


function deleteOneItem(pId){
	let pcart = JSON.parse(localStorage.getItem('cart'));
		let oldProduct = pcart.find((item) => item.productId == pId)
		if (oldProduct) {
			//we have to incresa th quantity
			oldProduct.productQuantity = oldProduct.productQuantity - 1
			pcart.map((item) => {

				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
					
				}

			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			showToast(oldProduct.productName + "Product Quantity Decresed, Qunatity =" + oldProduct.productQuantity)
		}
		update_cart();
}

function addOneItem(pId){
	let pcart = JSON.parse(localStorage.getItem('cart'));
		let oldProduct = pcart.find((item) => item.productId == pId)
		if (oldProduct) {
			//we have to incresa th quantity
			oldProduct.productQuantity = oldProduct.productQuantity + 1
			pcart.map((item) => {

				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}

			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			showToast(oldProduct.productName + "Product Quantity Increased, Qunatity =" + oldProduct.productQuantity)
			update_cart();
		}

		else {
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
			pcart.push(product)
			localStorage.setItem("cart", JSON.stringify(pcart));
			showToast("Product Added Successfully")
		}
		update_cart();
}


$(document).ready(function() {
	update_cart();
})

function showToast(content) {
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(() => { $("#toast").removeClass("display"); }, 2000);
}


function GoOnCheckout() {
	
	window.location = "product_checkout.jsp"
}