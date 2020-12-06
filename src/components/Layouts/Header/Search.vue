<template>
   <div>
      <div class="search-box">
        <v-btn class="d-inline-block" fab dark v-if="isHidden"	color="accent" @click="isHidden = false">
            <v-icon>search</v-icon>
         </v-btn>
      </div>
      <div  class="search-form"  v-if="!isHidden">
        <div class="form">
         <v-autocomplete
            v-model="model"
            :items="items"
            :loading="isLoading"
            :search-input.sync="search"
            color="white"
            hide-no-data
            hide-selected
            placeholder="Start typing to Search"
            return-object
            ></v-autocomplete>
            <v-expand-transition>
            <v-list
              v-if="model"
              class="red lighten-3"
            >
              <v-list-item
                v-for="(field, i) in fields"
                :key="i"
              >
                <v-list-item-content>
                  <v-list-item-title v-text="field.value"></v-list-item-title>
                  <v-list-item-subtitle v-text="field.key"></v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
            </v-list>
          </v-expand-transition>
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
