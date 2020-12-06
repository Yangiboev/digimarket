<template>
   <div class="emb-shop-card-v2 section-gap title-gap">
     <div class="container">
			<div class="sec-title">
				<h2>{{secTitle}}</h2>
			</div>
			<slick ref="carousel" class="shop-card-slider" :options="slickOptions">
				<div v-for="(brand,key) in data" :key="key" class="text-center slick-item">
					<router-link to="/fashion">
                    <img width="150" height="30" :src="brand.image"  alt="logo client">
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
        pauseOnHover: true,
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
            breakpoint: 375,
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