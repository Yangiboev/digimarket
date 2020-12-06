<template>
	<div class="feature-v2-wrap section-gap overlay-section  pb-0">
		<v-container grid-list-xl>
			<v-layout row wrap>
				<v-flex xs12 sm12 md4 lg4 xl4 v-for="(feature,key) in data" :key="key">
					<div class="emb-card pa-4">
						<div class="feature-section-v2-list">
							
								<v-btn  class="primary medium mx-0" icon>
									<v-icon>{{feature.icon}}</v-icon>
								</v-btn>
							
							<div class=" ml-6 feature-section-v2-content">
								<h4 class="mb-2 font-weight-bold">{{feature.subTitle}}</h4>
								<p class="mb-0">{{feature.desc}}</p>
							</div>
						</div>
					</div>
				</v-flex>
			</v-layout>
		</v-container>
	</div>
</template>
<script>
	export default {
		props: ['data'],
	}
</script>