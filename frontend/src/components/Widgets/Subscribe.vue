<template>
	<div class="emb-subscribe-wrap section-gap">
		<v-container grid-list-xl py-0>
			<v-layout row wrap align-center justify-space-between >
				<v-flex xs12 sm12 md8 lg8 xl8>
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
				</v-flex>
				<v-flex xs12 sm12 md4 lg3 xl2>
					<div class="form-wrapper">
						<v-text-field
							dark
							color="white"
							class="mt-0 pt-0"
							v-model="email"
							label="Your email address"
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

