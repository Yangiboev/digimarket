<template>
	<div class="emb-product-detail">
		<template v-if="selectedProduct != null">
			<emb-page-title :heading="selectedProduct.name"></emb-page-title>
			<div class="emb-productDetail-content white">
				<div class="product-detail section-gap">
					<v-container grid-list-xl py-0>
						<v-layout row wrap product-detail-row>
							<v-flex xs12 sm12 md6 lg6 xl6 text-center>
								<v-layout row wrap>
									<v-flex xs2 sm2 md2 lg2 xl2 product-gallery>
										<div 
											class="detail-image-gallery d-inline-block mb-6 mx-2"  
											v-for="(productItemImg,key) in selectedProduct.image_gallery" 
											:key="key"
											@mouseover="togglePreviewImage(productItemImg)"
										>
											<a href="javascript:void(0)">
												<img :src="productItemImg" width="71" height="91" alt="product image">
											</a>
										</div>
									</v-flex>
									<v-flex xs10 lg10 sm10 md10 xl10 product-detail-img>
										<div class="product-detail-thumb">
											<div class="image-wrapper emb-card">
												<a href="javascript:void(0)">
													<img class="detailImg" :src="selectedImage"  width="auto" height="auto" alt="product detail image">
												</a>
											</div>
										</div>
									</v-flex>
								</v-layout>
							</v-flex>
							<v-flex xs12 sm12 md6 lg6 xl5>
								<router-link to="/">Back to shop</router-link>
								<h3>{{selectedProduct.name}}</h3>
								<a href="javascript:void(0)" class="color-inherit text-underline mb-4 d-inline-block" @click="showReviewPopup">ADD A REVIEW</a>
								<emb-review-popup ref="productReviewPopup"></emb-review-popup>
								<h4 class="accent--text"><emb-currency-sign></emb-currency-sign>{{selectedProduct.price}}</h4>
								<ul class="product-availablity list-unstyled pl-0 mb-4 mt-4">
									<li>
										<template v-if="selectedProduct.availablity === true">
											<span class="font-weight-medium">Availablity</span> : <span class="font-weight-regular">In Stocks</span>
										</template>
										<template v-else>
											<span class="font-weight-medium">Availablity</span> : <span class="font-weight-regular">Out Of Stocks</span>
										</template>
									</li>
									<li>
										<span class="font-weight-medium">Product Code</span> : <span class="font-weight-regular">{{selectedProduct.product_code}}</span>
									</li>
									<li>
										<span class="font-weight-medium">Tags</span>
										<span>:</span>
										<span class="font-weight-regular"	v-for="(tag,key) in selectedProduct.tags" :key="key">
											{{tag}}
										</span>
									</li>
								</ul>
								<p>{{selectedProduct.descpription}}</p>
								<div class="bullet-points mb-4">
									<ul class="features pl-13">
										<li v-for="(Features,key) in selectedProduct.features" 	:key="key">
											{{Features}}
										</li>
									</ul>
								</div>
								<div class="select-group mb-4">
									<v-layout wrap>
										<v-flex xs12 sm4 lg4 md4 lg3 xl3 pb-0  v-if="selectedProduct.type == 'men' || selectedProduct.type == 'women'" >
											<v-select
												:items="['Pink','Orange','Black']"
												label="Color"
											>
											</v-select>
										</v-flex>
										<v-flex xs12 sm4 lg4 md4 lg3 xl3 pb-0  v-if="selectedProduct.type == 'men' || selectedProduct.type == 'women'" >
											<v-select
												:items="['XXL','XL','M','L','S']"
												label="Size"
											>
											</v-select>
										</v-flex>
										<v-flex xs12 sm4 lg4 md4 lg3 xl3 pb-0>
											<v-select
												v-model="selectedProduct.quantity"
												:items="[1,2,3,4,5]"
											>
											</v-select>
										</v-flex>
									</v-layout>
								</div>
								<div class="mb-6">
									<a href="javascript:void(0)"	class="color-inherit text-underline"	@click="addItemToWishlist(selectedProduct)">
										Add To WishList
									</a>
								</div>
								<div class="mb-6 btn-wrap">
									<v-btn 
										v-if="ifItemExistInCart(selectedProduct)"
										class="accent cpx-0"
										large
										to="/cart"
									>
										View Cart
									</v-btn>
									<v-btn 
										v-else
										class="accent d-inline-block cpx-0"
										large 
										@click="addProductToCart(selectedProduct)"
									>
										Add To Cart
									</v-btn>
									<v-btn large to="/checkout" class="white buyProduct cpx-0">Buy Now</v-btn>
								</div>
								<div>
									<span>Share Now</span>
									<emb-social-share class="mx-2"></emb-social-share>
								</div>
							</v-flex>
						</v-layout>
					</v-container>
				</div>
				<div class="related-product section-gap bg-grey">
					<v-container grid-list-xl class="py-0">
						<div class="sec-title">
							<h2 class="font-weight-medium">You Might Also Like</h2>
						</div>
						<div class="product-listing">
							<v-layout row wrap mb-4>
                        <template v-for="(product, index) in products[title]">
                           <v-flex xs12 sm6 md6 lg3 xl3 mb3 text-center  v-if="index <= 3" :key="index">
                              <div class="emb-card " >
                                 <div class="thumb-wrap">
                                    <router-link :to="'/products/'+title+'/'+product.objectID">
                                       <img :src="product.image" alt="related product" width="626" height="800">
                                    </router-link>
                                    <div class="wishlist-icon">
                                       <v-btn v-if="ifItemExistInWishlist(product)" @click="addItemToWishlist(product)" icon >
                                          <v-icon  class="black--text">favorite</v-icon>
                                       </v-btn>
                                       <v-btn v-else @click="addItemToWishlist(product)" icon >
                                          <v-icon class="grey--text">favorite</v-icon>
                                       </v-btn>
                                    </div>
                                    <div class="add-to-cart">
                                       <v-btn v-if="ifItemExistInCart(product)" to="/cart" class="primary" small icon>
                                          <v-icon medium>edit</v-icon>
                                       </v-btn>
                                       <v-btn
                                          v-else
                                          class="accent"
                                          small
                                          icon
                                          @click="addProductToCart(product)"
                                       >
                                          <v-icon>shopping_cart</v-icon>
                                       </v-btn>
                                    </div>
                                 </div>
                                 <div class="emb-card-content px-6 py-4 white">
                                    <h5  v-text="product.name"></h5>
                                    <div class="emb-meta-info">
                                       <div class="layout align-center justify-space-between pa-4">
                                          <div class="inline-block">
                                             <h6 class="accent--text font-weight-medium" >
                                                <emb-currency-sign></emb-currency-sign>{{product.price}}
                                             </h6>
                                          </div>
                                          <div class="inline-block">
                                             <v-rating 
                                                :value="product.rating"
                                                background-color="grey"
                                                readonly
                                                color="warning"
                                             >
                                             </v-rating>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </v-flex>
                        </template>								
							</v-layout>	
						</div>
						<div class="text-center">
							<v-btn :to="`/products/`+title" class="white">Show All</v-btn>
						</div>
					</v-container>
				</div>
			</div>
		</template>
	</div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
	computed: {
		...mapGetters(["cart","wishlist","selectedProduct","products"]),
	},
	mounted() {
		this.title = this.$route.params.title;
		this.id = this.$route.params.id;
		this.getParametre(this.title,this.id);
		
	},
	watch: {
    "$route"(to) {
		 this.title = to.params.title;
		 this.id = to.params.id;
		 this.getParametre(this.title,this.id);
    },
},
	data () {
		return{
			title: "",
			id: "",
			selectedImage: null
		}
	},
	methods: {
		/* for routing matching **/
		getParametre(param1,param2){
			for (var type in this.products) {
				if(type == param1){
					for( let titleDetails in this.products[type]){
						var index = this.products[type][titleDetails].objectID;
						if(param2 == index){
							var item = this.products[type][titleDetails];
							this.$store.dispatch("changeSelectedProduct",item);
							this.selectedImage = this.selectedProduct.image_gallery[0];
						}
					}
				}
			}
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
