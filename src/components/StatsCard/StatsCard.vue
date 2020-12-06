<template>
   <app-card customClasses="magazine-stats-card">
		<div class="d-custom-flex align-items-center justify-space-between"
         :style="backgroundColor='black'">
         <div class="stats-card-title">   
				<span class="fs-12">
               <h2><i :class="icon"></i>{{ title }}</h2>
            </span>
			</div>
         <slot></slot>
         <div class="stats-card-chart">
            <p>{{ viewer }}</p>
            <p>{{ $t('message.trade') }} : {{ trade }} %</p>
			</div>
		</div>
	</app-card>
</template>

<script>
import LineChart from "Components/Charts/LineChart";

export default {
  props: ["title", "viewer", "trade", "dataSet", "icon", "color", "labels", "extraClass"],
  components: {
    LineChart
  }
};
</script>
