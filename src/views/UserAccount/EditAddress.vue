<template>   
   <div v-if="$route.query.type == 'address' || $route.query.type =='ship-address'">
      <div class="edit-address-wrap emb-card pa-4">   
			<h4 v-if="$route.query.type == 'ship-address'">Edit shipping Information</h4>
			<h4 v-else>Edit Billing Information</h4>
         <v-form ref="form" v-model="valid">
            <v-layout row wrap>
               <v-flex xs12 sm12 md12 lg6 xl6>
                  <v-layout row wrap>
                     <v-flex xs12 sm12 md12 lg12 xl12 py-2>
                        <v-text-field label="Address" :rules="inputRules.basictextRules"></v-text-field>
                     </v-flex>
                     <v-flex xs12 sm12 md12 lg12 xl12 py-2>
                        <v-text-field label="Buidling Name" :rules="inputRules.basictextRules"></v-text-field>
                     </v-flex>
                     <v-flex xs12 sm12 md12 lg12 xl12 py-2>
                        <v-text-field label="Street no" :rules="inputRules.basictextRules"></v-text-field>
                     </v-flex>
                     <v-flex xs12 sm12 md12 lg12 xl12 py-2>
                        <v-text-field label="State" :rules="inputRules.basictextRules"></v-text-field>
                     </v-flex>
                     <v-flex xs12 sm12 md12 lg12 xl12 py-2>
                        <v-text-field label="Zip Code/Pin Code " :rules="inputRules.basictextRules"></v-text-field>
                     </v-flex>
                     <v-flex xs12 sm12 md12 lg12 xl12 py-2>
                        <v-text-field label="Country" :rules="inputRules.basictextRules"></v-text-field>
                     </v-flex>
                     <v-flex xs12 sm12 md12 lg12 xl12 py-2>
                        <v-btn class="accent mx-0 mb-4"  @click.stop.prevent="saveDetails" type="billing">Save</v-btn>
                     </v-flex>
                  </v-layout>
               </v-flex>
               <v-flex xs12 sm12 md6 lg6 xl6 reciept-bg edit-profile hidden-md-and-down>
               </v-flex>
            </v-layout>
         </v-form>
      </div>
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
         }
      },
      methods: {
         saveDetails(){
				this.$refs.form.validate()
            if(this.valid == true){
               this.$snotify.success('Your account Information Updated succesfully',{
               closeOnClick: false,
               pauseOnHover: false,
               timeout: 1000,
               showProgressBar:false,
            });
            setTimeout(() => {
               this.$router.push({ path: '/account/address' });
            }, 50);
            
				}				
         }
      }
   }
</script>