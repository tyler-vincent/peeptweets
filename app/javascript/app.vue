<template>
  <div id="app">
    <newScore></newScore>

    <scoreList :scores="scores"></scoreList>
  </div>
</template>

<script>
  import scoreList from './brandscore/scorelist.vue'
  import newScore from './brandscore/newscore.vue'

  export default {
    data: function () {
      return {
        scores: []
      }
    },
    components: {
      scoreList,
      newScore
    },
    created () {
      this.$http.get('/brand_scores.json')
        .then(response => { this.scores = response.data })
        .catch(error => this.setError(error, 'Unable to fetch scores'))
    }
  }
</script>

<style scoped>

</style>
