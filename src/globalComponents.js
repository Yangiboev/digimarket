/**
 * VueShop Global Components
 */
import HeaderV2 from './components/Layouts/Header/HeaderV2.vue';
import FixedHeader from './components/Layouts/Header/FixedHeader.vue';
import FooterV1 from './components/Layouts/Footer/FooterV1.vue';
import SocialShare from './components/Global/SocialShare';
import CurrencySign from './components/Global/CurrencySign';
import DeleteConfirmationDialog from './components/Global/DeleteConfirmationDialog';
import GoogleMap from "./components/Global/GoogleMap";
import PageTitle from './components/Global/PageTitle';
import ReviewPopup from './components/Global/ReviewPopup';
import Sidebar from './components/Layouts/Sidebar/Sidebar';
import SidebarPanel from './components/Global/SidebarPanel';
import Timer from './components/Global/Timer';
import AppCard from 'Components/AppCard/AppCard';
import DeleteConfirmationDialog2 from './components/Global/DeleteConfirmationDialog2';
import VuePerfectScrollbar from 'vue-perfect-scrollbar';


const GlobalComponents = {
   install(Vue) {
      Vue.component('embHeaderV2', HeaderV2);
      Vue.component('embFixedHeader', FixedHeader);
      Vue.component('embFooterV1', FooterV1);
      Vue.component('embSocialShare', SocialShare);
      Vue.component('embCurrencySign', CurrencySign);
      Vue.component('embDeleteConfirmation', DeleteConfirmationDialog);
      Vue.component('embGoogleMap', GoogleMap);
      Vue.component('embPageTitle', PageTitle);
      Vue.component('embReviewPopup', ReviewPopup);
      Vue.component('embSidebar', Sidebar);
      Vue.component('embSidebarPanel', SidebarPanel);
      Vue.component('embTimer', Timer);
      Vue.component('appCard', AppCard);
      Vue.component('embDeleteConfirmation2', DeleteConfirmationDialog2);
      Vue.component('embPerfectScrollbar', VuePerfectScrollbar);
   }
}

export default GlobalComponents