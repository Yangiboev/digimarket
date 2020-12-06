<template>
   <div>
      <div class="search-box">
        <v-btn class="d-inline-block" fab dark v-if="isHidden"	color="accent" @click="isHidden = false">
            <v-icon>search</v-icon>
         </v-btn>
      </div>
      <div  class="search-form"  v-if="!isHidden">
        <div class="form">
          <template>
          <v-toolbar
            dark
            color="#283593"
          >
            <v-autocomplete
              v-model="select"
              :loading="loading"
              :items="items"
              :search-input.sync="search"
              cache-items
              class="mx-4"
              flat
              hide-no-data
              hide-details
              label="Search product"
              solo-inverted
            ></v-autocomplete>
            <v-btn icon>
              <v-icon>mdi-dots-vertical</v-icon>
            </v-btn>
          </v-toolbar>
        </template>
            <v-btn class="close-btn white" @click="isHidden = !isHidden">
              <v-icon>close</v-icon>
            </v-btn>
            
         </div>
      </div>
   </div>
</template>
<script>
import api from "Api"
   export default {
      data (){
         return{
           isHidden: true,
            loading: false,
            items: [],
            search: null,
            select: null,
         }
      },
      computed: {
    },

    watch: {
      search (val) {
        val && val !== this.select && this.querySelections(val)
        // Lazily load input items
        api({
          url: '/product?name=' + val,
          method: 'get' 
        })
          .then(res => res.json())
          .then(res => {
            const { count, entries } = res
            this.count = count
            this.entries = entries
          })
          .catch(err => {
            console.log(err)
          })
          .finally(() => (this.isLoading = false))
      },
    },
      methods: {
      querySelections (v) {
        this.loading = true
        // Simulated ajax query
        setTimeout(() => {
          this.items = this.states.filter(e => {
            return (e || '').toLowerCase().indexOf((v || '').toLowerCase()) > -1
          })
          this.loading = false
        }, 500)
      },
			changeLanguage(language) {
				this.$i18n.locale = language.locale;
				this.$store.dispatch("changeLanguage", language);
			}
      }
   }
</script>
