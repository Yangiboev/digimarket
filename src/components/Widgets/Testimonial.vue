<template>
	<div class="emb-testimonial-wrap white section-gap title-gap">
		<div class="container">
			<div class="sec-title text-xl-center">
				<h2>{{secTitle}}</h2>
			</div>
			<slick ref="carousel" 
					:options="slickOptions"
				>
				<div 
					v-for="(testimonial,key) in data"
					:key="key"
					class="slide-item"
				>
					<div class="emb-card white">
						<p class="font-italic mb-0">{{testimonial.desc}}</p>
					</div>
					<div class="user-content">
						<div class="user-thumb">
							<img class="br-100" alt="customer review" :src="testimonial.image" width="74" height="74">
						</div>
						<div>
							<h6 class="font-weight-medium mb-0">{{testimonial.user}}</h6>
							<p class="mb-0">{{testimonial.position}}</p>
						</div>
					</div>
				</div>
			</slick>
		</div>
	</div>
</template>

<script>
import { mapGetters } from "vuex";
import Slick from "vue-slick";

export default {
  props: ["data", "secTitle"],
  computed: {
    ...mapGetters(["rtlLayout"])
  },
  components: { Slick },
  data() {
    return {
      slickOptions: {
        slidesToShow: 3,
        slidesToScroll: 1,
        infinite: true,
        arrows: false,
        dots: false,
        swipe: true,
        autoplay: true,
        pauseOnHover: true,
        responsive: [
          {
            breakpoint: 991,
            settings: {
              arrows: false,
              slidesToShow: 2
            }
          },
          {
            breakpoint: 601,
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
