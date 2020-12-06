<template>
   <div class="emb-cart-wrap emb-card">
      <emb-page-title
         heading="Here's what's in your bag"
         subHeading="Our latest news and learning articles."
         >
      </emb-page-title>
      <div class="cart-content section-gap">
         <v-container grid-list-xl py-0>
            <div  v-if="cart == ''" class="text-center">
               <div class="text-center">
                  <div class="mb-6">
                     <img  alt="cart-empty" height="128" src="static/images/empty-cart.png" width="128">
                  </div>
                  <h4 > Your Shopping Bag is empty</h4>
                  <router-link class="primary--text" to="/">Go to Shopping</router-link>
               </div>
            </div>
            <div v-else class="cart-shop-list">
               <div class="emb-card mb-12 pa-6 white">
						<div v-for="(item, index) in cart" :key="index">
							<v-row class="cart-item-wrap">
								<v-col cols="12" sm="12" md="2" class="d-inline-flex align-center justify-center">
									<img :src="item.image" alt='cart-item' width="100">
								</v-col>
								<v-col cols="12" sm="6" md="4" class="d-inline-flex align-center justify-center">
									<div class="text-center">
										<h5 class="mb-1">{{item.name}}</h5>
										<p class="mb-0">Delivery in 3-4 days | Free</p>
										<p class="mb-0"> 10 Days Replacement Policy</p>
									</div>
								</v-col>
								<v-col cols="6" sm="3" md="2" class="d-inline-flex align-center justify-center">
									<v-text-field class="d-inline-block" type="number" v-model="item.quantity" min="1" max="10"
										placeholder="Quantity">
									</v-text-field>
								</v-col>
								<v-col cols="6" sm="3" md="2" class="d-inline-flex align-center justify-center">
									<h4 class="mb-0">
										<emb-currency-sign></emb-currency-sign>
                    {{(item.quantity)*(item.price)}}
									</h4>
								</v-col>
								<v-col cols="2" sm="2" md="2" class="res-float-icon d-inline-flex align-center justify-md-center justify-end">
									<a class="accent--text remove-cart" @click="deleteProductFromCart(cart)" href="javascript:void(0)">
										<i class="material-icons font-weight-bold">close </i>
									</a>
								</v-col>
							</v-row>
						</div>
               </div>
               <v-layout align-center justify-end>
                  <vue-snotify></vue-snotify>
                  <v-flex xs12 sm12 md5 lg5 xl5 py-0>
                     <div class="layout align-center justify-space-between subtotal">
                        <p>Subtotal</p>
                        <span>
                           <emb-currency-sign></emb-currency-sign>
                           {{itemTotal}}
                        </span>
                     </div>
                     <div class="layout align-center justify-space-between subtotal">
                        <p>Shipping</p>
                        <span>
                           <emb-currency-sign></emb-currency-sign>
                           {{shipping}}
                        </span>
                     </div>
                     <div class="layout align-center justify-space-between subtotal">
                        <p>Tax(GST)</p>
                        <span>
                           <emb-currency-sign></emb-currency-sign>
                           {{tax}}
                        </span>
                     </div>
                     <v-divider class="my-3"></v-divider>
                     <div class="layout align-center justify-space-between subtotal layout-gap">
                        <h4>Total</h4>
                        <h4>
                           <emb-currency-sign></emb-currency-sign>
                           {{getTotalPrice}}
                        </h4>
                     </div>
                     <div class="layout justify-end subtotal">
                        <v-btn large class="accent mr-0" to="/checkout">
                           Checkout
                        </v-btn>
                     </div>
                  </v-flex>
               </v-layout>
               <emb-delete-confirmation
                  ref="deleteConfirmationDialog"
                  message="Are you sure you want to delete this product?"
                  @onConfirm="onDeleteProductFromCart"
                  >
               </emb-delete-confirmation>
            </div>
         </v-container>
      </div>
   </div>
</template>
<script>
import { mapGetters } from "vuex";

export default {
  data() {
    return {
      selectDeletedProduct: null,
      total: null,
      headers: [
        {
          text: "Product",
          align: "left",
          sortable: false,
          value: "image"
        },
        { text: "Product Name", value: "name" },
        { text: "Product Quantity", value: "quantity" },
        { text: "Product Total", value: "total" },
        { text: "Remove", value: "remove" }
      ]
    };
  },
  computed: {
    ...mapGetters(["cart", "tax", "shipping"]),

    itemTotal() {
      let productTotal = null;
      if (this.cart.length > 0) {
        for (const item of this.cart) {
          productTotal += item.price * item.quantity;
        }
        return productTotal.toFixed(2);
      } else {
        return productTotal.toFixed(2);
      }
    },
    getTotalPrice() {
      let totalPrice = this.tax + this.shipping;
      if (this.cart.length > 0) {
        for (const item of this.cart) {
          totalPrice += item.price * item.quantity;
        }
        return totalPrice.toFixed(2);
      } else {
        return totalPrice.toFixed(2);
      }
    }
  },
  methods: {
    deleteProductFromCart(product) {
      this.$refs.deleteConfirmationDialog.openDialog();
      this.selectDeletedProduct = product;
    },
    onDeleteProductFromCart() {
      this.$refs.deleteConfirmationDialog.close();
      this.$snotify.error("Product Removing from cart", {
        closeOnClick: false,
        pauseOnHover: false,
        timeout: 1000
      });
      this.$store.dispatch(
        "onDeleteProductFromCart",
        this.selectDeletedProduct
      );
    }
  }
};
</script>

