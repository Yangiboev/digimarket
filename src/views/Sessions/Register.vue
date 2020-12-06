<template>
	<div class="emb-register-wrap section-gap">
		<div class="container py-0">
			<v-layout row wrap align-center justify-center>
				<v-flex sm12 md12 lg8 xl7>
					<v-layout row mx-sm-0 mx-3  wrap align-center justify-center>
						<v-flex sm6 md7 lg6 xl6 hidden-sm-and-down>
							<div class="form-img register-image"></div>
						</v-flex>
						<v-flex sm10 md5 lg6 xl6>
							<div class="emb-card sign-in-form form-margin d-block white pa-6">
								<h4>Enter Your Details</h4>
								<v-form ref="form" v-model="valid">
									<v-text-field
										type="text"
										placeholder="First Name*"
										:rules="inputRules.basictextRules"
									>
									</v-text-field>
									<v-text-field
										type="text"
										placeholder="Last Name*"
										:rules="inputRules.basictextRules"
									>
									</v-text-field>
									<v-text-field
										type="email"
										placeholder="Email*"
										:rules="emailRules"
									>
									</v-text-field>
									<v-text-field
										type="password"
										placeholder="Enter Password*"
										:rules="inputRules.basictextRules"
									>
									</v-text-field>
									<v-text-field
										class="mb-4"
										type="password"
										placeholder="Retype Passowrd*"
										:rules="inputRules.basictextRules"
									>
									</v-text-field>
									<v-btn class="accent mx-0 mb-4" large  @click.stop.prevent="saveDetails">
										Sign Up
									</v-btn>
									<p>Already have account? then<router-link to="/session/signin" class="accent--text"> Sign In</router-link></p>
								</v-form>
							</div>
						</v-flex>
					</v-layout>
				</v-flex>
			</v-layout>
		</div>
   </div>
</template>
	
<script>
	export default{
   	data () {
      	return {
         	valid: false,
				emailRules: [
					v => !!v || 'E-mail is required',
					v => /.+@.+/.test(v) || 'E-mail must be valid'
      		],
          	inputRules: {
               basictextRules: [v => !!v || 'This field should not be empty']
            }
         }
      },
      methods: {
         saveDetails(){
				this.$refs.form.validate();
				if(this.valid == true){
					this.$router.go('/session/signup');
            }	
			}
		}
	}
</script>