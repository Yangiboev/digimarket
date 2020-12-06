<template>
   <v-dialog
      class="mb-4"
      v-model="dialog"
      max-width="80vw"
      height="200%"
   >
      <v-card class="review-popup white pt-4">
         <v-container container-fluid grid-list-xl>
            <v-layout row wrap justify-space-between>
               <v-flex xs12 sm12 md9 lg9 xl9>
                  <h4 class="primary--text">Blue Jean</h4>
                  <p>Ipsum dolor sit amet consectetur, adipisicing elit. Distinctio aperiam debitis ipsa veniam eos quas excepturi quae? Recusandae distinctio nihil quia quis, eaque aspernatur perferendis repudiandae adipisci labore, impedit beatae!</p>
                  <h3 class="cmx-5"><v-rating v-model="rating" color="#edb867" readonly></v-rating></h3>
                  <h5>5 Reviews</h5>
               </v-flex>
               <v-flex xs12 sm12 md3 lg3 xl3 add-later-btn>
                  <v-btn class="accent" large @click="dialog = false">Add Later</v-btn>
               </v-flex>
            </v-layout>
            <v-divider class="my-6"></v-divider>
            <v-layout row wrap>
               <v-flex xs12 sm12 md12 lg6 xl6>
                  <div class="user-list">
                     <v-layout row wrap v-for="(review,key) in testimonialData" :key="key">
                        <v-flex xs8 sm8 md8 lg2 xl2>
                           <img class="br-100" :src="review.img" width="90" alt="Review user">
                        </v-flex>
                        <v-flex xs12 sm12 md12 lg10 xl10>
                           <h6>{{review.name}}</h6>
                           <div class="star"></div>
                           <span>{{review.duration}}</span>
                           <p>{{review.desc}}.</p>
                        </v-flex>
                     </v-layout>
                  </div>
               </v-flex>
               <v-flex xs12 sm12 md12 lg6 xl6>
                  <h4>Rate and Review</h4>
                  <form class="example-form">
                     <v-text-field placeholder="Your Name"></v-text-field>
                     <v-text-field placeholder="Write Review"></v-text-field>
                     <v-btn class="accent" large>Post Review</v-btn>
                  </form>
               </v-flex>
            </v-layout>
         </v-container>
      </v-card>
   </v-dialog>
</template>

<script>
export default {
   data () {
      return {
         rating:5,
         dialog: false,
         /**
          * testimonial slider
         */
         testimonialData:[
            {
               img:"/static/images/user-1.jpg",
               name:"Michael Trovolto",
               duration:"a year ago",
               desc:"I love the way it has delivered to me and after using ,i just wanna say one word that is awesome"
            },
            {
               img:"/static/images/user-2.jpg",
               name:"Mathew Winshier",
               duartion:"a month ago",
               desc:"I love the way it has delivered to me and after using ,i just wanna say one word that is awesome"
            },
            {
               img:"/static/images/user-3.jpg",
               name:"Olivia Paulline",
               duartion:"a month ago",
               desc:"I love the way it has delivered to me and after using ,i just wanna say one word that is awesome"
            },
            {
               img:"/static/images/user-5.jpg",
               name:"Anulipew Wiskender",
               duartion:"two month ago",
               desc:"I love the way it has delivered to me and after using ,i just wanna say one word that is awesome"
            },
         ]
      }
   },
   methods: {
   	/**
		 * This function opens the popup
		**/
      open() {
         this.dialog = true
      },
      /**
		 * This function close the popup
		**/
      close() {
         this.dialog = false
      }
   }
}
</script>