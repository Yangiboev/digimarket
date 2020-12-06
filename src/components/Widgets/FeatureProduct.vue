<template>
	<div class="feature-product-wrap section-gap title-gap">
		<div class="container">
			<div class="sec-title">
				<h2>{{secTitle}}</h2>
			</div>
			<div class="tab-bar-wrap  text-center">
				<div v-for="(tab,key, index) in products" :key="key" class="tab-bar d-inline-block">
					<v-btn class="d-inline-block" @click="onTabChange(index)" :text="index === selectedTab">{{key}}</v-btn>
				</div>	
			</div>
			<div class="tab-content">
				<template v-for="(tab,title, index) in products">
					<div v-if="index == selectedTab" :key="index">
						<slick ref="carousel" :options="slickOptions" :key="title">
							<div
								v-for="(cateogary,subindex) in products[title]"
								:key="subindex"
								class="tab-item"
							>
								<div class="emb-card">
									<div class="thumb-wrap">
										<router-link :to="'/products/'+title+'/'+cateogary.objectID">
											<img 
												alt="feature product image"
												:src="cateogary.image"
												width="626"
												height="800"
											>
										</router-link>
										<div class="wishlist-icon">
											<v-btn v-if="ifItemExistInWishlist(cateogary)" @click="addItemToWishlist(cateogary)" icon >
												<v-icon  class="black--text">favorite</v-icon>
											</v-btn>
											<v-btn v-else @click="addItemToWishlist(cateogary)" icon >
												<v-icon class="grey--text">favorite</v-icon>
											</v-btn>
										</div>
										<div class="add-to-cart">
											<v-btn v-if="ifItemExistInCart(cateogary,cart)" to="/cart" class="accent" icon absolute bottom>
												<v-icon>remove_red_eye</v-icon>
											</v-btn>
											<v-btn v-else @click="addProductToCart(cateogary)" class="accent" icon >
												<v-icon>shopping_cart</v-icon>
											</v-btn>
										</div>
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
													v-model="cateogary.rate"
													readonly
													background-color="grey"
													color="#edb876"
												>
												</v-rating>
											</div>
										</div>
									</div>
								</div>
							</div>
						</slick>
					</div>
				</template>	
			</div>	
		</div>
	</div>
</template>

<script>
import Slick from "vue-slick";
import { mapGetters } from "vuex";

export default {
  props: ["secTitle"],
  computed: {
    ...mapGetters(["rtlLayout", "cart", "wishlist", "products"])
  },
  components: {
    Slick
  },
  data() {
    return {
      selectedTab: 0,
      activeTab: null,
      slickOptions: {
        autoplay: true,
        slidesToShow: 4,
        infinite: true,
        arrows: false,
        dots: true,
        rtl: this.rtlLayout,
        responsive: [
          {
            breakpoint: 1200,
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
              slidesToShow: 1,
              arrows: false,
              dots: false
            }
          }
        ]
      }
    };
  },
  methods: {
    changeSelectedProduct(cateogary) {
      this.$store.dispatch("changeSelectedProduct", cateogary);
    },
    /**
     * method for adding item to cart
     */
    addProductToCart(newItem) {
      this.$snotify.success("Product adding to the cart", {
        closeOnClick: false,
        pauseOnHover: false,
        timeout: 1000
      });
      setTimeout(() => {
        this.$store.dispatch("addProductToCart", newItem);
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
      if (this.ifItemExistInWishlist(item)) {
        this.$snotify.error("Product already exist in the wishlist", {
          showProgressBar: false
        });
      } else {
        this.$snotify.success("Product adding to the wishlist", {
          closeOnClick: false,
          pauseOnHover: false,
          timeout: 1000,
          showProgressBar: false
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
    }
  }
};
</script>


