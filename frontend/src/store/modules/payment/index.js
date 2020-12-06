const state = {
   userDetails: null,
   couponCode: null
}

// getters
const getters = {
   userDetails: state => {
      return state.userDetails;
   },
   couponCode:state =>{
      return state.couponCode;
   }
}

// actions
const actions = {
   addUserDetails(context, payload) {
      context.commit('onAddedUserDetails', payload);
   },
   enterCouponCode(context,payload){
      context.commit('onEnteredCouponCode',payload);
   }
}

// mutations
const mutations = {
   /**
    * This function sets the value for the panel (open up the promo code expansion panel)
   **/
   onAddedUserDetails(state, payload) {
      state.userDetails = payload;
   },
   /**
    * This function sets the value for the panel (open up the payment option expansion panel)
   **/
   onEnteredCouponCode(state,payload){
      state.couponCode = payload;
   }
}

export default {
   state,
   getters,
   actions,
   mutations,
}