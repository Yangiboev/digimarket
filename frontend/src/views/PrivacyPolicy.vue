<template>
   <div class="emb-privacy-policy-wrap">
      <emb-page-title
			heading="Privacy Policy"
			subHeading="Your Information is fully secure with us."
		>
		</emb-page-title>
      <div class="section-gap bg-white">
         <div class="container">
            <div class="privacy-page">
               <div 
                  class="emb-card mb-12 pa-6"
                  v-for="(policy,key) in policylist"
                  :key='key'
               >
                  <h4 class="mb-4">{{policy.name}}</h4>
                  <div v-html="policy.content" ></div>
               </div>
            </div>
         </div>
      </div>
   </div>             
</template>

<script>
import api from "Api";
export default {
  data() {
    return {
      policylist: null
    };
  },
  mounted() {
    this.getPrivacyPolicyData();
  },
  methods: {
    getPrivacyPolicyData() {
      api
        .get("privacy_policy.json")
        .then(response => {
          this.policylist = response.data;
          // console.log(response.data);
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
};
</script>
