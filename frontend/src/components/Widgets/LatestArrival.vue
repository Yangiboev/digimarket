<template>
	<div class="emb-latest-arrival section-gap title-gap">
		<div class="container">
			<div class="sec-title">
				<h2>{{secTitle}}</h2>
			</div>
			<div class="tab-bar-wrap  text-center">
				<div v-for="(tab,key, index) in data" :key="key" class="tab-bar d-inline-block">
					<v-btn class="d-inline-block" @click="onTabChange(index)" :flat="index === selectedTab">{{key}}</v-btn>
				</div>	
			</div>
			<div class="tab-content">
				<template v-for="(tab,key, index) in data" v-if="index == selectedTab">
					<slick ref="carousel" :options="slickOptions" :key="key">
						<div
							v-for="cateogary in data[key]"
							:key="cateogary.name"
							class="tab-item"
						>
							<div class="emb-card">
								<div class="thumb-wrap">
									<router-link to="/product/product-detail">
										<img 
											alt="feature product image"
											:src="cateogary.image"
											width="626"
											height="800"
										>
									</router-link>
									<v-btn v-if="ifItemExistInCart(cateogary,cart)" to="/cart" class="primary" icon absolute bottom>
										<v-icon medium>edit</v-icon>
									</v-btn>
									<v-btn v-else @click="addProductToCart(cateogary)" class="accent" icon >
										<v-icon>shopping_cart</v-icon>
									</v-btn>
								</div>
								<div class="emb-card-content pa-4">
									<h5  class="font-weight-medium" v-text="cateogary.name"></h5>
									<div class="emb-meta-info layout align-center my-1">
										<div class="inline-block">
											<h6 class="accent--text font-weight-medium">
												<emb-currency-sign></emb-currency-sign>{{cateogary.price}}
											</h6>
										</div>
										<div class="inline-block ">
											<v-rating 
												:value="cateogary.rating"
												background-color="grey"
												readonly
												color="#edb876"
											>
											</v-rating>
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
		...mapGetters(["rtlLayout", "cart"])
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
				arrows: true,
				dots: true,
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
							slidesToShow: 3
						}
					},
					{
						breakpoint: 769,
						settings: {
							slidesToShow:2,
							arrows:false,
						}
					},
					{
						breakpoint: 577,
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
    	}
	}
}
</script>


