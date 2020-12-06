import Vue from "vue"
import Vuetify from "vuetify"
import AppConfig from 'Constants/AppConfig'
import 'vuetify/dist/vuetify.min.css'
import '@mdi/font/css/materialdesignicons.css'

Vue.use(Vuetify);

export default new Vuetify({
	theme: {
    themes: {
      light: {
			primary: AppConfig.color.primary,
			accent: AppConfig.color.accent,
			secondary: '#b0bec5',
			error: '#f44336',
			info:'#00D0BD',
			success:'#00D014'
      },
    },
  },
})