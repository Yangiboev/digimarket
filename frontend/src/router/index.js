import Vue from 'vue'
import Router from 'vue-router'

import userRoutes from './user';
// import adminRoutes from './admin';
const NotFound = () => import('Views/NotFound.vue');

Vue.use(Router)

export default new Router({
	mode: 'history',
	routes: [
		userRoutes,
		{ 
			path: '*',
			component: NotFound, 
			name:'NotFound'
		},
	]
})

