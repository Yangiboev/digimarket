<template>
   <div class="emb-aboutus-wrap">
		<emb-page-title
			heading="About Us"
			subHeading="Creative team and wide goals."
		>
		</emb-page-title>
		<div class="emb-about-content">
			<div class="about-page section-gap">
				<v-container grid-list-xl>
					<v-layout row wrap align-center>
						<v-flex xs12 sm12 md12 lg6 xl6 pr-5>
							<h2 class="font-weight-bold font-italic mb-6"> Providing the optimize E-commerce servicing to millions of customers form last 10 year </h2>
							<h4 class="font-weight-bold mb-6">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cupiditate nihil non quo corrupti, laborum hic, </h4>
							<p class="mb-6">Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquam dolore neque consequatur harum suscipit hic nisi voluptate nulla deserunt! Ducimus odit nisi aliquam non quae exercitationem? Impedit dolores aliquam suscipit! Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor eaque illo, dolore voluptates ipsum ratione. At eius earum voluptatibus aperiam porro a quo, obcaecati dolor distinctio provident iusto libero ducimus? </p>
							<v-btn large class="accent mx-0">Read More</v-btn>
						</v-flex>
						<v-flex xs12 md12 lg6 xl6 text-lg-left text-center>
							<img alt="About us Figure" src="/static/images/about-us.jpg" width="700" height="700">
						</v-flex>
					</v-layout>
				</v-container>
			</div>
			<div class="about-info section-gap bg-grey">
				<v-container grid-list-xl py-0>
					<v-layout row wrap align-center mb-md-0 mb-6>
						<v-flex xl6 sm12  xs12 md6 lg6 text-md-left text-center>
							<img src="/static/images/our-mission.jpg" alt="mission" width="900" height="700">
						</v-flex>
						<v-flex xl6 xs12 md6 lg6 class="pl-12">
							<h2 class="font-weight-bold">
								Our Mission
							</h2>
							<h5 class="font-italic">nulla dolor dicta laborum unde molestias ab magni.Lorem ipsum dolor sit amet,
							consectetur adipisicing elit</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat quibusdam cum blanditiis voluptas,
							voluptates hic eius maxime dolorum saepe quae animi eveniet nulla dolor dicta laborum unde molestias ab
							magni.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat quibusdam cum blanditiis
							voluptas,
							voluptates hic eius maxime dolorum saepe quae animi eveniet nulla dolor dicta laborum unde molestias ab
							magni.</p>
						</v-flex>
					</v-layout>
					<v-layout row wrap align-center reverse>
						<v-flex xl6 xs12 md6 lg6>
							<img src="/static/images/our-vision.jpg" alt="vission" width="900" height="700">
						</v-flex>
						<v-flex xl6 xs12 md6 lg6 class="pr-12">
							<h2 class="font-bold">
								Our Vision
							</h2>
							<h5 class="font-italic">nulla dolor dicta laborum unde molestias ab magni.Lorem ipsum dolor sit amet,
								consectetur adipisicing elit</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat quibusdam cum blanditiis voluptas,
							voluptates hic eius maxime dolorum saepe quae animi eveniet nulla dolor dicta laborum unde molestias ab
							magni.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat quibusdam cum blanditiis
							voluptas,
							voluptates hic eius maxime dolorum saepe quae animi eveniet nulla dolor dicta laborum unde molestias ab
							magni.</p>
						</v-flex>
					</v-layout>
				</v-container>
			</div>
			<TestimonialV2 />
			<div class="team-section text-center section-gap blue-grey lighten-5">
				<v-container grid-list-xl text-xl-center>
					<div class="sec-title">
						<h2>Meet Our Crew</h2>
					</div>
					<v-layout row wrap align-center justify-center>
						<v-flex xs12 sm12 md4 lg4 xl4 text-center mb-sm-0 mb-3	v-for="(teamMembers,key) in teamListing" 	:key='key'>
							<div class="team-card mb-6">
								<img class="br-100" :src="teamMembers.image" width="200" height="200" alt="team-image">
							</div>
							<div class="team-content">
								<h4 class="mb-0">{{teamMembers.name}}</h4>
								<p class="mb-6">{{teamMembers.designation}}</p>
								<p class="mb-6">{{teamMembers.description}}</p>
							</div>
						</v-flex>
					</v-layout>
				</v-container>
			</div>
			<div class="about-contact-form">
				<v-layout row wrap>
					<v-flex xs12 sm12 md6 lg6 xl6 class=" about-contact-bg"></v-flex>
						<v-flex xs12 sm12 md6 lg6 xl6 section-gap>
							<div class="about-contact-form-inner">
								<div>
									<h2 class="mb-3">Write to Us</h2>
								</div>
								<v-form ref="form" v-model="valid">
									<v-text-field	type="text"	placeholder="First Name" :rules="inputRules.basictextRules"></v-text-field>
									<v-text-field	type="text"	placeholder="Last Name" :rules="inputRules.basictextRules"></v-text-field>
									<v-text-field	type="email"	placeholder="Email" :rules="emailRules"></v-text-field>
									<v-text-field	type="text"	placeholder="Subject" :rules="inputRules.basictextRules"></v-text-field>
									<v-textarea rows="2" label="Leave a Message" :rules="inputRules.basictextRules"></v-textarea>
									<v-btn class="accent mx-0" large @click.stop.prevent="saveDetails">Send Message</v-btn>
								</v-form>
							</div>
						</v-flex>
					</v-layout>
			</div>
		</div>
   </div>
</template>

<script>
import { mapGetters } from "vuex";
import TestimonialV2 from "Components/Widgets/TestimonialV2";
import api from "Api";

export default {
  computed: {
    ...mapGetters(["rtlLayout"])
  },
  components: {
    TestimonialV2
  },
  data() {
    return {
      valid: false,
      emailRules: [
        v => !!v || "E-mail is required",
        v => /.+@.+/.test(v) || "E-mail must be valid"
      ],
      inputRules: {
        basictextRules: [v => !!v || "This field should not be empty"]
      },
      /**
       * Slick Options
       **/
      slickOptions: {
        autoplay: false,
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
            breakpoint: 390
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
      ],
      teamListing: null
    };
  },
  mounted() {
    this.getTeam();
  },
  methods: {
    getTeam() {
      api
        .get("team.json")
        .then(response => {
          this.teamListing = response.data;
          // console.log(response.data);
        })
        .catch(error => {
          console.log(error);
        });
    },
    saveDetails() {
      this.$refs.form.validate();
    }
  }
};
</script>
