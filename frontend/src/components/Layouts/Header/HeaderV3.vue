<template>  
   <div>
      <div class="header-v3-wrap">
         <div  class="header-wrap">
            <div  class="top-header-wrap">
               <div class="top-header">
                  <v-container grid-list-xl>
                     <v-layout  row wrap align-center justify-space-between pt-0 pb-0 ma-0 >
                        <v-flex xs6 sm6 md6 lg9 xl9 pa-0 currency-lang-wrap header-v3-top-tools>
                           <span class="white--text">Welcome to our store</span>
                           <emb-lang></emb-lang>
                           <emb-currency></emb-currency>
                        </v-flex>
                     	<v-flex xs6 sm6 md6 lg3 xl3 pa-0>
                           <div class="notifications header-v3-top-tools">
                              <emb-cart></emb-cart>
                              <emb-wishlist></emb-wishlist>
                              <emb-user-block :data="userLinks"></emb-user-block>
                           </div>
                        </v-flex>
                     </v-layout>
                  </v-container>
               </div>
            </div>
            <div class="middle-header">
               <v-container>
                  <v-layout row wrap justify-space-between align-center>
                     <v-flex xs12 sm12 md6 lg4 xl4>
                        <div class="site-logo d-inline-block">
                           <router-link to="/">
                              <img alt="site-logo" height="34" :src="appLogoDark" width="224">
                           </router-link>
                        </div>
                     </v-flex>
                     <v-flex xs12 sm12 md6 lg4 xl4  search-v3-wrap>
                        <form>
                           <input type="text" placeholder="Search">
                           <v-btn  icon>
                              <v-icon>search</v-icon>
                           </v-btn>
                        </form>
                     </v-flex>
                  </v-layout>
               </v-container>
            </div>
            <div class="bottom-header">
               <v-container>
                  <div class="bottom-header-inner">
                     <div class="menu-alignment">
                        <emb-menu></emb-menu>
                     </div>
                     <div class="layout align-left responsive-menu">
                        <v-btn icon dark @click="toggleMobileSidebar" class="toggle-btn">
									<i class="material-icons">menu</i>
                        </v-btn>
                     </div>
                     <emb-search></emb-search>
                  </div>
               </v-container>
            </div>
         </div>
      </div>
      <div id="fixedHeader">
         <emb-fixed-header></emb-fixed-header>
      </div>
   </div>
</template>

<script>
import Menu from './Menu';
import Lang from './Lang'
import Currency from './Currency'
import Cart from './Cart'
import Wishlist from './Wishlist'
import UserBlock from './UserBlock'
import Search from './Search'
import AppConfig from "Constants/AppConfig";
export default {
	data (){
	   return{
			appLogoDark: AppConfig.appLogoDark,
			userLinks: [
				{
					icon:'account_circle',
					title: 'User Profile',
					path:"/account/profile"
				},
				{
					icon:'settings',
					title:'Account',
					path:"/account/profile"
				},
				{
					icon:'local_post_office',
					title:'Messages',
					path:"/account/profile"
				},
				{	
					icon:'power_settings_new',
					title: 'LogOut',
					path:"/session/signin"
				}
			],
		}
	},
	components: {
		embMenu: Menu,
      embCart:Cart,
      embLang: Lang,
		embCurrency: Currency,
		embWishlist: Wishlist,
		embUserBlock:UserBlock,
		embSearch:Search,
   },
   mounted() {
		this.fixedHeader();
	},
	methods: {
		toggleMobileSidebar() {
			this.$store.dispatch("toggleSidebar", true);
      },
      fixedHeader(){
        var fixedHeader = document.getElementById("fixedHeader");
		  	window.onscroll = function() {
				if (window.pageYOffset > 150) {
					fixedHeader.style.opacity = "1";
					fixedHeader.style.visibility = "visible";
					fixedHeader.style.translate = "translateY(0)";
					fixedHeader.style.top =  0 
				} 
				else {
					fixedHeader.style.opacity = "0";
					fixedHeader.style.visibility = "hidden";
					fixedHeader.style.translate = "translateY(-100%)";
					fixedHeader.style.top = "0";
				}
			}
		}
	}	
};
</script>

