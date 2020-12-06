//-----------------------| Sidebar Module |-------------------//

import { menus, adminPanelMenus } from './data.js';

const state = {
	menus,
	adminPanelMenus,
	sidebarOpen: false
}

const getters = {
	menus: state => {
		return state.menus;
	},
	adminPanelMenus: state => {
		return state.adminPanelMenus;
	},
	sidebarOpen: state =>{
		return state.sidebarOpen;
	}
}

const actions = {
   toggleSidebar(context, payload) {
      context.commit('toggleSidebarHandler', payload);
   },
	changeActiveMenu(context, payload) {
      context.commit('changeActiveMenuHandler', payload);
   },
}

const mutations = {
	toggleSidebarHandler(state, payload) {
	  state.sidebarOpen = payload;
	},
	changeActiveMenuHandler(state, payload) {
		var sidebarMenus = state.adminPanelMenus;
		for( let i = 0; i < sidebarMenus.length; i++){
			let index = sidebarMenus.indexOf(payload);
			if(i == index){
				sidebarMenus[i].active = true
			}else{
				sidebarMenus[i].active = false;
			}
		}
	},
}

export default {
	state,
	getters,
	actions,
	mutations
}