<template>
   <div class="edit-wrap" >
      <template v-if="$route.query.type == 'add-card' || $route.query.type =='edit-card'">
         <div class="edit-profile-wrap emb-card pa-4">
            <div class="card-info">
               <h4 v-if="$route.query.type =='add-card'"> Add Card Information</h4>
               <h4 v-else> Edit Card Information</h4>
               <v-form ref="form" v-model="valid">
                  <v-layout row wrap>
                     <v-flex xs12 sm12 md12 lg6 xl6>
                        <v-layout row wrap>
                           <v-flex xs12 sm12 md8 lg8 xl8>
                              <v-text-field label="Card Number" :rules="inputRules.basictextRules"></v-text-field>
                           </v-flex>
                           <v-flex xs12 sm12 md4 lg4 xl4>
                              <v-text-field label="CVV" :rules="inputRules.basictextRules"></v-text-field>
                           </v-flex>
                           <v-flex xs12 sm12 md12 lg12 xl12>
                              <v-text-field label="Name on Card" :rules="inputRules.basictextRules"></v-text-field>
                           </v-flex>
                           <v-flex xs12 sm12 md12 lg12 xl12 pb-0>
                              <label class="text-muted">Expiry Date</label>
                           </v-flex>
                           <v-flex xs12 sm12 md4 lg4 xl4>
                              <v-select :items="month" label="Month" :rules="inputRules.basictextRules"></v-select>
                           </v-flex>
                           <v-flex xs12 sm12 md4 lg4 xl4>
                              <v-select :items="year" label="Year" :rules="inputRules.basictextRules"></v-select>
                           </v-flex>
                           <v-flex xs12 sm12 md12 lg12 xl12>
                              <v-btn class="accent mx-0 mb-4" @click.stop.prevent="saveDetails">Save</v-btn>
                           </v-flex>
                        </v-layout>
                     </v-flex>
                     <v-flex xs12 sm12 md6 lg6 xl6 card-bg edit-profile hidden-md-and-down>
                     </v-flex>
                  </v-layout>
               </v-form>
            </div>
         </div>
      </template>
   </div>
</template>

<script>
	export default{
   	data () {
      	return {
         	valid: false,
          	inputRules: {
               basictextRules: [v => !!v || 'This field should not be empty']
            },
            month:['January','Febuary','March','April','May','June','July','August','September','October','November','December'],
            year:[2019,2020,2021,2022,2023,2024,2025,2026,2027]
         }
      },
      methods: {
         saveDetails(){
				this.$refs.form.validate();
            if(this.valid == true){
               this.$snotify.success('Your account Information Updated succesfully',{
                  closeOnClick: false,
                  pauseOnHover: false,
                  timeout: 1000,
                  showProgressBar:false,
               });
               setTimeout(() => {
                  this.$router.push({ path: '/account/profile' });
               }, 50);
            }
         }
      }
   }
</script>