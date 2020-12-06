<template>
  <v-app>
    <vue-snotify></vue-snotify>    
    <div class="headers">
      <emb-header-v1  v-if="$route.meta.header != 2 && $route.meta.header != 3 "></emb-header-v1>
      <emb-header-v2  v-if="$route.meta.header === 2"></emb-header-v2>
      <emb-header-v3  v-if="$route.meta.header === 3"></emb-header-v3>
    </div>

    <!-- Menu for mobile -->
    <v-navigation-drawer v-model="mobileMenu" temporary absolute dark class="sidebar-bg">
      <emb-sidebar></emb-sidebar>
    </v-navigation-drawer>    
    <router-view></router-view>
    <emb-footer-V1
      title="About company"
      description=" Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam quo nesciunt pariatur laboriosam accusantium? Doloremque fugit unde explicabo consequuntur aliquid laudantium id voluptatum? Saepe earum, suscipit ex quos eius natus. "
      img="/static/images/cards.png"
      >
    </emb-footer-V1>
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