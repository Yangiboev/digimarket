<template>
   <div class="address-block-wrap emb-card pa-4">
      <h4 class="mb-6">Address Infomation</h4>
      <v-layout row wrap>
         <v-flex xs12 sm5 md5 lg5 xl5>
            <h5>Billing Address</h5>
            <div class="pt-4">
               <address class="mb-6">
                     2735  Sherman Street<br>
                     Hodour Sheridan Plaza<br>
                     New Jersey<br>
                     Zip - 6739HG1<br>
                     USA<br>
               </address>
                 <router-link :to="{name: 'EditAddress', query: {type: 'address'}}" > <v-btn class="accent mx-0">Edit</v-btn></router-link>
            </div>
         </v-flex>
         <v-flex xs12 sm5 md5 lg5 xl5>
            <h5>Shipping Address</h5>
            <div class="pt-4">
               <address class="mb-6">
                     2735  Sherman Street<br>
                     Hodour Sheridan Plaza<br>
                     New Jersey<br>
                     Zip - 6739HG1<br>
                     USA<br>
               </address>
               <router-link :to="{name: 'EditAddress', query: {type: 'ship-address'}}" ><v-btn class="accent mx-0" >Edit</v-btn></router-link>
            </div>
         </v-flex>
      </v-layout>
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
					this.$store.dispatch("addUserDetails", this.userInfo);
				}				
			}
		}
   }
</script>