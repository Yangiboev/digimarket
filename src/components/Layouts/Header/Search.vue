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
            color="teal"
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
              label="What state are you from?"
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
            descriptionLimit: 60,
            entries: [],
            isLoading: false,
            model: null,
            search: null,
            isHidden: true,
         }
      },
      computed: {
      fields () {
        if (!this.model) return []

        return Object.keys(this.model).map(key => {
          return {
            key,
            value: this.model[key] || 'n/a',
          }
        })
      },
      items () {
        return this.entries.map(entry => {
          const Description = entry.Description.length > this.descriptionLimit
            ? entry.Description.slice(0, this.descriptionLimit) + '...'
            : entry.Description

          return Object.assign({}, entry, { Description })
        })
      },
    },

    watch: {
      search (val) {
        // Items have already been loaded
        if (this.items.length > 0) return

        // Items have already been requested
        if (this.isLoading) return

        this.isLoading = true

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
         methods: {
			changeLanguage(language) {
				this.$i18n.locale = language.locale;
				this.$store.dispatch("changeLanguage", language);
			}
		}
      }
   }
</script>
