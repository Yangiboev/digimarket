/**
 * App Entry File
 * Copyright 2018. All Rights Reserved
 */
/* eslint-disable */
import 'babel-polyfill'
import Vue from 'vue'
import vuetify from '@/plugins/vuetify'
import * as VueGoogleMaps from 'vue2-google-maps'
import Nprogress from 'nprogress'
import VueI18n from 'vue-i18n'
import Snotify, { SnotifyPosition } from 'vue-snotify'
import InstantSearch from 'vue-instantsearch'
import VueMoment from 'vue-moment'
import App from './App.vue'
import { store } from './store/store'
import AppConfig from 'Constants/AppConfig'

// localisation messages
import messages from './lang'

// global components
import GlobalComponents from './globalComponents'

//router 
import router from './router'

// all css files included
import './lib/EmbryoCss'

// Alliging Position for the toaster
const options = {
	toast: {
		position: SnotifyPosition.rightTop
	}
}

//plugins
Vue.use(VueMoment)
Vue.use(InstantSearch)
Vue.use(VueI18n)
Vue.use(Snotify, options)
Vue.use(VueGoogleMaps, {
	load: {
		key: "",
		libraries: "places"
	}
});
Vue.use(GlobalComponents)
// router navigation guards
router.beforeEach((to, from, next) => {
	Nprogress.start();
	next();
})

router.afterEach(() => {
	Nprogress.done();
	setTimeout(() => {
		const contentWrapper = document.querySelector("html");
		if (contentWrapper !== null) {
			contentWrapper.scrollTop = 0;
		}
	}, 200);
})

// creating a instance of vue localisation module
const i18n = new VueI18n({
	locale: store.getters.selectedLocale.locale,
	messages,
})


Vue.config.productionTip = false

new Vue({
	store,
	router,
	i18n,
	vuetify,
	render: h => h(App)
}).$mount('#app')