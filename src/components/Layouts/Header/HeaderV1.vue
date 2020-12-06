<template>
	<div>
		<div class="header-v1-wrap" >
			<div  class="header-wrap">
				<div  class="top-header-wrap d-block primary">
					<div class="top-header">
						<v-container>
							<v-layout align-center justify-space-between>
								<div class="options hidden-md-and-down d-md-inline-flex align-items-center">
									<emb-lang></emb-lang>
									<emb-currency></emb-currency>
								</div>
								<div class="site-logo d-inline-block">
									<router-link to="/">
										<img alt="site-logo" height="34" :src="appLogo" width="224">
									</router-link>
								</div>
								<div class="notifications d-inline-flex align-items-center">
									<emb-cart></emb-cart>
									<emb-wishlist></emb-wishlist>
									<emb-user-block :data="userLinks"></emb-user-block>
								</div>
							</v-layout>
						</v-container>
					</div>
				</div>
				<div class="bottom-header d-block primary">
					<v-container>
						<div class="bottom-header-inner">
							<div class="menu-alignment">
								<emb-menu></emb-menu>
							</div>
							<div class="layout align-left responsive-menu">
								<v-btn icon dark @click="toggleMobileSidebar" class="toggle-btn" large>
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
			appLogo: AppConfig.appLogo,
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
		embLang: Lang,
		embCurrency: Currency,
		embCart:Cart,
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
				if (window.pageYOffset > 160) {
					fixedHeader.style.opacity = "1";
					fixedHeader.style.visibility = "visible";
					fixedHeader.style.translate = "translateY(0)";
					fixedHeader.style.top =0
				} 
				else {
					fixedHeader.style.opacity = "0";
					fixedHeader.style.visibility = "hidden";
					fixedHeader.style.translate = "translateY(-200px)";
					fixedHeader.style.top = "0";
				}
			}
		}
	}	
};
</script>