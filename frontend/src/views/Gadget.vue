<template>
	<div class="emb-gadget-wrap">
		<emb-page-title
			heading="Gadgets"
			subHeading="Checkout our new Gadgets."
		>
		</emb-page-title>
		<div class="gadget-content section-gap">	
			<ais-instant-search :search-client="searchClient" index-name="ikea">
				<v-container grid-list-xl py-0>
					<v-layout row wrap>
						<v-flex xs12 sm12 md4 lg3 xl3>
							<emb-sidebar-filters></emb-sidebar-filters>
						</v-flex>
						<v-flex xs12 sm12 md8 lg9 xl9>
							<product-items :cols="6" :colxl="4" :collg="4" :colmd="6" :colsm="6" :colxs="12"></product-items> 
						</v-flex>
					</v-layout>
			</v-container>
		</ais-instant-search>
		</div>	
	</div>
</template>

<script>
import AppConfig from "Constants/AppConfig";
import ProductItems from "Components/Ecommerce/ProductItems";
import SidebarFilters from 'Components/Ecommerce/SidebarFilters'
import algoliasearch from 'algoliasearch/lite';
import 'instantsearch.css/themes/algolia-min.css';

export default {
	components:{
		embSidebarFilters:SidebarFilters,
		ProductItems
	},
	data(){
		return{
				searchClient: algoliasearch(
         	'latency',
         	AppConfig.algoliaApiKey
        	)
		}
	}
}
</script>