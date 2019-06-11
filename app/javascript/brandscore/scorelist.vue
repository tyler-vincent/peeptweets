<template>

  <div id="scorelist">
    <div class="w-2/3 mx-auto">
      <div class="bg-white shadow-md rounded my-6">
        <table class="text-left w-full border-collapse"> 
          <thead>
            <tr>
              <th class="py-4 px-6 bg-gray-200 font-bold uppercase text-sm text-grey-dark border-b border-grey-light">Brand Name</th>
              <th class="py-4 px-6 bg-gray-200 font-bold uppercase text-sm text-grey-dark border-b border-grey-light">Happiness %</th>
              <th class="py-4 px-6 bg-gray-200 font-bold uppercase text-sm text-grey-dark border-b border-grey-light">Date</th>
            </tr>
          </thead>
          <tbody>
            <tr class="hover:bg-grey-lighter" v-for="score in scores" :key="score.id" :score="score">
              <td class="py-4 px-6 border-b border-grey-light">{{ score.term }}</td>
              <td class="py-4 px-6 border-b border-grey-light">{{ score.percentage_score }}%</td>
              <td class="py-4 px-6 border-b border-grey-light">{{ score.friendly_date }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

</template>

<script>

  export default {
    name: 'scoreList',
    props: ['scores']
  }

</script>

<style scoped>
</style>
