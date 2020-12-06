<template>
   <div class="emb-shop-card section-gap title-gap">
     <div class="container">
			<div class="sec-title">
				<h2>{{secTitle}}</h2>
			</div>
			<slick ref="carousel" class="shop-card-slider" :options="slickOptions">
				<div v-for="(brand,key) in data" :key="key" class="text-center slick-item">
					<router-link to="/products">
						<img alt="client-logo" :src="brand" width="250" height="50">
					</router-link>
				</div>
			</slick>
     </div>
   </div>
</template>

<script>
import Slick from "vue-slick";
import { mapGetters } from "vuex";

export default {
  props: ["data", "secTitle"],
  computed: {
    ...mapGetters(["rtlLayout"])
  },
  components: { Slick },
  data() {
    return {
      slickOptions: {
        rtl: this.rtlLayout,
        slidesToShow: 5,
        infinite: true,
        swipe: true,
        autoplay: true,
        pauseOnHover: false,
        arrows: false,
        responsive: [
          {
            breakpoint: 1600,
            settings: {
             slidesToShow: 4
            }
          },
          {
            breakpoint: 992,
            settings: {
              arrows: false,
              slidesToShow: 3
            }
          },
          {
            breakpoint: 767,
            settings: {
              arrows: false,
              slidesToShow: 2
            }
          },
          {
            breakpoint: 480,
            settings: {
              arrows: false,
              slidesToShow: 1
            }
          }
        ]
      }
    };
  }
};
</script>