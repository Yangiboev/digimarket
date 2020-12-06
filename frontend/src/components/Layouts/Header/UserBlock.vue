<template>
	<div>
		<v-menu transition="scale-transition" offset-overflow nudge-bottom="30" nudge-right="20" min-width="200"
			max-width="200" class="userblock-dropdown" light>
			<template v-slot:activator="{ on }">
				<v-btn fab small v-on="on">
					<img src="/static/images/user-3.jpg" width="40" height="40" class="v-btn--round">
				</v-btn>
			</template>
			<v-list class="user-dropdown-list">
				<v-list-item :href="userLink.path" v-for="(userLink, key) in data" :key="key">
					<v-icon class="mr-2">{{userLink.icon}}</v-icon>
					<span>{{userLink.title}}</span>
				</v-list-item>
			</v-list>
		</v-menu>
	</div>
</template>

<script>
	export default {
		props: ['data'],
	}
</script>