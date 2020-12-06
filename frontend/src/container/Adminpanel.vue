<template>
	<div class="admin-panel">
      <vue-snotify></vue-snotify>
      <v-navigation-drawer
         v-model="drawer"
         app
         class="primary"
			:right="rtlLayout"
			width="230"
			>
			<div class="site-logo py-4 mb-12">
				<router-link to="/" class="d-block text-center">
					<img alt="site-logo" height="34" :src="appLogo" width="160">
				</router-link>
			</div>
         <v-list dense class="admin-menu-wrap">
            <template v-for="(menuItem , key) in adminPanelMenus">
					<template v-if="menuItem.children == null">
						<v-list-item :key="key" :to="menuItem.path" :class="menuItem.active" @click="updateSidebarMenu(menuItem)">
							<v-list-item-action class="ma-0">
								<v-icon>{{menuItem.icon}}</v-icon>
							</v-list-item-action>
							<v-list-item-content class="py-0 text-left pl-3">
								<v-list-item-title >{{$t(menuItem.name)}}</v-list-item-title>
							</v-list-item-content>
						</v-list-item>
					</template>
					<template v-else>
						<v-list-group
							:key="key"
							no-action
							v-model="menuItem.active"
							:prepend-icon="menuItem.icon"
							append-icon='keyboard_arrow_down'
						>
							<template v-slot:activator>
								<v-list :to="menuItem.path">
									<v-list-item-content class="py-0 text-left pl-3">
										<v-list-item-title>
											<span>{{ $t(menuItem.name) }}</span>
										</v-list-item-title>
									</v-list-item-content>
								</v-list>
							 </template>
							<template v-if="menuItem.children != null">
								<v-list-item
									@click="updateSidebarMenu(menuItem)"
									v-for="(subItem,index) in menuItem.children"
									v-bind:key="index"
									:to="subItem.path"
								>
									<v-list-item-content>
										<v-list-item-title class="white--text">
											{{ $t(subItem.name) }}
										</v-list-item-title>
									</v-list-item-content>	
								</v-list-item>
							</template>
						</v-list-group>
					</template>
            </template>
         </v-list> 
      </v-navigation-drawer>

      <v-app-bar color="white" dark app class="admin-panel-toolbar">
			<!-- <v-app-bar-nav-icon @click.stop="drawer = !drawer" class="primary ml-0" fab dark small></v-app-bar-nav-icon> -->
			<v-btn class="mx-2" fab dark small color="primary"  @click.stop="drawer = !drawer">
				<v-icon dark>menu</v-icon>
			</v-btn>
			<div class="d-inline-flex align-center ">
				<div class="options mr-4">
					<emb-lang></emb-lang>
				</div>
				<div class="notifications">
					<emb-user-block :data="userLinks"></emb-user-block>
				</div>
			</div>
      </v-app-bar>
     
      <v-content>
         <v-container fill-height container-fluid>
				<v-layout
					justify-center
					align-center
					class="py-6 px-sm-2"
				>
					<v-flex>
					<router-view></router-view>
					</v-flex>
				</v-layout>
         </v-container>
      </v-content>
   </div>
</template>

<script>
   
import UserBlock from 'Components/Layouts/Header/UserBlock'
import Lang from 'Components/Layouts/Header/Lang'
import AppConfig from "Constants/AppConfig";
import { mapGetters } from 'vuex';
export default {
   data (){
      return{   
         appLogo: AppConfig.appLogo,
         drawer: null,
         userLinks: [
            {
               icon:'account_circle',
               title: 'Profile',
               path:"/admin-panel/account/profile"
            },
            {
               icon:'settings',
               title:'Account Settings',
               path:"/admin-panel/account/settings"
            },
            { 
               icon:'power_settings_new',
               title: 'LogOut',
               path:"/session/signin"
            }
         ]
      }
   },
   computed:{
      ...mapGetters(["adminPanelMenus","rtlLayout"])
   },
	methods:{
		updateSidebarMenu(currentMenu){
			this.$store.dispatch('changeActiveMenu', currentMenu);
		}
	},
   components:{
      embUserBlock:UserBlock,
      embLang: Lang
   },
}
</script>