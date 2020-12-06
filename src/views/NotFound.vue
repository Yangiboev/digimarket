<template>
   <div>
      <div class="headers">
         <emb-header-v1  v-if="$route.meta.header != 2 && $route.meta.header != 3 "></emb-header-v1>
      </div>
      <div class="emb-notFound-wrap section-gap">
         
         <div class="container">
            <div class="layout align-center justify-center">
               <v-flex xs12 sm9 md6 lg5 xl5>
                  <div class="emb-card text-center pb-12 pa-6">
                     <h1>404</h1>
                     <h5 class="mb-4">We can’t seem to find the page you’re looking for.</h5>
                     <v-btn block class="accent" to="/">Go To Home</v-btn>
                  </div>
               </v-flex>
            </div>
         </div>
      </div>
      <emb-footer-V1
            title="About company"
            description=" Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam quo nesciunt pariatur laboriosam accusantium? Doloremque fugit unde explicabo consequuntur aliquid laudantium id voluptatum? Saepe earum, suscipit ex quos eius natus. "
            img="/static/images/cards.png"
            >
         </emb-footer-V1>
   </div>
</template>