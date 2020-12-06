<template>
   <div class="emb-termCondition-wrap">
		<emb-page-title
			heading="Terms and Conditions"
			subHeading="Please read and contact if you have some issue. "
		>
		</emb-page-title>
		<div class="emb-tnc section-gap">
         <div class="container">
            <div class="tnc-content">
                <div class="emb-card mb-12 pa-6" v-for="(data,i) in tnc" :key="i">
                    <h4 class="mb-4">{{data.name}}</h4>
                    <div v-html="data.content">
                    </div>
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
      tnc: null
    };
  },
  mounted() {
    this.getFaq();
  },
  methods: {
    getFaq() {
      api
        .get("term_condition.json")
        .then(response => {
          this.tnc = response.data;
          // console.log(this.tnc);
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
};
</script>

