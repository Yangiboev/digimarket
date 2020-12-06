<template>
	<div class="emb-aside-banner-v2">
		<router-link to="/products/accessories">
			<img class="emb-card" :src="img"  width="547" height="315" alt="aside-banner">
		</router-link>
	</div>
</template>

<script>
	export default {
		props: ['img'],    
	}
</script>
