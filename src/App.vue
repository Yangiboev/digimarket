<template>
	<v-app>		
		<router-view></router-view>
	    <!-- <div class="rtl-layout" @click="toggleRTLLayout"> -->
	      <!-- <a class="text-xl" href="javascript:void(0);">RTL</a> -->
	    <!-- </div>		 -->
	</v-app>
</template>

<script>
import { mapGetters } from "vuex";
export default {
	computed: {
		...mapGetters(["rtlLayout"]),
		mobileMenu: {
			get() {
				return this.$store.getters.sidebarOpen;
			},
			set(val) {
				this.$store.dispatch("toggleSidebar", val);
			}
		}
	},
	/**
	 * Method To set the Rtl While page is opened
	*/
	mounted() {
		if(this.rtlLayout) {
			this.$vuetify.rtl = this.rtlLayout;
		}
	},
	methods: {
		/**
		 * Method To Toggle The RTL Layout
		 */
		toggleRTLLayout() {
			this.$vuetify.rtl = !this.rtlLayout;
			this.$store.dispatch("changeRtlLayout");
		},
	}
}
</script>


