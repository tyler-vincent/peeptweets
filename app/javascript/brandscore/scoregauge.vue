<template>
  <div id="scoreGauge">
    <v-gauge :value="score" :minValue=-100 :maxValue=100 :options="graphOptions" :width=100 />
  </div>
</template>

<script>
  import VGauge from "vgauge";

  
  export default {
    name: 'scoreGauge',
    props: ['score'],
    components: {
      VGauge
    },
    data: function () {
      return {
        score: 0,
        graphOptions: {
          staticZones: [
             {strokeStyle: "#F03E3E", min: -100, max: -40},
             {strokeStyle: "#FFDD00", min: -40, max: -20},
             {strokeStyle: "#BCBCBC", min: -20, max: 20},
             {strokeStyle: "#C7EFB6", min: 20, max: 40},
             {strokeStyle: "#62D332", min: 40, max: 100}
          ],
        }
      }
    },
    methods: {
   
    }
  }
</script>

<style scoped>


</style>
