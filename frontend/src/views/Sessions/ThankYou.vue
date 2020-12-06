<template>
   <div class="emb-thankyou-wrap section-gap">
      <div class="container py-0">
         <div class="layout justify-center align-center">
            <v-flex sm12 md10 lg8 xl8>
               <div class="form-img thank-you-image text-center hidden-sm-and-down">
                  <h2 class="white--text">Thank You</h2>
               </div>
               <div class="layout align-center justify-center">
                  <v-flex xs12 md8 lg6 xl6>
                     <div 
                        class="emb-card pa-6
                           thankyou-block
                           white pa-6
                           text-center"
                     >
                        <h4 class="px-6 pb-2 text-center">For every thing you had done with Embryo</h4>
                        <v-divider class="pt-2 pb-4"></v-divider>
                        <div class="mx-auto text-center">
                           <p class="mb-4">Spread The Word</p>
                           <div class="mb-6 d-block"> 
                              <emb-social-share></emb-social-share>
                           </div>
                        </div>
                        <v-btn block class="accent elevation-5 my-0" height="50">Buy Embryo Now</v-btn>
                     </div>
                  </v-flex>
               </div>
            </v-flex>
         </div>
      </div>
   </div>
</template>