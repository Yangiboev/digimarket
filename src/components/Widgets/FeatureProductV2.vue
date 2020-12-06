<template>
	<div class="feature-product-v2-wrap section-gap pt-0">
		<div class="sec-title black px-4 pb-4">
			<v-container>
				<h2 class="font-weight-light white--text mb-4">{{secTitle}}</h2>
				<div class="btn-wrap">
					<div v-for="(tab,key, index) in data" :key="key" class="tab-bar d-inline-block">
						<v-btn class="d-inline-block dar" @click="onTabChange(index)" :text="index === selectedTab">{{key}}</v-btn>
					</div>	
				</div>
			</v-container>
		</div>
		<div class="container">
			<div class="tab-content">
				<template v-for="(tab,title, index) in data" >
               <slick ref="carousel" :options="slickOptions"  v-if="index == selectedTab" :key="index">
                     <div
                        v-for="cateogary in data[title]"
                        :key="cateogary.name"
                        class="tab-item"
                     >
                        <div class="emb-card">
                           <div class="thumb-wrap">
                              <router-link :to="'/products/'+cateogary.type+'/'+cateogary.objectID">
                                 <img 
                                    alt="feature product image"
                                    :src="cateogary.image"
                                    width="626"
                                    height="800"
                                 >
                              </router-link>
                              <div v-if="cateogary.tags.length > 1">
                                 <v-chip >{{cateogary.tags}}</v-chip>
                              </div>
                              <router-link :to="'/products/'+cateogary.type+'/'+cateogary.objectID">
                                 <h6 class="black--text font-weight-medium white">
                                    <emb-currency-sign></emb-currency-sign>{{cateogary.price}}
                                 </h6>
                              </router-link>
                              <div class="add-to-cart">
                                 <v-btn v-if="ifItemExistInCart(cateogary,cart)" to="/cart" class="primary" icon >
                                    <v-icon>remove_red_eye</v-icon>
                                 </v-btn>
                                 <v-btn v-else @click="addProductToCart(cateogary)" class="primary" icon >
                                    <v-icon>shopping_cart</v-icon>
                                 </v-btn>
                              </div>
                           </div>
                           <div class="emb-card-content pa-4">
                              <h5  class="font-weight-medium" >
                                 <router-link :to="'/products/'+cateogary.type+'/'+cateogary.objectID">
                                    {{cateogary.name}}
                                 </router-link>
                              </h5>
                              <div class="emb-meta-info">
                                 <div class="inline-block ">
                                    <v-rating 
                                       v-model="cateogary.rate"
                                       readonly
                                       background-color="grey"
                                       color="#edb876"
                                    >
                                    </v-rating>
                                 </div>
                              </div>
                           </div>
                           <div class="emb-card-footer">
                              <div class="emb-meta-info layout justify-space-between align-center">
                                 <div>
                                    <v-btn v-if="ifItemExistInWishlist(cateogary)" @click="addItemToWishlist(cateogary)" icon class="px-0">
                                       <v-icon  class="black--text">favorite</v-icon>
                                    </v-btn>
                                    <v-btn v-else @click="addItemToWishlist(cateogary)" icon class="px-0">
                                       <v-icon class="grey--text">favorite</v-icon>
                                    </v-btn>
                                 </div>
                                 <div>
                                    <router-link :to="'/products/'+cateogary.type+'/'+cateogary.objectID">
                                       <v-icon>remove_red_eye</v-icon>
                                    </router-link>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </slick>
				</template>	
			</div>
		</div>
	</div>
</template>


<script>
import Slick from 'vue-slick';
import {mapGetters} from 'vuex';

export default {
	props: ['data','secTitle'],
	computed:{
		...mapGetters(["rtlLayout", "cart","wishlist"])
	},
	components: { 
		Slick
	},
	data () {
		return {
			selectedTab: 0,
			activeTab: null,
			slickOptions: {
				autoplay:true,
				slidesToShow: 4,
				infinite: true,
				arrows: false,
				dots: false,
				rtl:this.rtlLayout,
				responsive: [
					{
						breakpoint: 1519,
						settings: {
							slidesToShow: 3
						}
					},
					{
						breakpoint: 1264,
						settings: {
							slidesToShow: 3
						}
					},
					{
						breakpoint: 992,
						settings: {
							slidesToShow: 2
						}
					},
					{
						breakpoint: 600,
						settings: {
							slidesToShow:1,
							arrows:false,
							dots:false
						}
					}
				] 
			},
		}
	},
	methods:{
		/**
		 * method for adding item to cart
		*/
		addProductToCart(item){
			this.$snotify.success('Product adding to the cart',{
				closeOnClick: false,
				pauseOnHover: false,
				timeout: 1000,
				showProgressBar:false,
			});
			setTimeout(() => {
				this.$store.dispatch("addProductToCart", item);
			}, 100);
		},
		/**
		 * method for to change item
		*/
		onTabChange(key) {
			this.selectedTab = key;
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
		addItemToWishlist(item) {
			if(this.ifItemExistInWishlist(item)) {
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
					this.$store.dispatch("addItemToWishlist", item);
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
}
</script>
