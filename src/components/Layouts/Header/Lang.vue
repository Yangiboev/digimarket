<template>
	<div class="lang-menu">
		<v-menu transition="scale-transition" :nudge-width="40">
			<template v-slot:activator="{ on }">
				<v-toolbar-title v-on="on">
					<a href="javascript:void(0)" class="white--text font-weight-regular">{{selectedLocale.name}}</a>
					<v-icon dark>arrow_drop_down</v-icon>
				</v-toolbar-title>
			</template>
			<v-list class="py-0">
				<v-list-item v-for="(language,key) in languages" :key="key" @click="changeLanguage(language)">
					<span>{{language.name}}</span>
				</v-list-item>
			</v-list>
		</v-menu>
	</div>
</template>

<script>
	import { mapGetters } from "vuex";

	export default {
		computed: {
			...mapGetters(["selectedLocale", "languages"])
		},
		methods: {
			changeLanguage(language) {
				this.$i18n.locale = language.locale;
				this.$store.dispatch("changeLanguage", language);
			}
		}
	}
</script>