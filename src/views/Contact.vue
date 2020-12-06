<template>
   <div class="emb-contact-wrap">
		<emb-page-title
			heading="Contact Us"
			subHeading="Share your feedback with us."
		>
		</emb-page-title>
		<div class="emb-contact-content">
         <div class="Contact-page">
            <div class="contact-map">
					<emb-google-map></emb-google-map>
            </div>
			</div>
			<div class="contact-info-wrapper">
				<v-container grid-list-xl py-0>
					<div class="section-gap">
						<v-layout row wrap>
							<v-flex sm12 md12 lg5 xl5>
								<div class="sec-title">
									<h2 class="v-layout justify-start align-center">Contact Info</h2>
									<h5 class="font-italic mb-6">{{contactInfo.info}}</h5> 
								</div>
								<!-- {{contactInfo.info}} -->
								<div class="mb-6">
									<h3>Call</h3>
									<a href="number: +998999893626" class="color-inherit">
										+998999893626</a>
								</div>
								<div class="mb-6">
									<h3>Mail</h3>
									<a href="dilmurod.yangiboev@gmail.com" class="color-inherit">dilmurod.yangiboev@gmail.com</a>
								</div>
								<div class="mb-6">
									<h3>Address</h3>
									<p>48 Maysazor, Chilonzor, Uzbekistan</p>
								</div>
							</v-flex>
							<v-flex sm12 md12 lg7 xl7>
								<div class="sec-title">
									<h2>Write to Us</h2>
								</div>
								<v-form  ref="form" v-model="valid">
									<v-text-field type="text" placeholder="First Name" :rules="inputRules.basictextRules"></v-text-field>
									<v-text-field	type="text"	placeholder="Last Name" :rules="inputRules.basictextRules"></v-text-field>
									<v-text-field type="email" placeholder="Email" :rules="emailRules"></v-text-field>
									<v-text-field	type="text"	placeholder="Subject" :rules="inputRules.basictextRules"></v-text-field>
									<v-textarea rows="2" label="Leave a Message" :rules="inputRules.basictextRules"></v-textarea>
									<v-btn class="accent mx-0 mt-4" large @click.stop.prevent="saveDetails">	Send Message</v-btn>
								</v-form>
							</v-flex>
						</v-layout>
					</div>
				</v-container>
			</div>
		</div>
   </div>
</template>

<script>
import api from "Api";

export default {
  data() {
    return {
      valid: false,
      contactInfo: "",
      emailRules: [
        v => !!v || "E-mail is required",
        v => /.+@.+/.test(v) || "E-mail must be valid"
      ],
      inputRules: {
        basictextRules: [v => !!v || "This field should not be empty"]
      }
    };
  },
  mounted() {
    this.getContactInfo();
  },
  methods: {
    getContactInfo() {
      api
        .get("contact.json")
        .then(response => {
          this.contactInfo = response.data;
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

