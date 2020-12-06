<template>
	<div class="testimonail-v2 text-center section-gap">
		<v-container grid-list-xl py-0>
			<v-layout row wrap align-center justify-center>
				<v-flex xl6 sm12 md8 lg6>
					<slick ref="carousel" :options="slickOptions">
						<div v-for="(review,key) in reviews"	:key="key"	class="slide-item px-4">
							<div class="sec-title">
								<h2 class="white--text">{{review.name}}</h2>
							</div>
							<div class="testi-card-v2 mb-6 text-center">
								<div class="layout row wrap align-center justify-center">
									<v-flex xs5 sm4 md5 lg4 xl3 text-center user-img>
										<img class="br-100 text-center mx-auto" :src="review.img" width="200" height="200" alt="team-image">
									</v-flex>
								</div>
							</div>
							<div class="testi-content text-center">
								<h4 class="font-weight-medium mb-0 white--text">{{review.name}}</h4>
								<p class="text-inverse white--text">{{review.position}}</p>
								<p class="text-inverse testi-content white--text">{{review.desc}}</p>
							</div>
						</div>
					</slick>
				</v-flex>
			</v-layout>
		</v-container>
	</div>
</template>
<script>
import Slick from "vue-slick";
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["rtlLayout"])
  },
  components: { Slick },
  data() {
    return {
      /**
       * Slick Options
       **/
      slickOptions: {
        autoplay: true,
        slidesToShow: 1,
        infinite: false,
        arrows: false,
        dots: false,
        slidesToScroll: 1,
        swipe: true,
        seed: 100,
        rtl: this.rtlLayout,
        responsive: [
          {
            breakpoint: 390,
            settings: {
              // dots:false
            }
          }
        ]
      },
      /**
       *** Data
       **/
      reviews: [
        {
          img: "/static/images/user-1.jpg",
          name: "Albert Gomez",
          position: "Head, ABS Infos",
          desc:
            "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autexpedita quasi voluptatibus tenetur nisi ad earum atque laboriosam accusamus. Doloremque sapiente aliquid quae. Animi ratione dolorum repellat amet nihil? Magnam?"
        },
        {
          img: "/static/images/user-2.jpg",
          name: "Tristan Cyrus",
          position: "Head, ABS Infos",
          desc:
            "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autexpedita quasi voluptatibus tenetur nisi ad earum atque laboriosam accusamus. Doloremque sapiente aliquid quae. Animi ratione dolorum repellat amet nihil? Magnam?"
        },
        {
          img: "/static/images/user-3.jpg",
          name: "Kendrick Younes",
          position: "Head, ABS Infos",
          desc:
            "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autexpedita quasi voluptatibus tenetur nisi ad earum atque laboriosam accusamus. Doloremque sapiente aliquid quae. Animi ratione dolorum repellat amet nihil? Magnam?"
        },
        {
          img: "/static/images/user-4.jpg",
          name: "Beljium Hugh",
          position: "Head, ABS Infos",
          desc:
            "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autexpedita quasi voluptatibus tenetur nisi ad earum atque laboriosam accusamus. Doloremque sapiente aliquid quae. Animi ratione dolorum repellat amet nihil? Magnam?"
        }
      ]
    };
  }
};
</script>
