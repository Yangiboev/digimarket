<template>
   <div class="image-group pt-sm-12 ">
      <v-container grid-list-xl>
         <v-layout row wrap >
            <v-flex xs12 sm12 md6 lg4 xl4  v-for="item in data" :key="item.id">
               <div class="img-wrap">
                  <router-link :to="allproducts[0].id">
                     <img :src="item.image" alt="product">
                  </router-link>
               </div>
            </v-flex>
         </v-layout>
      </v-container>
   </div> 
</template>

<script>
import {mapGetters} from 'vuex'
export default {
   props: ['data'],
   computed: {
      ...mapGetters('allproducts')
   }
}
</script>