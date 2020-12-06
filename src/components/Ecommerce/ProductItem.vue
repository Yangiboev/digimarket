<template>	
	<div>
	<div class="product-item-wrap emb-card">
		<div>
			<div class="thumb-warp" >
				<router-link to="/product/product-detail">
					<img alt="product" :src="data.image" >
				</router-link>
				<div class="add-to-cart">
					<v-btn v-if="ifItemExistInCart(data)" to="/cart" class="accent" small icon>
						<v-icon>remove_red_eye</v-icon>
					</v-btn>
				</div>
			</div>
			<div class="emb-card-content pa-4">
				<h5 class="font-weight-medium text-capitalize">{{data.name}}</h5>
				<div class="emb-meta-info layout align-center justify-space-between">
					<div class="inline-block">
						<h6 class="accent--text">
							<emb-currency-sign></emb-currency-sign>{{data.price}}
						</h6>
					</div>
					<div class="inline-block">
						<v-rating 
							v-model="data.rating"
							small
							background-color="warning"
							readonly
							color="warning"
						></v-rating>
					</div>
				</div>
			</div>
		</div>	
	</div>
	</div>
</template>

<script>
import { mapGetters } from "vuex";

export default {

	props: ['data','colxs','colsm','colmd','collg','colxl'],
	computed: {
	  ...mapGetters(["cart","wishlist"])
	},
	methods: {
		/**
		 * method for adding item to cart
		*/
		addProductToCart(item) {
			this.$snotify.success('Product adding to the cart',{
				closeOnClick: false,
				pauseOnHover: false,
				timeout: 1000,
				showProgressBar:false,
			});
			setTimeout(() => {
				this.$store.dispatch("addProductToCart", item);
			}, 500);
		},
		/**
		 * method for checking if item exists in cart
		*/
		ifItemExistInCart(result) {
			let exists = false;
			for (let item of this.cart) {
				if (item.id == result.objectID) {
					exists = true;
				}
			}
			return exists;
		},
		 // this method is use to add a product in wishlist
		addItemToWishlist(data) {
			if(this.ifItemExistInWishlist(data)) {
				this.$snotify.error('Product already exist in the wishlist',{
					showProgressBar:false,
				});
			} 
			else {
				this.$snotify.success('Product adding to the wishlist',{
					closeOnClick: false,
					pauseOnHover: false,
					timeout: 1000,
					showProgressBar:false,
				});
				setTimeout(() => {
					this.$store.dispatch("addItemToWishlist", data);
				}, 2000);
			}
		},
		/**
		 * This Function Is use to check weather the product exist in the wishlist
		 * Return boolean
		*/
		ifItemExistInWishlist(result) {
			let exists = false;
			for (let item of this.wishlist) {
				if (item.id == result.objectID) {
					exists = true;
				}
			}
			return exists;
		}, 
  	}
};
</script>