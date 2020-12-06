<template>
	<div class="subscribe-wrap-v2 section-gap primary">
		<v-container grid-list-xl py-0>
         <div class="center-icon">
            <i class="material-icons">check_box</i>
         </div>
         <v-layout row wrap align-center justify-center>
            <v-flex xs12 sm9 md7 lg5 xl4>    
					<div class="subscribe-content">
						<div>
							<h3 class="white--text">
								{{heading}}
							</h3>
							<p class="white--text">
								{{description}}
							</p>
						</div>
					</div>
					<div class="form-wrapper">
						<v-text-field
							dark
							color="white"
							class="mt-0 pt-0"
							v-model="email"
							label="Your Email Address"
							required
						>
						</v-text-field>
						<a heref="javascript:void(0)" class="send-icon"><i class="material-icons white--text">send</i></a>
					</div>
            </v-flex>
         </v-layout>
		</v-container>
	</div>
</template>

<script>
	export default {
		props:['heading','description'],
		data () {
			return{
				email: '',
				emailRules: [
					v => /.+@.+/.test(v) || 'E-mail must be valid'
				]
			}
		}
	}
</script>

