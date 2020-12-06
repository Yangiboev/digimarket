<template>
   <div class="fixed-header-wrap">
      <div  class="header-wrap primary px-4">
         <v-container grid-list-xl>
            <v-layout  align-center justify-space-between row ma-0>
               <div class="site-logo d-inline-block">
                  <router-link to="/">
                     <img alt="site-logo" height="34" :src="appLogo" width="224">
                  </router-link>
               </div>
               <div>
                  <div class="menu-alignment">
                     <emb-menu></emb-menu>
                  </div>
                  <div class="layout align-left responsive-menu">
                     <v-btn icon dark @click="toggleMobileSidebar" class="toggle-btn">
								<i class="material-icons">menu</i>
                     </v-btn>
                  </div>
               </div>
            </v-layout>
         </v-container>
      </div>
   </div>
</template>

<script>
import Menu from './Menu';
import AppConfig from "Constants/AppConfig";

export default {
   data (){
	   return{
         appLogo: AppConfig.appLogo
      }
   },
	components: {
		embMenu: Menu,
	},
	methods: {
		toggleMobileSidebar() {
			this.$store.dispatch("toggleSidebar", true);
		}
	}	
};
</script>