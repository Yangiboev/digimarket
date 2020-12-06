<template>
	<div class="emb-gadget-wrap">
		<emb-page-title v-if="$route.name == 'Fashion'" :heading="$route.name" subHeading="Explore your favourite fashion style.">
		</emb-page-title>		
		<emb-page-title v-else-if="$route.params.title.toLowerCase() == 'Gadgets'.toLowerCase()" :heading="$route.params.title.charAt(0).toUpperCase()+ $route.params.title.slice(1)" subHeading="Checkout our new gadgets.">
		</emb-page-title>
		<emb-page-title v-else-if="$route.params.title == 'Accessories'" :heading="$route.params.title" subHeading="Choose the wide range of best accessories.">
		</emb-page-title>
		<emb-page-title v-else :heading="$route.name">
		</emb-page-title>
		<div class="gadget-content section-gap">	
			<ais-instant-search :search-client="searchClient" index-name="ikea">
				<v-container grid-list-xl py-0>
					<v-layout row wrap>
							<product-items></product-items> 
					</v-layout>
			</v-container>
		</ais-instant-search>
		</div>	
	</div>
</template>

<script>
import AppConfig from "Constants/AppConfig";
import ProductItems from "Components/Ecommerce/ProductItems";
// import SidebarFilters from 'Components/Ecommerce/SidebarFilters'
import algoliasearch from 'algoliasearch/lite';
import 'instantsearch.css/themes/algolia-min.css';

export default {
	components:{
		// embSidebarFilters:SidebarFilters,
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