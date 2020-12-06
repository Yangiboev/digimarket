<template>
   <div class="image-group pt-sm-12 ">
      <v-container grid-list-xl>
         <v-layout row wrap >
            <v-flex xs12 sm12 md6 lg4 xl4  v-for="item in data" :key="item.id">
               <div class="img-wrap">
                  <router-link :to="item.path">
                     <img :src="item.image" alt="product">
                  </router-link>
               </div>
            </v-flex>
         </v-layout>
      </v-container>
   </div> 
</template>

<script>
export default {
   props: ['data'],
}
</script>