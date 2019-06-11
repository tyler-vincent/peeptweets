<template>

  <div id="newscore">

    <div class="bg-white mx-auto max-w-sm shadow-lg rounded-lg overflow-hidden">
      <div class="items-center">

        <transition name="fade">
          <div class="loading"  v-if="loading">
            <div class="spinner"></div>
          </div>
        </transition>

        <div class="w-full block content-center">
            <scoreGauge :score="currentScore"></scoreGauge>
        </div>

        <div class="bg-gray-400 p-6">
          <div class="w-full text-center">
            <form v-on:submit.prevent="startAnalysis">
              <div class="max-w-sm mx-auto p-1 pr-0 flex items-center">
                <input v-model="term" id="term" class="flex-1 appearance-none rounded shadow p-3 text-grey-dark mr-2 focus:outline-none" type="text" placeholder="Type a brand name to begin" aria-label="Brand Name">
                <input type="submit" value="Go" class="object-center bg-indigo-500 hover:bg-indigo-700 border-indigo-500 hover:border-indigo-700 text-sm border-4 text-white p-2 rounded" />
              </div>
            </form>
          </div>
        </div>

      </div>
    </div>

  </div>

</template>

<script>

  import scoreGauge from './scoregauge.vue'

  export default {
    name: 'newScore',
    components: {
      scoreGauge
    },
    data: function () {
      return {
        term: "",
        result: [],
        loading: false,
        currentScore: 0
      }
    },
    methods: {
      startAnalysis: function (event) {
        this.loading = true
        this.$http.post('/brand_scores.json', {
          term: this.term
        })
          .then(response => { 
            this.result = response.data
            this.currentScore = response.data.percentage_score
            this.loading = false
          })
          .catch(error => this.setError(error, 'Unable to perform analysis'))
      }    
    }
  }

</script>

<style scoped>

  .fade-enter-active, .fade-leave-active {
    transition: opacity .5s;
  }

  .fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
    opacity: 0;
  }

  @keyframes spinner {
    to {transform: rotate(360deg);}
  }
     
  .spinner {
    position: relative;
  }

  .spinner:before {
    content: '';
    box-sizing: border-box;
    position: absolute;
    top: 50%;
    left: 50%;
    width: 50px;
    height: 50px;
    margin-top: -15px;
    margin-left: -15px;
    border-radius: 50%;
    border: 1px solid #ccc;
    border-top-color: #07d;
    animation: spinner .6s linear infinite;
  }

</style>
