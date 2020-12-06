<template>
	<div class="emb-feature-wrap">
		<div class="container">
			<v-layout row wrap white ma-1 emb-card>
				<v-flex xs12 sm12 md4 lg4
					class="feature-item pa-6"
					v-for="(feature,key) in data"
					:key="key"
				>
					<div class="emb-feature-content layout align-center pa-md-4">
						<div class="thumb-wrap mb-4 mb-md-0">
							<img :src="feature.image" width="50" height="50" alt="feature image">
						</div>
						<div class="features">
							<h6 class="font-weight-medium">{{feature.subTitle}}</h6>
							<h5 class="inline-block">{{feature.title}}</h5>
							<span class="grey--text">{{feature.desc}}</span>
						</div>
					</div>
				</v-flex>
			</v-layout>
		</div>
	</div>
</template>

<script>
	export default {
		props: ['data'],
	}
</script>