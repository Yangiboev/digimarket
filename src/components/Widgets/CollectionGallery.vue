<template>
   <div class="collection-gallery-wrap section-gap overlay-section">
      <v-container grid-list-xl>
         <v-layout row wrap>
            <v-flex xs12 sm12 md4 lg3 xl3>
               <div class="main-bg overlay-section-item overlay-section-overlay relative" style="background-image: url('static/images/collection.jpg');background-size:cover;">
                  <div class="end-left">
                     <div class="overlay-section-content">
                        <h4 class="mb-0 font-bold">Latest Collections</h4>
                        <h4 class=" text-xxl font-normal mb-4">Save Upto 60%</h4>
                        <v-btn class="ma-0" to='/products'>SHOP NOW</v-btn>
                     </div>
                  </div>
               </div>
            </v-flex>
            <v-flex xs12 sm12 md8 lg9 xl9>
               <v-layout row wrap>
                  <v-flex xs12 sm12 md6 lg6 xl6>
                     <div class="main-bg-inner overlay-section-item overlay-section-overlay relative" style="background-image: url('static/images/col-men.jpg')">
                        <div class="end-left">
                           <div class="overlay-section-content">
                           <h4 class="mb-0 font-bold">Men's Collections</h4>
                           <h4 class=" text-xxl font-normal mb-4">Save Upto 50%</h4>
                           <v-btn class="ma-0"  to='/products'>SHOP NOW</v-btn>
                           </div>
                        </div>
                     </div>
                  </v-flex>
                  <v-flex xs12 sm12 md6 lg6 xl6>
                     <div class="main-bg-inner overlay-section-item overlay-section-overlay relative" style="background-image: url('static/images/col-women.jpg')">
                        <div class="end-left">
                           <div class="overlay-section-content">
                           <h4 class="mb-0 font-bold">Women's Collections</h4>
                           <h4 class=" text-xxl font-normal mb-4">Save Upto 50%</h4>
                           <v-btn class="ma-0"  to='/products'>SHOP NOW</v-btn>
                           </div>
                        </div>
                     </div>
                  </v-flex>
                  <v-flex xs12 sm12 md6 lg6 xl6>
                     <div class="main-bg-inner overlay-section-item overlay-section-overlay relative" style="background-image: url('static/images/col-watches.jpg');background-size:cover;">
                        <div class="end-left">
                           <div class="overlay-section-content">
                              <h4 class="mb-0 font-bold">Watches Collections</h4>
                              <h4 class=" text-xxl font-normal mb-4">Save Upto 60%</h4>
                              <v-btn class="ma-0"  to='/products'>SHOP NOW</v-btn>
                           </div>
                        </div>
                     </div>
                  </v-flex>
                  <v-flex xs12 sm12 md6 lg6 xl6>
                     <div class="main-bg-inner overlay-section-item overlay-section-overlay relative" style="background-image: url('static/images/col-accessories.jpg');background-size:cover;">
                        <div class="end-left">
                           <div class="overlay-section-content">
                              <h4 class="mb-0 font-bold">Accessories Collections</h4>
                              <h4 class=" text-xxl font-normal mb-4">Save Upto 60%</h4>
                              <v-btn class="ma-0"  to='/products'>SHOP NOW</v-btn>
                           </div>
                        </div>
                     </div>
                  </v-flex>
               </v-layout>
            </v-flex>
         </v-layout>
      </v-container>
   </div>
</template>
