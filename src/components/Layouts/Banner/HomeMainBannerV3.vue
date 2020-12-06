<template>
	<div class="home-banner-v3 pt-12"> 
		<v-container grid-list-xl>
			<slick ref="carousel" :options="slickOptions">
				<div class="slider-wrap text-center" v-for="(sliderItem,key) in data" :key="key">
					<div class="slider-item relative">
						<img :src="sliderItem.image" alt="slide-item" width="100%" height="660">
						<div class="slider-content-v3">
							<div class="slider-content-v3-inner ma-auto">
							<p class="text-inverse">{{sliderItem.subHeading}}</p>
							<h4 class="font-bold mb-6 white--text">{{sliderItem.heading}}</h4>
							<v-btn to='/products'>SHOP NOW</v-btn>
						</div>
						</div>
					</div>
      		</div>
			</slick>
		</v-container>
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

