<template>
   <div class="cards-wrap emb-card pa-4">
      <div class="d-sm-flex align-center justify-space-between mb-sm-4 mb-6" >
         <h4>Saved Card Infomation</h4> 
         <router-link :to="{name: 'EditProfile', query: {type: 'add-card'}}" > <v-btn class="accent mx-0" >Add New Cards</v-btn></router-link>
      </div>
      <v-layout row wrap>
         <v-flex xs12 sm6 md6 lg5 xl5>
            <div class="emb-card pa-4">
               <h5>VISA -- Credit Card</h5>
               <div class="pt-4">
                  <div class="saved-card-box text-xl mb-6">
                     <span>4545 4XXX XXX5 4545</span>
                  </div>
                  <router-link :to="{name: 'EditProfile', query: {type: 'edit-card'}}" ><v-btn class="accent mx-0" >Edit</v-btn></router-link>
               </div>
            </div>
         </v-flex>
         <v-flex xs12 sm6 md6 lg5 xl5>
            <div class="emb-card pa-4">
               <h5>MasterCard -- Debit Card</h5>
               <div class="pt-4">
                  <div class="saved-card-box text-xl mb-6">
                     <span>8585 8XXX XXX5 8585</span>
                  </div>
                  <router-link :to="{name: 'EditProfile', query: {type: 'edit-card'}}" ><v-btn class="accent mx-0" >Edit</v-btn></router-link>
               </div>
            </div>
         </v-flex>
      </v-layout>
   </div>
</template>