<template>
	<div class="emb-forgetpassword-wrap section-gap">
		<div class="container py-0">
			<v-layout row wrap align-center justify-center>
				<v-flex sm12 md12 lg8 xl8>
					<v-layout align-center mx-sm-0 mx-3  justify-center row wrap>
						<v-flex sm6 md6 lg6 xl6 hidden-sm-and-down>
							<div class="forgot-password-image form-img">
							</div>
						</v-flex>
						<v-flex sm10 md6 lg6 xl6 class="emb-card form-margin pa-4 d-inline-block white">
							<h3 class="accent--text">Forgot Password ?</h3>
							<h4>No Problem</h4>
							<v-form ref="form" v-model="valid">
								<v-text-field type="email" :rules="emailRules" placeholder="Enter Your Email*">
								</v-text-field>
								<v-text-field class="mb-4" type="email" :rules="emailRules" placeholder="Retype Your Email*">
								</v-text-field>
								<v-btn class="accent mb-4 ma-0" large @click.stop.prevent="saveDetails">
									Submit
								</v-btn>
								<p>If have an account then <router-link to="/session/signin" class="accent--text">Sign In
									</router-link>
								</p>
							</v-form>
						</v-flex>
					</v-layout>
				</v-flex>
			</v-layout>
		</div>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				valid: false,
				emailRules: [
					v => !!v || 'E-mail is required',
					v => /.+@.+/.test(v) || 'E-mail must be valid'
				]
			}
		},
		methods: {
			saveDetails() {
				this.$refs.form.validate();
				if (this.valid == true) {
					this.$router.go('/session/forgot-password');
				}
			}
		}
	}
</script>