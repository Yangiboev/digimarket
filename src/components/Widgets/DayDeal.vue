<template>
	<div class="day-deal-wrap white section-gap">
		<v-container grid-list-xl pb-0>
			<v-layout row wrap>
				<v-flex xs12 sm12 md6 lg6 xl6>
					<router-link to="/products/men/103">
						<v-img
							alt="deal of the day"
							:src="selectedPreviewImage"
							aspect-ratio="1"
							max-width="900"
							max-height="800"
						/>
					</router-link>
				</v-flex>
				<v-flex xs12 sm12 md6 lg6 xl6 pl-5 deal-content>
					<div class="day-deal-content"> 
						<div class="mb-12">
							<h2 class="font-weight-regular mb-6">
								{{data.sectitle}}
							</h2>
							<h5 class="font-weight-regular">
								{{data.subtitle}}
							</h5>
							<p class="d-inline-block mr-1">
								<strike class="px-1"><emb-currency-sign class="font-color"></emb-currency-sign>42.46</strike>
							</p>
							<p class="accent--text d-inline-block sec-content">
								{{data.metaainfo}} <emb-currency-sign class="accent--text"></emb-currency-sign>36.00
							</p>
							<p>{{data.paragraph}}</p>
							<div  class="timer mb-6">
								<emb-timer 
									class="mb-4"
									starttime="Dec 1, 2018 15:37:25" 
									endtime="Dec 25, 2025 16:37:25" 
									trans='{  
										"day":"Day",
										"hours":"Hours",
										"minutes":"Minutes",
										"seconds":"Seconds",
										"expired":"Event has been expired.",
										"running":"Till the end of event.",
										"upcoming":"Till start of event.",
										"status": {
											"expired":"Expired",
											"running":"Running",
											"upcoming":"Future"
										}
									}'
								>
								</emb-timer>
							</div>
							<v-btn color="accent" to="/products/men/103">
								Shop Now
							</v-btn>
						</div>
						<v-layout row wrap cmx-0>
							<v-flex xs4 sm4 md4 lg4 xl4
								class="product-gallery" 
								v-for="(productImage,key) in data.productGallery"
								:key="key"
								@click="togglePreviewImage(productImage)"
							>
								<a href="javascript:void(0)">
									<v-img
										alt="deal of the day"
										class="emb-card"
										:src="productImage"
										aspect-ratio="0.8"
										max-width="217"
										max-height="217"
									/>
								</a>
							</v-flex>
						</v-layout>
					</div>
				</v-flex>
			</v-layout>
		</v-container>
	</div>
</template>

<script>
export default {
	props:['data'],
	data(){
		return{
			selectedPreviewImage: this.data.productGallery[0],
		}
	},
	methods: {
		/**
		 * method to toggle the image
		*/
		togglePreviewImage(image) {
			this.selectedPreviewImage = image;
		}
	}
}
</script>
