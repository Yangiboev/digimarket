<template>
   <div class="profile-wrapper emb-card pa-4">
      <h4>Profile Information</h4>
      <div class="pt-4">
         <div class="proflie-field mb-4" v-for="(info,key) in profileData" :key="key">
            <label>{{info.key}} :</label>
            <span>{{info.value}}</span>
         </div>
         <router-link :to="{name: 'EditProfileInfo', query: {type: 'info'}}" > <v-btn class="accent mx-0">Edit</v-btn> </router-link>
      </div>
   </div>
</template>

<script>
export default {
   data(){
      return{
         profileData:[
            {
               key:"First Name",
               value:"ALex",
            },
            {
               key:"Last Name",
               value:"Doe"
            },
            {
               key:"Gender",
               value:"Female"
            },
            {
               key:"Date Of birth",
               value:"9th May 1995"
            },
            {
               key:"Mobile Number",
               value:"+123 456 789 123"
            },
            {
               key:"Location",
               value:"San Francisco"
            },
            {
               key:"E-mail id",
               value:"leftredno@ruth.com"
            }
         ]
      }
   }
}
</script>