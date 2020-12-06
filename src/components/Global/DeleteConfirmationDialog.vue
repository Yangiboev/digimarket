<template>
	<v-dialog v-model="open" max-width="550">
		<v-card class="py-6 px-2">
			<h4 class=" text-center mb-6">{{message}}</h4>
			<v-card-actions class="layout justify-center">
				<v-btn color="accent mx-2" @click="open = false">Cancel</v-btn>
				<v-btn color="accent" @click="$emit('onConfirm')">Yes</v-btn>
			</v-card-actions>
		</v-card>
	</v-dialog>
</template>

<script>
export default {
	props: ["message", "onConfirm"],
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

