<template>
   <div class="top-products-wrap section-gap">
      <v-container grid-list-xl>
         <div class="layout align-baseline justify-space-between sec-wrap ma-0">
            <div class="sec-title">
               <h3>{{secTitle}}</h3>
            </div>
            <!-- <routerLink to='/products'>View All</routerLink> -->
         </div>
         <div class="layout row wrap mb-0">
            <v-container>
               <v-layout row wrap>
                  <v-flex xs12 sm6 md6 lg3 xl3  v-for="(product,index) in shown" :key="index">
                     <div class="emb-card box-shadow-md pa-6">
                           <img :src="product.image" alt="Photo">
                        <div class="emb-card-content pt-4">
                           <p class="mb-0">
                              <a href="javascript:void(0)" class="text-muted ">{{product.url}}</a>
                           </p>
						  
                           <h5>
							   {{product.name}}</h5>
									<v-btn 
										class="my-0 mx-0"
										:to="'/products/title/' + product.id"
									>
										Compare
									</v-btn>
                        </div>
                     </div>
                  </v-flex>
               </v-layout>
            </v-container>
         </div>
			<div class="btn-wrap">
				<v-btn block class="transparent-btn mb-0"  @click="nextPage" v-if="currentPage != totalPages">Show All</v-btn>
				<v-btn block class="transparent-btn mb-0" @click="prevPage"  v-if="currentPage!=1">Less</v-btn>
			</div>
      </v-container>
   </div>
</template>

<script>
import {mapGetters, mapActions} from 'vuex';

export default {
   props: ['data','secTitle'],
   data(){
		return{
			currentPage: 1
		}
   },
   computed:{
		...mapGetters(["cart", 'allproducts']),
		shown () {
			return this.allproducts.slice(0, this.currentPage * 4)
		},
		totalPages() {
			return Math.ceil( this.data.length / 4);
		}
	},
	mounted() {
		this.getAllProducts()
	},
   methods:{
	   ...mapActions(['getAllProducts']),
		nextPage(){
			if(this.currentPage <  this.totalPages) this.currentPage++;
		},
		prevPage(){
			this.currentPage = this.currentPage - 1 || 1;
		},
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
			}, 50);
		},
		/* This function is used to check weather the product exist in cart
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
		}
   }
}
</script>