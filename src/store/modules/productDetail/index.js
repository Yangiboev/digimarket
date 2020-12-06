import { products } from "./data";
import api from 'Api'

const state = {
   products,
   selectedProduct: null
}

// getters
const getters = {
   products: state => {
      return state.products
   },
   selectedProduct: state => {
      return state.selectedProduct
   }
}

// actions 
const actions = {
   changeSelectedProduct(context, payload) {
      context.commit('selectProductHandler', payload);
   },
   getProducts(context) {
      context.commit('getProductsHandler')
   }
}

// mutations
const mutations = {
   getProductsHandler() {
      api
         .get("products.json")
         .then(response => {
            state.products = response.data;
            // console.log(state.products);s
         })
         .catch(error => {
            console.log(error);
         });
   },
   selectProductHandler(state, category) {
      state.selectedProduct = category;
   }
}

export default {
   state,
   getters,
   actions,
   mutations
}
