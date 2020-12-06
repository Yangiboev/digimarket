<template>
   <div class="sidebar-filter-wrap">
      <div class="search-box emb-card white mb-6 pa-6">
         <ais-search-box placeholder="Search a product"></ais-search-box>
      </div>
      <div class="cateogary-block emb-card white mb-6 pa-6">
         <h5>CATEGORIES</h5>
         <ais-refinement-list attribute="category" :limit="5"></ais-refinement-list>
      </div>
      <div class="emb-card mb-6 white pa-6">
         <h5>COLORS</h5>
         <ais-refinement-list attribute="colors" :limit="5"></ais-refinement-list>
      </div>
     <div class="emb-card white mb-6 pa-6">
         <h5>PRICE</h5>
         <ais-range-input attribute="price"></ais-range-input>
      </div>
      <div class="emb-card white mb-6 pa-6 rating-filter">
         <h5>RATING</h5>
         <ais-rating-menu attribute="rating"></ais-rating-menu>
      </div>
      <div class="emb-card white pa-6">
			<div class="ais-ClearRefinements">
				<button class="v-btn v-btn--contained cpx-0 v-size--large font-weight-medium accent ais-ClearRefinements-button">
				  Clear all filters
				</button>
			</div>
      </div>
   </div>
</template>