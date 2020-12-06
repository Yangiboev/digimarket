<template>
	<div>
		<gmap-map
			:center="center"
			:zoom="7"
			style="width:100%;  height: 400px;"
			>
			<gmap-marker
				:key="index"
				v-for="(m, index) in markers"
				:position="m.position"
				:clickable="true"
				:draggable="true"
			>
			</gmap-marker>
		</gmap-map>
	</div>
</template>

<script>
	export default {
		name: "GoogleMap",
		data() {
			return {
				center: { lat: 43.039660, lng: -75.085080 },
				markers: [
					{
						label: "Cemetery Street",
						position: {lat: 43.039660, lng: -75.085080}
					}, 
				]	
			};
		}
	}
</script>