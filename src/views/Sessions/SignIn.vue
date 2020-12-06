<template>
	<div class="emb-signIn-wrap section-gap">
		<div class="container py-0">
			<v-layout row wrap align-center justify-center>
				<v-flex sm12 md12 lg8 xl7>
					<v-layout row mx-sm-0 mx-3 wrap align-center justify-center>
						<v-flex sm6 md7 lg6 xl6 hidden-sm-and-down>
							<div class="form-img sign-in-image"></div>
						</v-flex>
						<v-flex sm10 md5 lg5 xl6>
							<div class="emb-card sign-in-form form-margin d-block white pa-6">
								<h4>User Sign In</h4>
								<v-form>
									<v-text-field
										type="email"
										placeholder="Email*"
									>
									</v-text-field>
									<v-text-field
										type="password"
										placeholder="Password*"
									>
									</v-text-field>
									<div class="layout align-center justify-space-between">
										<v-checkbox
											v-model="checkbox"
											label="Remember Me"
										></v-checkbox>
										<router-link to="/session/forgot-password" class=" text-lg-right">Forgot Password ?</router-link>
									</div>
									<v-btn class="accent mb-3 ma-0" large to="/checkout/payment">
										Sign In
									</v-btn>
									<p>Don't Have account? <router-link to="/session/signup" class="accent--text">Click here to create one</router-link></p>
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
		data(){
			return{
				checkbox: false
			}
		}
	}
</script>	
