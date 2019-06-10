<template>
  <div id="app">
    <h1>Brand Sentiment Analyzer</h1>

    <h2>Generate Score</h2>
    <newScore></newScore>

    <h2>Past Scores</h2>
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
      console.log("Fetching Scores")
      this.$http.get('/brand_scores.json')
        .then(response => { this.scores = response.data })
        .catch(error => this.setError(error, 'Unable to fetch scores'))
    }
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>
