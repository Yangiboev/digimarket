<template>
	<span>{{selectedCurrency.symbol}}</span>
</template>

<script>
	import { mapGetters } from 'vuex';

	export default {
      computed: {
			...mapGetters(["selectedCurrency"]),
		},
	}
</script>