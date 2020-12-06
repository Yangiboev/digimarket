<template>
	<div class="emb-product-detail">
		<template>
			<emb-page-title :heading="product.name"></emb-page-title>
			<div class="emb-productDetail-content white">
				<div class="product-detail section-gap">
					<v-container grid-list-xl py-0>
						<v-layout row wrap product-detail-row>
							<v-flex xs12 sm12 md6 lg6 xl6 text-center>
								<v-layout row wrap>
									<v-flex xs12 lg12 sm12 md12 xl12 product-detail-img>
										<div class="product-detail-thumb">
											<div class="image-wrapper emb-card">
												<a href="javascript:void(0)">
													<img class="detailImg" :src="product.image"  width="auto" height="auto" alt="product detail image">
												</a>
											</div>
										</div>
									</v-flex>
								</v-layout>
							</v-flex>
							<v-flex xs12 sm12 md6 lg6 xl5>
								<router-link to="/">Back to shop</router-link>
								<h3>{{product.name}}</h3>
								<v-data-table
									:headers="headers"
									:items="product.prices"
									hide-default-header
    								hide-default-footer
									class="elevation-1"
								>
									<template v-slot:item.price="{ item }">
									<v-chip
										:color="getColor(item.price)"
										dark
									>
										{{ item.price }}
									</v-chip>
									</template>
									<template v-slot:item.url="{ item }">
									<v-icon
										small
										class="mr-2"
										@click="getUrl(item.url)"
									>
										mdi-cart
									</v-icon>
									</template>
								</v-data-table>
								<p>{{product.descpription}}</p>
								<div class="mb-6">
									<a href="javascript:void(0)"	class="color-inherit text-underline"	@click="addItemToWishlist(selectedProduct)">
										Add To WishList
									</a>
								</div>
								<div>
									<span>Share Now</span>
									<emb-social-share class="mx-2"></emb-social-share>
								</div>
							</v-flex>
						</v-layout>
					</v-container>
				</div>
			</div>
		</template>
	</div>
</template>

<script>
import {mapGetters} from "vuex";
// import api from 'Api'
export default {
	computed: {
		...mapGetters(["cart","wishlist","allproducts", "selectedProduct","products"]),
	},
	beforeMount() {
		this.title = this.$route.params.title;
		this.id = this.$route.params.id;
		this.getSelectedProduct(this.id)
		
	},
	watch: {
    "$route"(to) {
		 this.title = to.params.title;
		 this.id = to.params.id;
		//  this.getSelectedProduct(this.id)
    },
},
	data () {
		return{
			title: "",
			product: null,
			id: "",
			headers: [
			{ text: 'Shop', value: 'shop' },
			{
				text: 'Price',
				align: 'start',
				sortable: false,
				value: 'price',
			},
			{ text: 'URL', value: 'url' },
			],
			selectedImage: null
		}
	},
	methods: {
		getSelectedProduct(id) {
			for(var pro of this.allproducts) {
				if (pro.id === id) {
					this.product = pro
				}
			}
			console.log(this.product)
			// api({
			// 	url: '/product/' +id,
			// 	method: 'get'
			// }).then((response) => {
			// 	console.log(response.data)
			// 	this.product = response.data.data
			// })
		},
		getUrl (url) {
        window.open(url)
		},
		/* for opening the popup **/
		showReviewPopup() {
			this.$refs.productReviewPopup.open();
		},
		/* for toggling image **/
		togglePreviewImage(image) {
			this.selectedImage = image;
		},
		/* for adding product in car	**/
		addProductToCart(item) {
			this.$snotify.success('Product adding to the cart',{
				closeOnClick: false,
				pauseOnHover: false,
				timeout: 1000,
				showProgressBar:false,
			});
			setTimeout(() => {
				this.$store.dispatch("addProductToCart", item);
			}, 50);
		},
		/* check weather the product exist in cart
			* retun the boolean 
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
		getColor (price) {
        // if (price > 400) return 'red'
        if (price > 200) return 'orange'
        else return 'green'
      },
		/* to add a product in wishlist */
		addItemToWishlist(product) {
			if(this.ifItemExistInWishlist(product)) {
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
					this.$store.dispatch("addItemToWishlist", product);
				}, 2000);
			}
		},
		/* check weather the product exist in the wishlist
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
}
</script>
