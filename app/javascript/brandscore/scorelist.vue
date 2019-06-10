<template>
  <div id="scorelist">
    <ul>
      <li v-for="score in scores" :key="score.id" :score="score">
        {{ score.term }} - {{ score.friendly_score }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'scoreList',
  props: ['scores'],
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
