// News Letter Campaign Widget
import { Line, mixins  } from 'vue-chartjs'

const { reactiveProp } = mixins

export default {
	extends: Line,
	mixins: [ reactiveProp ],
	props: ['chartData'],
	data() {
		return {
			options: {
				scales: {
					yAxes: [{
						gridLines: {
							display: true,
							drawBorder: true
						},
						ticks: {
							stepSize: 20,
                     display:true
						}
					}],
					xAxes: [{
						gridLines: {
							display: false,
							drawBorder: false
						},
						ticks: {
                     display:true
						}
					}]
				},
				legend: {
					display: false
				},
				responsive: true,
				maintainAspectRatio: false
			}
		}
	},
	mounted() {
		this.renderChart(this.chartData, this.options)
	}
}
