
<div id="toast">this is our custom toast</div>

<link rel="stylesheet" type="text/css" href="css/cart.css">
<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center" id="exampleModalLabel">Your Cart</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="background: url('img/pattern2.png');">
        
        	<div class="cart-nav-table">
        	
        	</div>
        
      </div>
      <div class="modal-footer">
      <input type="hidden" id="d2" value="1" name="d11">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" onclick="GoOnCheckout()" class="btn btn-success checkout-btn">Checkout</button>
      </div>
    </div>
  </div>
</div>

