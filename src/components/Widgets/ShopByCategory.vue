<template>
   <div class="category-v2-wrapper bg-grey section-gap">
      <v-container grid-list-xl>
         <div class="sec-title">
            <h3 class="font-weight-light">{{secTitle}}</h3>
         </div>
         <v-layout row wrap>
            <v-flex xs12 sm6 md3 lg3 xl3 category-v2-list v-for="product in data" :key="product.id">
               <div class="overlay-section-overlay category-v2-list-wrap">
                  <img :src="product.image" alt="category">
                  <div class="category-v2-content">
                     <h4 class="white--text">
                        <router-link to="/products" class="white--text text-capitalize">{{product.category}}</router-link>
                     </h4>
                     <p class="mb-0 white--text">{{product.total}}</p>
                  </div>
               </div>
            </v-flex>
         </v-layout>
      </v-container>
   </div>
</template>

<script>
export default {
   props: ['data','secTitle'],
}
</script>

