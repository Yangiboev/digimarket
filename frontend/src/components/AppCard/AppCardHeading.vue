<template>
	<div class="app-card-title d-flex justify-space-between" v-if="heading">
		<h5>{{heading}}</h5>
		<div class="d-inline-flex align-items-center">
			<v-btn class="ma-0 mr-2" icon>
				<v-icon>sync</v-icon>
			</v-btn>
			<template v-if="!withTabs">
				<div class="app-contextual-link" v-if="settings || reloadable || removePanel || viewMore">
					<v-menu transition="scale-transition" origin="right top" bottom left>
						<template v-slot:activator="{ on }">
							<v-btn class="ma-0" icon v-on="on">
								<v-icon>more_horiz</v-icon>
							</v-btn>
						</template>
						<v-list class="app-card-action">
							<v-list-item @click="$emit('onCollapse')" v-if="settings">
								<i aria-hidden="true" class="v-icon material-icons theme--light">
									settings
								</i>
								<span class="px-2">Settings</span>
							</v-list-item>
							<v-list-item @click="$emit('onCollapse')" v-if="viewMore">
								<i aria-hidden="true" class="v-icon material-icons theme--light">
									more
								</i>
								<span class="px-2">View More</span>
							</v-list-item>
							<v-list-item @click="$emit('onReload')" v-if="disableNotification">
								<i aria-hidden="true" class="v-icon material-icons theme--light">
									notifications_off
								</i>
								<span class="px-2">Disable Notification</span>
							</v-list-item>
							<v-list-item @click="removePanelOption" v-if="removePanel">
								<i aria-hidden="true" class="v-icon material-icons theme--light">exit_to_app</i>
								<span class="px-2">Remove Panel</span>
							</v-list-item>
						</v-list>
					</v-menu>
				</div>
			</template>
			<template v-else>
				<div class="app-contextual-link">
					<ul class="custom-tab-wrap list-inline">
						<template v-for="(tab, key) in tabs">
							<li @click="onChangeTab(key)" :key="key">
								<a href="javascript:void(0)" class="fs-12 fw-normal px-2 py-1 rounded mx-1"
									:class="[{'primary white--text': activeTab === key}]">{{tab}}</a>
							</li>
						</template>
					</ul>
				</div>
			</template>
		</div>
	</div>
</template>

<script>
	export default {
		props: [
			"heading",
			"removePanel",
			"disableNotification",
			"settings",
			"viewMore",
			"withTabs",
			"tabs",
			"onCollapse",
			"onReload",
			"onClose",
			"onChangeTabCallback"
		],
		data() {
			return {
				activeTab: 0
			};
		},
		methods: {
			onChangeTab(value) {
				this.activeTab = value;
				this.$emit("onChangeTabCallback", value);
			},
			removePanelOption() {
				console.log("Removed")
			}
		}
	};
</script>