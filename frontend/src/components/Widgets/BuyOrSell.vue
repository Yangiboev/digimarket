<template>
   <div> 
      <div class="text-right mt-12 mb-8">
			<v-btn color="accent" class="mr-2" @click="changeTab('week')">Week</v-btn>
			<v-btn color="primary" class="mr-2"  @click="changeTab('month')">Month</v-btn>
			<v-btn color="error" @click="changeTab('year')">Year</v-btn>
		</div>
      <div v-if="selectedChartData !=null">
         <line-chart
            :width="650"
            :height="400"
            :chartData= "chartData"
            >
         </line-chart>
      </div> 

   </div>
	
</template>

<script>
import LineChart from "Components/Charts/LineChart";
import { buySellChartData } from 'Assets/data/buySellChartData.js'
import { ChartConfig } from "Constants/chart-config";

export default {
   components:{
      LineChart,
   },
  data() {
    return {
       buySellChartData,
       selectedButton: 'week',
       selectedChartData: null,
       chartData: null
    };
  },
  mounted(){
    this.selectedChart(this.selectedButton);
  },
  methods:{
    selectedChart(selectedButton){
      for(var i=0; i< this.buySellChartData.length; i++){
        if(this.buySellChartData[i].tag == selectedButton) {
          this.selectedChartData = this.buySellChartData[i];
          break;
        }
      }
      if(this.selectedChartData != null){
        this.chartData = {
          labels: this.selectedChartData.buySellChartLabel,
          datasets: [
            {
              label: this.selectedChartData.buySellChartData[0].label,
              lineTension: 0.4,
              borderColor: this.selectedChartData.buySellChartColors[0].borderColor,
              pointBorderColor: this.selectedChartData.buySellChartColors[0].borderColor,
              pointBorderWidth: 2,
              pointRadius: 2,
              fill: false,
              pointBackgroundColor: ChartConfig.color.white,
              borderWidth:3,
              data: this.selectedChartData.buySellChartData[0].data
            },
            {
              label: this.selectedChartData.buySellChartData[1].label,
              lineTension: 0.4,
              borderColor: this.selectedChartData.buySellChartColors[1].borderColor,
              pointBorderColor: this.selectedChartData.buySellChartColors[1].borderColor,
              pointBorderWidth: 2,
              pointRadius: 2,
              fill: false,
              pointBackgroundColor: ChartConfig.color.white,
              borderWidth: 3,
              data: this.selectedChartData.buySellChartData[1].data
            },
            {
              label: this.selectedChartData.buySellChartData[2].label,
              lineTension: 0.4,
              borderColor: this.selectedChartData.buySellChartColors[2].borderColor,
              pointBorderColor: this.selectedChartData.buySellChartColors[2].borderColor,
              pointBorderWidth: 2,
              pointRadius: 2,
              fill: false,
              pointBackgroundColor: ChartConfig.color.white,
              borderWidth: 3,
              data: this.selectedChartData.buySellChartData[2].data
            }
          ]
        }
      }
    },
    changeTab(selectedBtn){
      this.selectedButton = selectedBtn;
      this.selectedChart(this.selectedButton);
    }
  }
};
</script>
