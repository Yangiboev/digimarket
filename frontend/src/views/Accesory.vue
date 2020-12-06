<template>
	<div class="emb-accesories-wrap">
		<emb-page-title
			heading="Accessories"
			subHeading="Choose the wide range of best accessories. "
		>
		</emb-page-title>
		<div class="accesories-content section-gap">	
			<ais-instant-search :search-client="searchClient" index-name="ikea">
				<v-container grid-list-xl py-0>
					<v-layout row wrap>
						<v-flex xs12 sm12 md4 lg3 xl3>
							<emb-sidebar-filters></emb-sidebar-filters>
						</v-flex>
						<v-flex xs12 sm12 md8 lg9 xl9>
							<product-items></product-items>   
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