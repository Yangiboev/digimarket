<template>
   <div class="lightening-deals-wrap section-gap pb-0">
      <v-container grid-list-xl>
         <div class="sec-wrap primary py-4 px-6">
            <div class="layout align-center c-layout justify-space-between pa-4">
               <div class="sec-title">
                  <h2 class="white--text mb-0 text-xxl">{{secTitle}}</h2>
               </div>
               <router-link to="/products"  class="white--text text-sm text-uppercase font-weight-medium">View all</router-link>
            </div>
         </div>
         <div class="shop-card-gap px-6">
            <v-layout row wrap>
               <v-flex xs12 sm6 md6 lg3 xl3 v-for="deals in data" :key="deals.id">
                  <div class="emb-card box-shadow-md pa-6 white">
                     <a href="javascript:void(0)">
                        <img :src="deals.image" alt="Product">
                     </a>
                     <div class="emb-card-content pt-4">
                        <h5>
                           <routerLink to="/products">{{deals.name}}</routerLink>
                        </h5>
                        <p>
                           <routerLink to="/products" class="text-muted">{{deals.category}}</routerLink>
                        </p>
                        <p class="accent--text  mb-0">{{deals.offer}}</p>
                     </div>
                  </div>
               </v-flex>
            </v-layout>
         </div>
      </v-container>
   </div>
</template>

<script>
export default {
   props: ['data','secTitle'],
}
</script>
