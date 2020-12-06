<template>
   <div class="page-title-bar">
      <div class="container">
         <h1 class="mb-4"> {{heading}}</h1>
         <p class="white--text font-weight-regular"> {{subHeading}} </p>
      </div>
   </div>
</template>

<script>
export default {
   props:['heading','subHeading']
}
</script>