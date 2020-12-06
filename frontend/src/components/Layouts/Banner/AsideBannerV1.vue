<template>
	<div class="emb-aside-banner-v1">
		<router-link to="/products/accessories">
			<img class=" emb-card " alt="aside-banner" :src="img" width="547" height="315">
		</router-link>
	</div>
</template>

<script>
	export default {
		props: ['img'],    
	}
</script>
