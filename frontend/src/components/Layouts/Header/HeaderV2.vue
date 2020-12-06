<template>  
	<div>
		<div class="headerV2-wrap">
			<div  class="header-wrap">
				<div  class="top-header-wrap d-block primary">
					<div class="top-header">
						<v-container grid-list-xl>
							<v-layout  row wrap align-center justify-space-between pa-0 ma-0>
								<v-flex xs6 sm6 md4 lg3 xl3 px-0>
									<div class="site-logo d-inline-block">
										<router-link to="/">
											<img alt="site-logo" height="34" :src="appLogo" width="224">
										</router-link>
									</div>
								</v-flex>
							<v-flex xs12 sm7 md5 lg7 xl7 search-v2-wrap>
									<div class="search-v2">
										<emb-search></emb-search>
									</div>
								</v-flex>
								<v-flex xs6 sm6 md3 lg2 xl2 px-0>
									<div class="notifications d-flex align-items-center justify-end">
										<emb-user-block :data="userLinks"></emb-user-block>
									</div>
								</v-flex>
							</v-layout>
						</v-container>
					</div>
				</div>
				<div class="bottom-header">
					<v-container>
						<div class="bottom-header-inner">
							<div class="menu-alignment align-center">
							<div class="center">
								<emb-menu></emb-menu>
							</div>
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
					icon:'power_settings_new',
					title: 'LogOut',
					path:"/session/signin"
				}
			],
		}
	},
	components: {
		embMenu: Menu,
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
				if (window.pageYOffset > 100) {
					fixedHeader.style.opacity = "1";
					fixedHeader.style.visibility = "visible";
					fixedHeader.style.translate = "translateY(0)";
				} 
				else {
					fixedHeader.style.opacity = "0";
					fixedHeader.style.visibility = "hidden";
					fixedHeader.style.translate = "translateY(-200px)";
				}
			}
		}
	}	
};
</script>
<style scoped>
.center {
  margin: auto;
  width: 30%;
}
</style>