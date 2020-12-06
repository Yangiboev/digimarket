import api from 'Api'
// const headers = {
//   'Content-Type': 'application/json'
// }
const all = {
    state: {
      allproducts: [],
      pagination_allproducts: {},
    },
    getters: {
      pagination_allproducts: state => state.pagination_allproducts,
      allproducts: state => state.allproducts,
    },
    mutations: {
        GET_PRODUCTS: (state, allproducts) => {
            state.allproducts = allproducts
        },
        GET_PRODUCTS_PAGINATION: (state, pagination) => {
        state.pagination_allproducts = pagination
        }
    },
    actions: {
      getAllProducts ({ commit }) {
        return new Promise((resolve, reject) => {
          api({
              url: '/product',
              method: 'get',
          })
          .then(result => {
          commit('GET_PRODUCTS', result.data.data)
          resolve()
        })
        .catch(error => {
          reject(error)
        })
      })
    }
  }
}
export default all
