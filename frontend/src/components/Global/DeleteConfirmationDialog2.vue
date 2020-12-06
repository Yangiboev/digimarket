<template>
	<v-dialog v-model="open" max-width="400">
		<v-card class="py-6 px-4">
			<h4>{{messageTitle}}</h4>
			<p>{{messageDescription}}</p>
			<v-card-actions class="layout justify-center">
				<v-btn color="primary" @click="open = false">{{btn1}}</v-btn>
				<v-btn color="accent" @click="$emit('onConfirm')">{{btn2}}</v-btn>
			</v-card-actions>
		</v-card>
	</v-dialog>
</template>

<script>
export default {
	props: ["message", "onConfirm","btn1","btn2","messageTitle","messageDescription"],
	data() {
		return {
			open: false
		};
	},
	methods: {
		openDialog() {
			this.open = true;
		},
		close() {
			this.open = false;
		}
	}
	};
</script>

