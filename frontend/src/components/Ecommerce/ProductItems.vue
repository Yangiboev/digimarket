<template>
	<div class="shop-content-wrap">
		<div class="shop-header">
			<v-layout row wrap my-0 align-center>
				<v-flex xs12 sm12 md12 lg7 xl7 py-0 cpx-7 mb-4>
					<div class="d-sm-flex">
						<div class="app-selectbox-sm">
							<ais-sort-by
							  :items="[
								 { value: 'ikea', label: 'Default' },
								 { value: 'ikea_price_asc',label: 'Lowest price'},
								 { value: 'ikea_price_desc',  label: 'Highest price'},
							  ]"
							/>
						</div>
						<div class="app-selectbox-sm ml-sm-4 mt-sm-0 mt-6">
							<ais-hits-per-page
							  :items="[
										{ label: '8 hits per page', value: 8, default: true },
										{ label: '12 hits per page', value: 12},
										{ label: '15 hits per page', value: 16 },
									]"
							  />
						</div>
					</div>
				</v-flex>
				<v-flex xs12 sm12 md12 lg5 xl5 cpx-7 py-0 pr-0 mb-4>
					<div class="text-lg-right">
						<ais-stats></ais-stats>
					</div>
				</v-flex>
			</v-layout>
		</div>
		<ais-hits class="mb-4" :results-per-page="9">
        <template slot="item" slot-scope="{ item }">
          <product-item :data="item"></product-item>
        </template>
      </ais-hits>
		<div class="pagination-wrap pt-2">
			<ais-pagination class="mb-6" :classNames="{
					'ais-pagination': 'pagination',
					'ais-pagination__item': 'pagination__item',
					'ais-pagination__item--active': 'pagination__item--active accent',
					'ais-pagination__item--previous': 'pagination__navigation',
					'ais-pagination__item--next': 'pagination__navigation',
					'ais-pagination__item--disabled': 'disabled'
				}" v-on:page-change="onPageChange" />
		</div>
	</div>
</template>

<script>
	import {mapGetters, mapActions} from "vuex"
	import ProductItem from "./ProductItem";

	export default {
		components: {
			ProductItem
		},
		mounted () {
			this.getProducts()
		},
		computed: {
			...mapGetters(['products'])
		},
		methods: {
			...mapActions(['getProducts']),
			onPageChange() {
				window.scrollTo(0, 0);
			}
		}
	};
</script>