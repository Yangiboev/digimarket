<template>
	<div class="emb-detailOffer-wrap">
		<div class="offer-list">
			<v-layout row wrap>
				<v-flex xs12 sm12 md12 lg4 xl4>
					<router-link to="/products/women">
						<div class="overlay-wrap">
							<a href="javascript:void(0)">
								<img alt="Sale Call In Action" class="w-100" src="static/images/sale-1.jpg" width="640" height="430">
							</a>
							<div class="overlay-content primary-rgba">
								<div>
									<h2>Sale</h2>
									<h5>Women collection</h5>
									<h3>50% Off</h3>
								</div>
							</div>
					  </div>
					</router-link>
				</v-flex>
				<v-flex xs12 sm12 md12 lg4 xl4>
					<router-link to="/products">
						<div class="overlay-wrap">
								<a href="javascript:void(0)">
									<img alt="Sale Call In Action" class="w-100" src="static/images/sale-2.jpg" width="640" height="430">
								</a>
								<div class="overlay-content black-rgba">
									<div>
										<h6 class="">New Arrival</h6>
										<h2 class="font-weight-regular">Flat 50</h2>
										<h5 class="">Discount</h5>
									</div>
								</div>
						  </div>
					</router-link>
				</v-flex>
				<v-flex xs12 sm12 md12 lg4 xl4>
					<router-link to="/products/men">
						<div class="overlay-wrap">
								<a href="javascript:void(0)">
									<img alt="Sale Call In Action" class="w-100" src="static/images/sale-3.jpg" width="640" height="430">
								</a>
								<div class="overlay-content pink-rgba">
									<div>
										<h2>Sale</h2>
										<h5>Men's collection</h5>
										<h3>50% Off</h3>
									</div>
								</div>
						  </div>
					</router-link>
				</v-flex>
			</v-layout>
		</div>
	</div>
</template>
