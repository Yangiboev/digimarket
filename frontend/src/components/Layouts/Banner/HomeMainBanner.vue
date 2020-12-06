<template>
	<div class="home-banner-wrap"> 
		<slick ref="carousel" :options="slickOptions">
			<div v-for="(sliderItem,key) in data"
				:key="key">
				<div class="banner-slide">
					<router-link :to="'/products/'+sliderItem.routeSubTitle">
					<img :src="sliderItem.image" alt="slide-item" width="1123" height="660">
					</router-link>
				</div>
			</div>
		</slick>
	</div>
</template>

<script>
import Slick from "vue-slick";
export default {
	props: ['data'],
	components: { Slick },
	data() {
    return {
      slickOptions: {
			rtl: this.rtlLayout,
			slidesToShow: 1,
			infinite: true,
			swipe: true,
			autoplay: true,
			dots:false,
			arrows: false,
			pauseOnHover:true,
        responsive: [
          {
            breakpoint: 768,
            settings: {
					arrows: false,
            }
          },
        ]
      }
    };
  }
}
</script>

