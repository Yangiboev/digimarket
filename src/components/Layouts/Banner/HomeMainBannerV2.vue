<template>
   <div class="home-banner-v2 section-gap pt-4 pb-0"> 
      <div class="slider-container">
         <slick ref="carousel" :options="slickOptions">
            <div class="slider-wrap text-center" v-for="(sliderItem,key) in data" :key="key">
               <div  class="banner-slide">
                  <img :src="sliderItem.image" alt="slide-item" width="100%" height="660">
                  <div class="emb-banner-content">
                     <div class="slider-content-v3-inner ma-auto">
                        <h4>{{sliderItem.subHeading}}</h4>
                        <h1 class='text-main'>{{sliderItem.heading}}</h1>
                        <h1 class="text-bold mb-6">
                           {{sliderItem.percent}}
                           <sup class="bold-sup">{{sliderItem.offer}}</sup>
                        </h1>
                        <v-btn color="accent mt-0" to="/products">Shop Now</v-btn>
                     </div>
                </div>
               </div>
            </div>
         </slick>
      </div>
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
         infinite: true,
         centerMode: true,
         centerPadding: '400px',
         slidesToShow: 1,
         slidesToScroll: 1,
         autoplay: true,
         autoplaySpeed: 2000,
         dots: false,
         arrows:false,
         rtl: this.isRTL,
        responsive: [
            {
               breakpoint: 1400,
               settings: {
                  arrows: false,
                  centerMode: true,
                  centerPadding: '300px',
                  slidesToShow: 1,
                  slidesToScroll: 1,
                  autoplay: true,
                  autoplaySpeed: 2000
               }
            },
            {
               breakpoint: 1199,
               settings: {
                  arrows: false,
                  centerMode: true,
                  centerPadding: '150px',
                  slidesToShow: 1,
                  slidesToScroll: 1,
                  autoplay: true,
                  autoplaySpeed: 2000
               }
            },
            {
               breakpoint: 899,
               settings: {
                  arrows: false,
                  centerMode: true,
                  centerPadding: '75px',
                  slidesToShow: 1,
                  slidesToScroll: 1,
                  autoplay: true,
                  autoplaySpeed: 2000
               }
            },
            {
               breakpoint: 768,
               settings: {
                  arrows: false,
                  centerMode: false,
                  centerPadding: '0',
                  slidesToShow: 1,
                  slidesToScroll: 1,
                  autoplay: true,
                  autoplaySpeed: 2000
               }
            },
            {
               breakpoint: 480,
               settings: {
                  arrows: false,
                  centerMode: false,
                  centerPadding: '0',
                  slidesToShow: 1,
                  slidesToScroll: 1,
                  autoplay: true,
                  autoplaySpeed: 2000
               }
            }
         ]
      }
    };
  }
}
</script>

